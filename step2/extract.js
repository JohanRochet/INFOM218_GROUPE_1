const fs = require('fs');
const { Parser } = require('node-sql-parser');
const file = fs.readFileSync("android-logs", "utf-8");
const fileJSON = JSON.parse(file);
const messageStart = "/data/user/0/eu.siacs.conversations/databases/history:"
const messages = fileJSON["logcatMessages"]
    .filter(m => m.header.applicationId === "eu.siacs.conversations"
            && m.message.includes(messageStart));
let sql = "";
const parser = new Parser();
const map = new Map();

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
           const tables = ast[0].table;
           const table = tables[0].table.replace("kreplace", "key")
           if(!map.has(table)) map.set(table, new Map());
           const mapTable = map.get(table);
           const count = mapTable.get(ast[0].type) ?? 0;
           mapTable.set(ast[0].type, count + 1 );
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
                    if(!map.has(table)) map.set(table, new Map());
                    const mapTable = map.get(table);
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
console.log(map)
fs.writeFileSync("queries-log.sql", sql)