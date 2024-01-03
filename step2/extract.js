const fs = require('fs');
const { Parser } = require('node-sql-parser/build/sqlite');
const file = fs.readFileSync("logs-30_12_23", "utf-8");
const fileJSON = JSON.parse(file);
const messageStart = "/data/user/0/eu.siacs.conversations/databases/history:"
const messages = fileJSON["logcatMessages"]
    .filter(m => m.header.applicationId === "eu.siacs.conversations"
            && m.message.includes(messageStart));
let sql = "";
const parser = new Parser();
const actionUsageMap = new Map();
const usedColumns = new Map();

for (let {message} of messages) {
    // Remove log path
    message = message.replace(messageStart, "");
    try{
        message = message.trim();
        message = message.slice(1, message.length - 1);
        message = message.replace(/\\'/g, "''");
        message = message.replace(/key/g, "kreplace");
        message = message.replace(/\n/g, "");
    } catch (e) {
        console.log(message)
        console.error(e);


    }

    if(!message.includes("--") && !message.includes("PRAGMA")){
        sql += "-- sql query\n"
        if(message.at(-1) != ";") message += ";";
        sql += message + "\n";
        let astx;
       try {
           const ast = parser.astify(message);
           astx = JSON.stringify()

           if(ast[0].from){
               ast[0].table = ast[0].from;
           }
           const tables = ast[0].table;
           const table = tables[0].table.replace("kreplace", "key")
           if(!actionUsageMap.has(table)) actionUsageMap.set(table, new Map());
           const mapTable = actionUsageMap.get(table);
           const count = mapTable.get(ast[0].type) ?? 0;

           if(ast[0].columns){
               const columns = ast[0].columns;
               if(typeof columns === "string"){
                   const name = table + ":" + columns.replace("kreplace", "key") + ":" + ast[0].type;
                   const count = usedColumns.get(name) ?? 0;
                   usedColumns.set(name, count + 1 );
               }

               if( typeof columns === "object"){
                   for(let column of columns){
                       if(typeof column !== "string"){
                            if(column.expr.column){
                                column = column.expr.column;
                            }
                       }
                       const name = table + ":" + column.replace("kreplace", "key") + ":" + ast[0].type;
                       const count = usedColumns.get(name) ?? 0;
                       usedColumns.set(name, count + 1 );
                   }
               }
           }
           mapTable.set(ast[0].type, count + 1 );
           sql +=  `-- Columns : ${JSON.stringify(ast[0].columns ?? ast[0].set)}\n`;
       }
       catch (e) {
            sql += "-- ERROR: " + e + astx + "\n";
            let match;
            const matchers = [
                {regex: /^INSERT INTO ([a-zA-Z_]+)/i, type: "insert"},
                {regex: /^UPDATE ([a-zA-Z_]+)/i, type: "update"},
                {regex: /^DELETE FROM ([a-zA-Z_]+)/i, type: "delete"},
                {regex: /^SELECT .* FROM ([a-zA-Z_]+)/i, type: "select"},

            ]
            for (let {regex, type} of matchers) {
                match = message.match(regex);
                if(match){
                    const table = match[1].replace("kreplace", "key");
                    if(!actionUsageMap.has(table)) actionUsageMap.set(table, new Map());
                    const mapTable = actionUsageMap.get(table);
                    const count = mapTable.get(type) ?? 0;
                    mapTable.set(type, count + 1 );
                    sql += "-- Found workaround " + type + " " + table + "\n";
                    break;
                }
            }
            //console.log(e)
        }
    }
    
}
const usage = {
    actionsPerTable: Object.fromEntries(Array.from(actionUsageMap)
        .map(([key, value]) => [key, Object.fromEntries(value)])),
    actionsPerColumn: Object.fromEntries(usedColumns)
}
console.log(actionUsageMap);
console.log(usedColumns);
fs.writeFileSync("usage.json", JSON.stringify(usage, null, 4))
fs.writeFileSync("queries-log.sql", sql)