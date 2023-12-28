-- sql query
CREATE TABLE IF NOT EXISTS android_metadata (locale TEXT);
-- sql query
SELECT locale FROM android_metadata UNION SELECT NULL ORDER BY locale DESC LIMIT 1;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select android_metadata
-- sql query
BEGIN;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
DELETE FROM android_metadata;
-- sql query
INSERT INTO android_metadata (locale) VALUES('en_US');
-- sql query
REINDEX LOCALIZED;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "L" found.undefined
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
BEGIN EXCLUSIVE;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "E" found.undefined
-- sql query
create table accounts(uuid TEXT PRIMARY KEY,username TEXT,server TEXT,password TEXT,display_name TEXT, status TEXT,status_message TEXT,rosterversion TEXT,options NUMBER, avatar TEXT, kreplaces TEXT, hostname TEXT, resource TEXT,pinned_mechanism TEXT,pinned_channel_binding TEXT,fast_mechanism TEXT,fast_token TEXT,port NUMBER DEFAULT 5222);
-- ERROR: SyntaxError: Expected "#", "--", "->", "->>", ".", "/*", "BIGINT", "BINARY", "BIT", "CHAR", "DATE", "DATETIME", "DECIMAL", "DOUBLE", "ENUM", "FLOAT", "GEOMETRY", "GEOMETRYCOLLECTION", "INT", "INTEGER", "JSON", "LINESTRING", "LONGTEXT", "MEDIUMINT", "MEDIUMTEXT", "MULTILINESTRING", "MULTIPOINT", "MULTIPOLYGON", "NUMERIC", "POINT", "POLYGON", "SET", "SMALLINT", "TEXT", "TIME", "TIMESTAMP", "TINYINT", "TINYTEXT", "VARBINARY", "VARCHAR", "YEAR", "blob", "boolean", "longblob", "mediumblob", "tinyblob", or [ \t\n\r] but "N" found.undefined
-- sql query
create table conversations (uuid TEXT PRIMARY KEY, name TEXT, contactUuid TEXT, accountUuid TEXT, contactJid TEXT, created NUMBER, status NUMBER, mode NUMBER, attributes TEXT, FOREIGN KEY(accountUuid) REFERENCES accounts(uuid) ON DELETE CASCADE);
-- ERROR: SyntaxError: Expected "#", "--", "->", "->>", ".", "/*", "BIGINT", "BINARY", "BIT", "CHAR", "DATE", "DATETIME", "DECIMAL", "DOUBLE", "ENUM", "FLOAT", "GEOMETRY", "GEOMETRYCOLLECTION", "INT", "INTEGER", "JSON", "LINESTRING", "LONGTEXT", "MEDIUMINT", "MEDIUMTEXT", "MULTILINESTRING", "MULTIPOINT", "MULTIPOLYGON", "NUMERIC", "POINT", "POLYGON", "SET", "SMALLINT", "TEXT", "TIME", "TIMESTAMP", "TINYINT", "TINYTEXT", "VARBINARY", "VARCHAR", "YEAR", "blob", "boolean", "longblob", "mediumblob", "tinyblob", or [ \t\n\r] but "N" found.undefined
-- sql query
create table messages( uuid TEXT PRIMARY KEY, conversationUuid TEXT, timeSent NUMBER, counterpart TEXT, trueCounterpart TEXT,body TEXT, encryption NUMBER, status NUMBER,type NUMBER, relativeFilePath TEXT, serverMsgId TEXT, axolotl_fingerprint TEXT, carbon INTEGER, edited TEXT, read NUMBER DEFAULT 1, oob INTEGER, errorMsg TEXT,readByMarkers TEXT,markable NUMBER DEFAULT 0,deleted NUMBER DEFAULT 0,bodyLanguage TEXT,remoteMsgId TEXT, FOREIGN KEY(conversationUuid) REFERENCES conversations(uuid) ON DELETE CASCADE);
-- ERROR: SyntaxError: Expected "#", "--", "->", "->>", ".", "/*", "BIGINT", "BINARY", "BIT", "CHAR", "DATE", "DATETIME", "DECIMAL", "DOUBLE", "ENUM", "FLOAT", "GEOMETRY", "GEOMETRYCOLLECTION", "INT", "INTEGER", "JSON", "LINESTRING", "LONGTEXT", "MEDIUMINT", "MEDIUMTEXT", "MULTILINESTRING", "MULTIPOINT", "MULTIPOLYGON", "NUMERIC", "POINT", "POLYGON", "SET", "SMALLINT", "TEXT", "TIME", "TIMESTAMP", "TINYINT", "TINYTEXT", "VARBINARY", "VARCHAR", "YEAR", "blob", "boolean", "longblob", "mediumblob", "tinyblob", or [ \t\n\r] but "N" found.undefined
-- sql query
CREATE INDEX message_time_index ON messages(timeSent);
-- ERROR: TypeError: Cannot read properties of undefined (reading 'table')undefined
-- sql query
CREATE INDEX message_conversation_index ON messages(conversationUuid);
-- ERROR: TypeError: Cannot read properties of undefined (reading 'table')undefined
-- sql query
CREATE INDEX message_deleted_index ON messages(deleted);
-- ERROR: TypeError: Cannot read properties of undefined (reading 'table')undefined
-- sql query
CREATE INDEX message_file_path_index ON messages(relativeFilePath);
-- ERROR: TypeError: Cannot read properties of undefined (reading 'table')undefined
-- sql query
CREATE INDEX message_type_index ON messages(type);
-- ERROR: TypeError: Cannot read properties of undefined (reading 'table')undefined
-- sql query
create table contacts(accountUuid TEXT, servername TEXT, systemname TEXT,presence_name TEXT,jid TEXT,pgpkreplace TEXT,photouri TEXT,options NUMBER,systemaccount NUMBER, avatar TEXT, last_presence TEXT, last_time NUMBER, rtpCapability TEXT,groups TEXT, FOREIGN KEY(accountUuid) REFERENCES accounts(uuid) ON DELETE CASCADE, UNIQUE(accountUuid, jid) ON CONFLICT REPLACE);
-- ERROR: SyntaxError: Expected "#", "--", "->", "->>", ".", "/*", "BIGINT", "BINARY", "BIT", "CHAR", "DATE", "DATETIME", "DECIMAL", "DOUBLE", "ENUM", "FLOAT", "GEOMETRY", "GEOMETRYCOLLECTION", "INT", "INTEGER", "JSON", "LINESTRING", "LONGTEXT", "MEDIUMINT", "MEDIUMTEXT", "MULTILINESTRING", "MULTIPOINT", "MULTIPOLYGON", "NUMERIC", "POINT", "POLYGON", "SET", "SMALLINT", "TEXT", "TIME", "TIMESTAMP", "TINYINT", "TINYTEXT", "VARBINARY", "VARCHAR", "YEAR", "blob", "boolean", "longblob", "mediumblob", "tinyblob", or [ \t\n\r] but "N" found.undefined
-- sql query
create table discovery_results(hash TEXT, ver TEXT, result TEXT, UNIQUE(hash, ver) ON CONFLICT REPLACE);
-- ERROR: SyntaxError: Expected "#", ")", ",", "--", "/*", "COMMENT", "INVISIBLE", "KEY_BLOCK_SIZE", "USING", "VISIBLE", "WITH", or [ \t\n\r] but "O" found.undefined
-- sql query
CREATE TABLE sessions(account TEXT,  name TEXT, device_id INTEGER, kreplace TEXT, FOREIGN KEY(account) REFERENCES accounts(uuid) ON DELETE CASCADE, UNIQUE( account, name, device_id) ON CONFLICT REPLACE);
-- ERROR: SyntaxError: Expected "#", ")", ",", "--", "/*", "COMMENT", "INVISIBLE", "KEY_BLOCK_SIZE", "USING", "VISIBLE", "WITH", or [ \t\n\r] but "O" found.undefined
-- sql query
CREATE TABLE prekreplaces(account TEXT,  id INTEGER, kreplace TEXT, FOREIGN KEY(account) REFERENCES accounts(uuid) ON DELETE CASCADE, UNIQUE( account, id) ON CONFLICT REPLACE);
-- ERROR: SyntaxError: Expected "#", ")", ",", "--", "/*", "COMMENT", "INVISIBLE", "KEY_BLOCK_SIZE", "USING", "VISIBLE", "WITH", or [ \t\n\r] but "O" found.undefined
-- sql query
CREATE TABLE signed_prekreplaces(account TEXT,  id INTEGER, kreplace TEXT, FOREIGN KEY(account) REFERENCES accounts(uuid) ON DELETE CASCADE, UNIQUE( account, id) ON CONFLICT REPLACE);
-- ERROR: SyntaxError: Expected "#", ")", ",", "--", "/*", "COMMENT", "INVISIBLE", "KEY_BLOCK_SIZE", "USING", "VISIBLE", "WITH", or [ \t\n\r] but "O" found.undefined
-- sql query
CREATE TABLE identities(account TEXT,  name TEXT, ownkreplace INTEGER, fingerprint TEXT, certificate BLOB, trust TEXT, active NUMBER, last_activation NUMBER,kreplace TEXT, FOREIGN KEY(account) REFERENCES accounts(uuid) ON DELETE CASCADE, UNIQUE( account, name, fingerprint) ON CONFLICT IGNORE);
-- ERROR: SyntaxError: Expected "#", "--", "->", "->>", ".", "/*", "BIGINT", "BINARY", "BIT", "CHAR", "DATE", "DATETIME", "DECIMAL", "DOUBLE", "ENUM", "FLOAT", "GEOMETRY", "GEOMETRYCOLLECTION", "INT", "INTEGER", "JSON", "LINESTRING", "LONGTEXT", "MEDIUMINT", "MEDIUMTEXT", "MULTILINESTRING", "MULTIPOINT", "MULTIPOLYGON", "NUMERIC", "POINT", "POLYGON", "SET", "SMALLINT", "TEXT", "TIME", "TIMESTAMP", "TINYINT", "TINYTEXT", "VARBINARY", "VARCHAR", "YEAR", "blob", "boolean", "longblob", "mediumblob", "tinyblob", or [ \t\n\r] but "N" found.undefined
-- sql query
CREATE TABLE presence_templates(uuid TEXT, last_used NUMBER,message TEXT,status TEXT,UNIQUE(message,status) ON CONFLICT REPLACE);
-- ERROR: SyntaxError: Expected "#", "--", "->", "->>", ".", "/*", "BIGINT", "BINARY", "BIT", "CHAR", "DATE", "DATETIME", "DECIMAL", "DOUBLE", "ENUM", "FLOAT", "GEOMETRY", "GEOMETRYCOLLECTION", "INT", "INTEGER", "JSON", "LINESTRING", "LONGTEXT", "MEDIUMINT", "MEDIUMTEXT", "MULTILINESTRING", "MULTIPOINT", "MULTIPOLYGON", "NUMERIC", "POINT", "POLYGON", "SET", "SMALLINT", "TEXT", "TIME", "TIMESTAMP", "TINYINT", "TINYTEXT", "VARBINARY", "VARCHAR", "YEAR", "blob", "boolean", "longblob", "mediumblob", "tinyblob", or [ \t\n\r] but "N" found.undefined
-- sql query
create table resolver_results(domain TEXT,hostname TEXT,ip BLOB,priority NUMBER,directTls NUMBER,authenticated NUMBER,port NUMBER,UNIQUE(domain) ON CONFLICT REPLACE);
-- ERROR: SyntaxError: Expected "#", "--", "->", "->>", ".", "/*", "BIGINT", "BINARY", "BIT", "CHAR", "DATE", "DATETIME", "DECIMAL", "DOUBLE", "ENUM", "FLOAT", "GEOMETRY", "GEOMETRYCOLLECTION", "INT", "INTEGER", "JSON", "LINESTRING", "LONGTEXT", "MEDIUMINT", "MEDIUMTEXT", "MULTILINESTRING", "MULTIPOINT", "MULTIPOLYGON", "NUMERIC", "POINT", "POLYGON", "SET", "SMALLINT", "TEXT", "TIME", "TIMESTAMP", "TINYINT", "TINYTEXT", "VARBINARY", "VARCHAR", "YEAR", "blob", "boolean", "longblob", "mediumblob", "tinyblob", or [ \t\n\r] but "N" found.undefined
-- sql query
CREATE VIRTUAL TABLE messages_index USING fts4 (uuid,body,notindexed="uuid",content="messages",tokenize='unicode61');
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", "ALGORITHM", "DATABASE", "DEFINER", "FULLTEXT", "INDEX", "OR", "SCHEMA", "SPATIAL", "SQL", "TABLE", "TEMPORARY", "TRIGGER", "UNIQUE", "VIEW", or [ \t\n\r] but "V" found.undefined
-- sql query
CREATE TRIGGER after_message_insert AFTER INSERT ON messages BEGIN INSERT INTO messages_index(rowid,uuid,body) VALUES(NEW.rowid,NEW.uuid,NEW.body); END;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", "FOR", or [ \t\n\r] but "B" found.undefined
-- sql query
CREATE TRIGGER after_message_update UPDATE OF uuid,body ON messages BEGIN UPDATE messages_index SET body=NEW.body,uuid=NEW.uuid WHERE rowid=OLD.rowid; END;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", "AFTER", "BEFORE", or [ \t\n\r] but "U" found.undefined
-- sql query
CREATE TRIGGER after_message_delete AFTER DELETE ON messages BEGIN DELETE FROM messages_index WHERE rowid=OLD.rowid; END;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", "FOR", or [ \t\n\r] but "B" found.undefined
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
SELECT * FROM accounts;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select accounts
-- sql query
select * from conversations where status = '0' and contactJid is not null order by created desc;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select conversations
-- sql query
select conversations.accountUuid,conversations.contactJid from conversations join messages on conversations.uuid=messages.conversationUuid where messages.status!=0 and carbon==0  and conversations.mode=0 and messages.timeSent>='1701183795353' group by conversations.uuid order by count(body) desc limit 4;
-- ERROR: SyntaxError: Expected "!", "#", "$", "'", "(", "+", "-", "--", "/*", "0x", ":", "?", "@", "@@", "AVG", "CASE", "CAST", "COUNT", "CURRENT_DATE", "CURRENT_TIME", "CURRENT_TIMESTAMP", "CURRENT_USER", "DATE", "DATETIME", "DATE_TRUNC", "EXTRACT", "FALSE", "GROUP_CONCAT", "INTERVAL", "MATCH", "MAX", "MIN", "N", "NULL", "SESSION_USER", "SUM", "SYSTEM_USER", "TIME", "TIMESTAMP", "TRUE", "USER", "X", "\"", "_binary", "_latin1", "`", "b", "binary", "convert", "trim", "~", [ \t\n\r], [0-9], or [A-Za-z_] but "=" found.undefined
-- Found workaround select conversations
-- sql query
SELECT uuid, relativeFilePath, deleted FROM messages WHERE type in (1,2,5) and relativeFilePath is not null;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select messages
-- sql query
UPDATE accounts SET avatar=NULL,options=22,server='conversations.im',status=NULL,fast_token=NULL,resource=NULL,hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism=NULL,fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
SELECT device_id FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'test-user-sloir@conversations.im';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
SELECT DISTINCT name FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
INSERT INTO accounts(avatar,options,server,status,fast_token,resource,hostname,username,status_message,rosterversion,kreplaces,port,uuid,pinned_mechanism,fast_mechanism,password,pinned_channel_binding,display_name) VALUES (NULL,22,'conversations.im',NULL,NULL,NULL,NULL,'test-user-sloir',NULL,NULL,'{"axolotl_reg_id":"265886875"}',5222,'bd8f918b-0e34-4f36-973e-b9eb58bf511a',NULL,NULL,'ywqyRyGkGRuo',NULL,NULL);
-- sql query
UPDATE accounts SET avatar=NULL,options=20,server='conversations.im',status=NULL,fast_token=NULL,resource=NULL,hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism=NULL,fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
UPDATE accounts SET avatar=NULL,options=20,server='conversations.im',status=NULL,fast_token=NULL,resource=NULL,hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism=NULL,fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
SELECT * FROM resolver_results WHERE domain='conversations.im';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select resolver_results
-- sql query
INSERT INTO resolver_results(domain,priority,directTls,hostname,ip,port,authenticated) VALUES ('conversations.im',0,0,'conversations.im',NULL,5222,0);
-- sql query
UPDATE accounts SET avatar=NULL,options=16,server='conversations.im',status=NULL,fast_token=NULL,resource=NULL,hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism=NULL,fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
SELECT * FROM resolver_results WHERE domain='conversations.im';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select resolver_results
-- sql query
UPDATE accounts SET avatar=NULL,options=16,server='conversations.im',status=NULL,fast_token=NULL,resource=NULL,hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
SELECT * FROM discovery_results WHERE hash='sha-1' AND ver='zF7kIBi+9w4pT8o7XCxaAnKMo3I=';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select discovery_results
-- sql query
INSERT INTO discovery_results(result,ver,hash) VALUES ('{"identities":[{"category":"pubsub","type":"pep"},{"category":"server","type":"im","name":"Conversations.IM Server"}],"features":["http:\/\/jabber.org\/protocol\/commands","http:\/\/jabber.org\/protocol\/disco#info","http:\/\/jabber.org\/protocol\/disco#items","http:\/\/jabber.org\/protocol\/offline","http:\/\/jabber.org\/protocol\/pubsub","http:\/\/jabber.org\/protocol\/pubsub#access-open","http:\/\/jabber.org\/protocol\/pubsub#access-presence","http:\/\/jabber.org\/protocol\/pubsub#access-whitelist","http:\/\/jabber.org\/protocol\/pubsub#auto-create","http:\/\/jabber.org\/protocol\/pubsub#auto-subscribe","http:\/\/jabber.org\/protocol\/pubsub#collections","http:\/\/jabber.org\/protocol\/pubsub#config-node","http:\/\/jabber.org\/protocol\/pubsub#create-and-configure","http:\/\/jabber.org\/protocol\/pubsub#create-nodes","http:\/\/jabber.org\/protocol\/pubsub#delete-items","http:\/\/jabber.org\/pro;
-- ERROR: SyntaxError: Expected "'", "''", "\"\"", "\\", "\\'", "\\/", "\\\"", "\\\\", "\\b", "\\f", "\\n", "\\r", "\\t", "\\u", "``", [^'\\], or [^'] but end of input found.undefined
-- Found workaround insert discovery_results
-- sql query
select messages.timeSent,messages.serverMsgId from accounts join conversations on accounts.uuid=conversations.accountUuid join messages on conversations.uuid=messages.conversationUuid where accounts.uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' and (messages.status=0 or messages.carbon=1 or messages.serverMsgId not null) and (conversations.mode=0 or (messages.serverMsgId not null and messages.type=4)) order by messages.timesent desc limit 1;
-- ERROR: SyntaxError: Expected "#", "--", "/*", "BETWEEN", "IN", "LIKE", "REGEXP", "RLIKE", or [ \t\n\r] but "n" found.undefined
-- Found workaround select accounts
-- sql query
SELECT attributes FROM conversations WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select conversations
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'test-user-sloir@conversations.im' AND ownkreplace = '1';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
UPDATE identities SET active=1,fingerprint='052528d38f8db87ecb016bce8f88cd9077f0253c70954c78f7df231f9837748e20',account='bd8f918b-0e34-4f36-973e-b9eb58bf511a',ownkreplace=1,kreplace='CiEFJSjTj424fssBa86PiM2Qd/AlPHCVTHj33yMfmDd0jiASIPBip/GQ8x6MIRXm/7xGvNwkxlSj3C3XOk+2Z0R2x/pV',name='test-user-sloir@conversations.im',trust='VERIFIED' WHERE account='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name='test-user-sloir@conversations.im' AND fingerprint ='052528d38f8db87ecb016bce8f88cd9077f0253c70954c78f7df231f9837748e20';
-- sql query
INSERT INTO identities(active,fingerprint,account,ownkreplace,kreplace,name,trust) VALUES (1,'052528d38f8db87ecb016bce8f88cd9077f0253c70954c78f7df231f9837748e20','bd8f918b-0e34-4f36-973e-b9eb58bf511a',1,'CiEFJSjTj424fssBa86PiM2Qd/AlPHCVTHj33yMfmDd0jiASIPBip/GQ8x6MIRXm/7xGvNwkxlSj3C3XOk+2Z0R2x/pV','test-user-sloir@conversations.im','VERIFIED');
-- sql query
SELECT count(kreplace) FROM signed_prekreplaces WHERE account='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select signed_prekeys
-- sql query
SELECT kreplace FROM signed_prekreplaces WHERE account='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND id='-1';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select signed_prekeys
-- sql query
INSERT INTO signed_prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',1,'CAESIQVbMkuoxrfcV8jR0Co7ND+dMWGaXUBQdVamYFbuuqywOxogaOoB2MwrPAfoAxpd7xjE0PNOrda4edgilCuzGtP1TVMiQB3v+mZ3yvNCOmX3+YQ6JAe74rshIqA4NbClRUx++D+1zcyZ1PtEyknYCytptIVrFu58GHdCaX30Scaq/taycQ0piGz0sIwBAAA=');
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',1,'CAESIQWM1b0sZw2Zt6Mq8rfWOhuc4pHfQUdvZ/qV8M6TgKs6LRogmHzTeGfy8ZeFngevo8QTMc5//hak3LcFvHwaDHNAUE0=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"1"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',2,'CAISIQXPcdPOizA8JofXMrYKOjS88PWcmtbN9DpAq7ime2LpMhogWFBkR28dX6nDHoZdGv5ri/q+pzPUnmsYX+ysIOD8tn8=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"2"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',3,'CAMSIQVpqEjziRrlXygPQ8wLBSH7a2Pd94TyttzZ3IN+rGYQZBogYArKq513hzq3NH2tLLcfuH8ZAIrAMo3llSQ8R48qGVw=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"3"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',4,'CAQSIQX+7GY3t57M4d+Dzut7o7TZznE3cJIzxIqa9qz2R2TCEBogyP51c6IffreKXQzDAh4GGP8H8KDXFgQpVfWeOjCbRmA=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"4"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',5,'CAUSIQWsKCnuR3VHC2vVhToiYdFIunEGkXpM9RQe9+z2NJo+WRog0GViPdZxboYbrZEjOzdnKc772xStskPpKrLsCFWppFk=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"5"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',6,'CAYSIQXjA6QCqXm19fj5wGeRA0bFQ6LKwXoFjjGGrRrbQVDIPhogUCPAjArnD9Krk2DUs/Ds6nKZlkWMRmgbP3QPtsHehF0=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"6"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',7,'CAcSIQW2AoWgKHNQDLxameAgoItGyBxrJmudQUMcI6c58wS8cRogQFEKpK7kk10034z+vsdDR4L6bPEVSM7sREjEgfGr/1E=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"7"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',8,'CAgSIQUZvPfczI9rxpKg0jHZwQs9/fP9pr07sv6mJs7xsbmHURogwCJh0/BIc5udxSAR2E5OyqgfGQ+BGoDhK4rvgbYo6HQ=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"8"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',9,'CAkSIQUbqHl84cTjPRlHawN2EDTPHRAwiW19N5ym3l90T7VaJxogeLjzsb5NqLRhOKfWsjH/cc43YEOmoswEGmFRlWmHoFU=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"9"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',10,'CAoSIQWCMezwxQ5rrULPstusqhwM+n8s9+a9b8Y3yVtL+W+FERogYG9v5ecnSTMs2F8GgU0uGmDPE903DpC0kTyVxb7u90g=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"10"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',11,'CAsSIQVVGNen8/mBkf4KK/VCHzHeUGsso9woYPqPieSmx+pGfBogQHgw1HXCH0KOHkyAofFDJTS01HVW1Uwr/c0KJt3yVVw=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"11"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',12,'CAwSIQW2cvhCi9THctW94LiVLJzEPS0mQlxYqW4RDuCfatGYJxog6DSs9RYp5HtYK6gP9eb4KBXk9EPpviaNVMfbBsfmB1U=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"12"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',13,'CA0SIQVU7ekP/5csPE/1srnosJAtD8dmil+rmrkKmlv78cMoLRogoOfX8/BaaXYp9Mp9rNE58PwcX+B3T+soCZyBqlv8GVQ=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"13"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',14,'CA4SIQX7H8ozMSeYTVOLQOpSGtx9PMuWqkewYrqhNyPDvRKiVRogMJ06cmHWVptd/i9CE12wxbcqGnMmVlXXtLApqoWha2I=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"14"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',15,'CA8SIQUHS5AJDyrMmw0WwASeVh6/l8vzcepZPnDqKts423UtJBogSF4t29QWSnyoWphyhO4UKPSvej/xcoLvMBa7UjNPlGo=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"15"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',16,'CBASIQWu7m+GZv6H/K2ROJNrVHxv5TNOJxrMIEoyiy69d6cPTBogSF+gmtLhAsadCNqsVMlTJZ+hFzncazHxT5pWX5tMkXk=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"16"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',17,'CBESIQUwZ16FZZmE0N8bpIdZFmL2Zh0VbvtCLPfp39KM0b0/NxogeOBXS+jOEgvtbED0lqBhWNMtfkL8uiJ1h9eXdrZIpXs=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"17"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',18,'CBISIQUdpCSdvoNtT2+rbAZ2v08m/CMQo3TkTVTAvaPKx5jtahogGI9r5mQh1M5OfsYGvsyjBiIKBV5Mpzy02FgNbbPXA34=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"18"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',19,'CBMSIQV5Vbjh5XRVLMCwQJKJE38JsYf51MmCk8Px3xVETGGgaxogYKHXAA4MzOXrVi/VZD6bfa0cowbk1OYcJI3LvNyyVHs=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"19"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',20,'CBQSIQUbNNrz3VzXBtU7CFH9bW8eFGw2lBjNahrEbBxlXh78cxogIPC/zt/o8cRbZOGqG6spotbt5GxYBYiKLp5ZTKoF3ks=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"20"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',21,'CBUSIQXmCattzsP/4nkPMoNU/IXdXvK+PR63JuD+fyiUgiPtSRogKC9t1YJ7JNoRrTh3fcieWhggTKQEGaN296K//I6m80s=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"21"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',22,'CBYSIQWBbT2d/Cuy63HCxzDoagyJEwANJ9E7iGQW1d006XQjGxogoD5c4XymZPTvJa0S+6EhCfVe95X7ku8ZZuGEna7Xmkk=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"22"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',23,'CBcSIQX4Hj5JrlTCP2MoPDtCD3i8FCDOOV+MbKyv/jsJ0GllfRog0Id7uMfNuPuHkx4olQOv268s9KSB5MxfCrWNs9MV4E4=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"23"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',24,'CBgSIQVtxsiiqX6eefOT2O87dKGV9HzBUrBkd088ad80AxYLVRogCO7A8wdmtbSGUdwAYgfQDBLebjhjGZhrLrZmp83wJmA=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"24"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',25,'CBkSIQWP+SlnLjz5ZekFYU+vuLSMSlz13qwErLvedPoBZhVXOxogOLiE5GelANgtTEZRr8jorCXHcSHiTEJlWMhLBM1Lxmc=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"25"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',26,'CBoSIQVQjtvds92z3P7lW34uLznzhgI9G+1kvE/c5vihyWn+eBogkLHO3ejXdrfJ0EXx9eM+86zS1h8hqPDVntDT6yVBE3c=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"26"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',27,'CBsSIQXigwqSpKYELxr1mrB6YSQZOD9nVoWTdv5yTupA2rZcUhogQD+mGaG32m7teDLAKRWY57XS4gsijaoVp2/tXLdAm1U=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"27"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',28,'CBwSIQUeZvqLfVUIQy2x/a/9QiI5v4+J74CmLQi4FnetsXv7BhogIDZwAAJ8Xl7VJFHHy+8cAXBKzpbc542X41dv+dzhYVA=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"28"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',29,'CB0SIQX+K4eIbLUaCfX0Q86JM5i3QLQZXNwxWaaU72F3Wx4WCxog+LIw9a3BW2qTjZs1pUmt50FT2mCxmYCFyyM+Tlp4a34=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"29"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',30,'CB4SIQWQjYOMLk9b9IjBsUpUlKU4oUovPuuzap8HIT+coAK+MxoggNK/aMNFI+2rfu75JXa/O/+DwoLP8USbQEc9FfKhJkQ=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"30"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',31,'CB8SIQX/nDizWHMnd142bWt4/85HJw1IoHT0AAHRqUt8uO6VYxog2EpkBs+Pxkb6/8q1IghoThVIi7QbqT9RR/nLVES8WEY=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"31"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',32,'CCASIQV+q8Cl+UJcWxPIAbkoAxL1kYzxQF7P2q44QQGb8P6wEBoggGArlSQdevfDS+QH5Ya95NFqndjUn1w22blcsbjOAEo=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"32"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',33,'CCESIQWnlVuFrcF/xiEPGc2VM/G2qX2Cemh4C2VYERykpZ+nexogyIjgxbA4IYz+WKZT1fUk4vK1UnEYJsJN3VcuGfHeHX0=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"33"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',34,'CCISIQU9BkI9xoCL7GHIEjNDd35mb+A7iyYnSZ9t1DNB4FRmeBogKIekHN18bEMCPK8f/CeysK/29YBIyPszE4PpqJIrzW4=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"34"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',35,'CCMSIQXek5u5p42dT7JRAKRRqEIj8lVVhDwW80WARMin9f1CLRog0NKoerCZvCQRdOxupJSCnM1+3VgQIjHLTkGPM1ByYlQ=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"35"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',36,'CCQSIQXCqLeD/S08hDKHZ0DYrZbvLy2FYCKaMuWYP0qT6fZldxogCE+PXwTsMTJ8cecoPbykQ9AwmwR6MwziYo/qdYux9nM=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"36"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',37,'CCUSIQV7WTlqmkqZmHtZmXPpQSUUtO7fYDKD3kLz3DJlXkSPMBogcNuNGDVROb4HGu+BXzJrQ4XDzPeVmNBmQckZ2/TP/2I=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"37"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',38,'CCYSIQV1BlFyRp3LxcY1luvJE+XlNt/got0usk/YocaY3Z9xPRogyG+BqLxe0LplFJyB15hvPd4IPmYknulB//vVGGAu+Gw=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"38"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',39,'CCcSIQUa6GbS7562RhrJzlhDsie392JFo4tAYchGMkNaJggZRRog0FBKroodJX1qjTWzPwMtsq9oOCyzHNZmXhnAQU3nXX0=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"39"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',40,'CCgSIQXAkIbcqw5kyLNoRcw9txVR51EIXpXRe9xCVWCZqVPWHxog4FmPkA80rTotmFJZVZ2E+nE08lPadu01oYqNowcYzGY=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"40"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',41,'CCkSIQVbok7QSg3cFg6XdZw7RpOwkW/txiSzXILP8E+Tz1CbWhogwGmjWszK79syvGUQqgCwGhwDbhXOS7/IVcH0wWo8QHk=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"41"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',42,'CCoSIQVjvVnXfIc7GtTI+NZnVpuEwhvZuTKJpdbqCM6zw9JwJRogSFABLCTOmmESpr9xF8ru5upEb0fftjXzBhVXlq4oP28=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"42"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',43,'CCsSIQUtxCthcTe+B3khli2jWds36ltYaF1MR2pCxrOpPQwEDhog2BUKtCee0mz2eAxQlj8zvGV3bt273cCy1wwoIrZpW3I=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"43"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',44,'CCwSIQXTxawEzY9M0EdXYy9QqXD8HOxh+nh96byAJGORNIDUOhogyGPNifbdm3VrY+e2Rud8mqrNNvCGg41SoS4Cfh+krFg=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"44"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',45,'CC0SIQXlrrvWyCBZFxeDuUdnmDh1++hbjme7Qt1fn9P6K+5SMRogSHyYDr59SvTmDgMja+kFbJIaDivBEX88zcZIAxqqiWQ=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"45"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',46,'CC4SIQX9BnBf8RHqkyxktMjL7kVwMkZ6cHwBy/GEVqrXDTA8Txog+F4qfRDNt9hix5dh+w24x2NHzJWeUYDhDF63ttyQAk8=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"46"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',47,'CC8SIQUm2VwdrXvWk+0nMV0GGaBbpLAK4PZJAg1uITIthLXjLRog4AWdVl200UZjGu8nhZD7YxY9SHjPTKl3CvnUkFGciXY=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"47"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',48,'CDASIQVClmz/WP0S6wI7GcTiXW98Eks51er7Cg08InJllBEuMBogeD0S6SCxLvB+0TBJngf8nAkX4Zlz8UjuMC7sGL9Qv2Y=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"48"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',49,'CDESIQX7Gow836cI+oDsxDa849kn1XO9c8qhImvd6RgoIgkhZhogUPeDc7Q4fWhnNEYOzFMO1eXal2lpEJiOxpsioqbd8lQ=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"49"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',50,'CDISIQVNsEbNLLwXECAXH38z58/XZNo4GQibU9UvsF8dWErNERogeAh+639AUCR47ovYcC6z5/FOmYnYpxiFZdPgPXOOJ10=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"50"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',51,'CDMSIQVuhl/0MpfDdGd0/PGfiS9Z6ybOTNELiLeq84WCodMPLBogME9N0uQ1T1ES8tjFDLJuVVbndSieDJ4KtEAXpVzKfms=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"51"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',52,'CDQSIQWOwJ9aGWfpRpQBCPn6vJCu7ZSbAhdd/VDUeBbUg9JVQxog+EfxZYG62kGNxPBt4O2YMQPOgJW5WV2LvpWtku9t0XM=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"52"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',53,'CDUSIQX/IdCRL6TyuBDuyxQqo5V4vLt73xj2pfpCS9iNAfh0QRogmK7DVcjXMTVhEAAg0ikxqFLQ0mKqUQXK9rY5oO9l2FU=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"53"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',54,'CDYSIQWK4NYx2dbSoQ0R5mjHcCoDPFc2cTzP7L7TngXtH0FBVxogeDcSPmxCaucuji6cmic8PrtzxGhCFb6VNokXHPbpGko=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"54"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',55,'CDcSIQVQT7su1lRHkef9crB/xT3F0kU+25xiInfggVGSrpvbGRogwAhYbAK7w2voiSU/K656dM0pkl5AUrmMHbpGE+GBwmE=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"55"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',56,'CDgSIQU3Ft7JdNQG/zAlAPuGY5rH/ulxNs/W0LlNx+uGLgYALhogEL9WGWQAGEe3m+MJWByPCBtEjTpSR6liVrlUJKFrXXo=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"56"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',57,'CDkSIQWaW15iTbRBS1+NeMSj6CcT85NnZ/9NDm3bnXVsDFVJLhogqLOAUUMlU4MDShWfy/erecaSNsQ9uBeuGoZWptBm43o=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"57"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',58,'CDoSIQUKkWFaCeDanwlQLXG14FTD+IaoskaQ9kgx1vh6/dmRLhogcMrh9ZQ+pIGnWTwF9OHTeYXzysmYcWMGXCGHqKMih3Y=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"58"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',59,'CDsSIQXQ9KC6ic801D5p25S17PsHppmhQyKShzlr1T0OnOB6TRogEASe0VlWp127uhnuG3u7dtgKN7WeGyTo1DN1IpDMqF8=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"59"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',60,'CDwSIQUvxJJDBklBaPLNjzDE/7OI7PpXPgtxkIzssZSHW8ZeSxogIDWmMJqdgPJGxAHaIIvVd34hs9D65rRlw9belDtIs3s=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"60"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',61,'CD0SIQWcKdSZE2O8xb1NhI3LW3NCzHOanzAnUKWGqBiIrHz9DRogcIyDuyOMxxfGWJjy7fixCMH/1svYtTJemFHJhbzdgk0=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"61"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',62,'CD4SIQUzzKFNELFO6ULRZ0dtmsT08B4092iRQu0z4EIfhuZnQRog6MVQ0/Ef3yEC3dQMfVVSqnsGG4QQ+0xOcnovtYd/nGE=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"62"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',63,'CD8SIQWfU8c9NDDf+Su54w85Urp10N7psLzWwPDBKwTxPJ91JBoggKMHbuElnmFcNNPX1Pw1pRx3irivsRjql7PZYccPw2s=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"63"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',64,'CEASIQWUIxhwx4vinQPBpEf7ICjzJbxfMyVxrVNUeKwMx4jnchog6JyDErrKci+Pz75nPJuDVS38OD7mOnKrAVTaUcA31Hc=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"64"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',65,'CEESIQVhcZg937GaTQEeR1unaHHG+JCpicDMWRbAXq0PLjBNNBogwESMv7byF09kXQR4FbGi0QnnAlCROXQLWiyhzozDqWU=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"65"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',66,'CEISIQU2MIBelSyt1iYoOapOSbqS8VeoZX4izJ2eQd+pvrn5LhogYDNqncsyRuty7LpAkt/K5rL8IqKuJZVqti/DTWcWbHc=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"66"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',67,'CEMSIQXZQe+jZfZhgRwr6xAtFqGNzSn44/3EqqzJZneCu1aMHBogCO3YbrfxD8px6PN4g4N9bk7dqYIhhx33gjCZd2hjq0c=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"67"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',68,'CEQSIQWOgkea/tsfKvRSil8a30qS/6R/iN7rwDFxjdywDxPMThogYOe7gvx+KGPRCULdNt/c5WgKoBdtD4DIU1iB12fBe1g=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"68"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',69,'CEUSIQWUk4nY1WPSY9nM+ZePWFccb3xWMpNxHXCIE23T0EquLRog+HpSMv43uxOzXbNCCWAq8USLlFTCIYh/6EGrbGCJPkc=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"69"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',70,'CEYSIQWQXxCgpJlclNSLvwQfbJmynQ+f4RWrnjzNDJ8mvCGwSBogCLJ9t3yjoxfMYknuM0DaDRApk7yxIVkY+li9YEbRL1g=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"70"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',71,'CEcSIQW7itYWoZgD81pcj4y5rnwC7MVa0ajJDj2aPrDt5l8QGhogAA6A+7bu1Hd+i5ssjmkMb+NASxPh3f87t20ve3W1cmE=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"71"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',72,'CEgSIQUWmzQE7vl9dDdnV94G/wdG7S64mMx/uf6tFotlDUnmVBog8FFYt0Afz7dUzfq2Bk4U0wLRSKLr1rfq+vAeMBL92XE=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"72"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',73,'CEkSIQU9ZjAGUzygdQRZjNiTpOp7YVwuRPZk278EzIx7PJe2BBogCJpBPIzYvme0IjsL3yZoUXHO7Iei489ZLX41jNd9E3k=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"73"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',74,'CEoSIQV3x07b63kD7oXyjnle9dPE7TCSx5zhov2GsQeTkh1pYBogSNXFm9yxzad/uUfatcD7BP3ftYfSj6iO8WnadtTty00=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"74"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',75,'CEsSIQWUwH/MnpDUpcZG43Mxu4tAuE89MCFoK7Vm4LeDtX89JRogGL2uBPrYLpMfu6MgWLX5cm2InHT3AFj0u78Q9ksLXEw=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"75"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',76,'CEwSIQXmI/pweZPXQvi32JOQBPfhGBKaS1J7He8Jxucu1maHBhogqERb+R2HCk1XP9dFjP2srOJFjxOrC3+aCYzujX9obEo=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"76"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',77,'CE0SIQWWN/Tv8UKgQNn8HonaBh0SeFw4yhvHcdretZHwn1xLXRogGEV0qksDVCLTjkjAZQUrwNWuXnr7g5GCEjyM/xnnBVY=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"77"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',78,'CE4SIQV65zN5WQCceeM5epO/I+j1Jfg+pY9M+IHw+0A0gZkHMxogGH/FomzSGahyzlB2a8v0AR+XxM9JWUERcqgKIoJzqFQ=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"78"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',79,'CE8SIQUtcp9TGfxazPdzpeNjNqIYdMXkh1E/1e8Fv6AtaSkxVxogMDAtDHCec1Z1gzOo2AgovInapnv0m54LnyS0xn+LBl4=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"79"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',80,'CFASIQXOdrIAak1wFa9KNTsN8il7FUmYsMCJdS9A17bSAZ5qSBogICgXtzMXpD6+YthqkU/u2LdntED5l8H8CyRKawkTkGM=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"80"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',81,'CFESIQXv2azMF1loxP4hDBgbCi/7mRncj2owNSBinueWpoKhGBogWOjme9vLqV0bpbXg+4rgPAXLTHSn1PKHEvPdsvgncHI=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"81"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',82,'CFISIQXpGDwdgQfkPvp6zFIEA7SAlcxUsV+nRpE0xnnB0NAQQBogSMqx/b4vEg8ZkXrEXPa+MaPZFDMME4tTPO0YuxNuY3E=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"82"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',83,'CFMSIQWe52MA3SPwexJZNpOFOyK53+IUAKUFjlt6IYLgL1fFMhogKIj6CTnwXOTgNLNSBOYylwYyx9y0N75mg5EEZRHZT3s=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"83"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',84,'CFQSIQVeKRYWY5s3f07U6alZ3NAxUGRjStgocQs8VWnUw6M6Jhog4GD1W2Vqi38ipHCH4VeF3X01fbZWHz//sI/5W8Ns8kU=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"84"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',85,'CFUSIQWJLKnes6tSnwXVmA+PFEDq3YuFVdLx3Tvk0/TFk8cZBhogUMcCdfm1c5EtJksoCHkzKc/28CTx0WfHVnKMkRlESEg=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"85"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',86,'CFYSIQVHpW6UZ/x/GmnxKwCA384SyPAtCDIj1EJtXjaHpXAnSxog0Ps4zyza6iJlS0hirkjLWyEiz3Hdu89u9U2cXrHmjls=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"86"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',87,'CFcSIQWmwPwMHSkxmdX4bT/nQdQTCBHi+C/RcyQQ7FdsQfpSeBogIKRVWMlJdmf/nEHgKQzZhryPxGWCGYjLyM23SuBkUFs=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"87"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',88,'CFgSIQX0T03iEjyv1PzddKIOhbrHmXBtDiK7WXO4caFygbzMShogQCKgnIwujTIFnpGumvr2M4v1bZf48H98QUzNwhTVT0E=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"88"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',89,'CFkSIQWN971Dcf0WtF1Hu4P8ycUIo4bUR5SODcgvEXHO7X8EKRogGORXj5JZTYx/BsTzBtUzBt+6Rtcw6YYY6+8N9Uoh2m0=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"89"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',90,'CFoSIQVDxVoHGI5KMZrHp4BW27gIqskCx+BN8aTNJ2rVMheZCxogkElPxrf9Iz04qDG0Uh3kA0bNaeYXYgA3DwzemwrFdU4=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"90"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',91,'CFsSIQVBs07K4TdbpWUS3pUxupwX3uP2fw9SZweS1RnsBD1WZxogEJDwXtipoeD/Ym9/gG7ZWBsICTxO+TlSkfcs2Kbv1l8=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"91"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',92,'CFwSIQWHYZwZdIIuWqkySV2sngspPJx4EVx43pt5mxF30W5yNxogcMSFVKtI6QnPZJnjEjKnJn1/z5xoIBpL805QkftfkXI=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"92"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',93,'CF0SIQXcfAjGIYbFyB+3JSqWtGNPaBpQ7f8swl40e4LJEE7FExog2EJfVjaZ7IKdWhG8NC0dGX6QzYnS7ueWfA+PETKRpVQ=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"93"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',94,'CF4SIQWfM2z5vTiqUBcd4CSSsrKeYgjhUaa7qp/cDxaMDfXCTRogUEWDqBncKYFY5GxvdBKhjMfPL1BlBM9Gxr0yQi24mHk=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"94"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',95,'CF8SIQVvZXSS/ZryCptp8htMnkG80+ShhB0It0/3ACZSDpusKhogMKTCirj/r2do3VCreDVa2WkUPZVUVdg79pQsPLpUi2k=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"95"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',96,'CGASIQVIGYVLIGLP8ZemYucTzY+pMyeT+b7TSt2gwOJGSzFPLRogsI+iJDodqsTRCiOjZCUOND3ep9dcSnZv+THTdkiEqXs=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"96"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',97,'CGESIQWn1ghNMlK+JNRZuKmmf9nImEL26FEpgmpAy8lGup3gMBog6BblHQjAaExBNY5w8USOiO//VYDFntjkEpH7A0WXEHA=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"97"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',98,'CGISIQUSmjQbG+1EFvqpZNB+KrTEoJ8sJL3+X1nLqf+1k65LVBogsNJo8zbDEpIS5ZSLeK9kLqy0a5azf7ZA8Joh8tXKi0c=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"98"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',99,'CGMSIQWnlFarsbaEIa0Rxl5L6N0hKjdbjcu3mEnTfSWyoTZMfxog4GcBH0qDVdc3w7o9TdQ3+eAuu71mrvCQ4gGcgHqzWWM=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"99"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO prekreplaces(account,id,kreplace) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a',100,'CGQSIQX9WdksPPKYCcZ6JOZ1vmhqDHqxALAcWIOy2gzUSBctURogSDeySboIqtnqXd4VCaSJXbxTmwNqoXx2veb93M6xHUM=');
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion=NULL,kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
select conversations.accountUuid,conversations.contactJid from conversations join messages on conversations.uuid=messages.conversationUuid where messages.status!=0 and carbon==0  and conversations.mode=0 and messages.timeSent>='1701183858245' group by conversations.uuid order by count(body) desc limit 4;
-- ERROR: SyntaxError: Expected "!", "#", "$", "'", "(", "+", "-", "--", "/*", "0x", ":", "?", "@", "@@", "AVG", "CASE", "CAST", "COUNT", "CURRENT_DATE", "CURRENT_TIME", "CURRENT_TIMESTAMP", "CURRENT_USER", "DATE", "DATETIME", "DATE_TRUNC", "EXTRACT", "FALSE", "GROUP_CONCAT", "INTERVAL", "MATCH", "MAX", "MIN", "N", "NULL", "SESSION_USER", "SUM", "SYSTEM_USER", "TIME", "TIMESTAMP", "TRUE", "USER", "X", "\"", "_binary", "_latin1", "`", "b", "binary", "convert", "trim", "~", [ \t\n\r], [0-9], or [A-Za-z_] but "=" found.undefined
-- Found workaround select conversations
-- sql query
BEGIN EXCLUSIVE;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "E" found.undefined
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion='40f1868bbd69cbf9a3957097031c107917d66b6c',kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
SELECT * FROM conversations WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND (contactJid like 'conversations.im/%' OR contactJid='conversations.im');
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select conversations
-- sql query
INSERT INTO conversations(status,mode,name,uuid,contactUuid,contactJid,attributes,accountUuid,created) VALUES (0,0,'conversations.im','cb3d16bc-b40e-4cbd-8632-5cedc5661833',NULL,'conversations.im','{}','bd8f918b-0e34-4f36-973e-b9eb58bf511a',1703775858251);
-- sql query
INSERT INTO messages(remoteMsgId,timeSent,counterpart,encryption,bodyLanguage,axolotl_fingerprint,carbon,edited,status,serverMsgId,conversationUuid,readByMarkers,oob,body,read,type,uuid,markable,relativeFilePath,trueCounterpart,errorMsg,deleted) VALUES (NULL,1703775852495,'conversations.im',0,NULL,NULL,0,'[]',0,NULL,'cb3d16bc-b40e-4cbd-8632-5cedc5661833','[]',0,'Thank you for choosing conversations.im as your XMPP provider. Find more information on:https://account.conversations.imPlease log in to enter an email address for password recovery:https://account.conversations.im/login/',0,0,'b21ab1aa-a7b2-4535-8db0-776c49224e85',0,NULL,NULL,NULL,0);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert messages
-- sql query
SELECT device_id FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'test-user-sloir@conversations.im';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
SELECT device_id FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'test-user-sloir@conversations.im';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
SELECT * FROM conversations WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND (contactJid like 'sloir.be@conversations.im/%' OR contactJid='sloir.be@conversations.im');
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select conversations
-- sql query
INSERT INTO conversations(status,mode,name,uuid,contactUuid,contactJid,attributes,accountUuid,created) VALUES (0,0,'sloir.be','9af3c10e-a3bf-432f-8a3f-8d411535d0f4',NULL,'sloir.be@conversations.im','{}','bd8f918b-0e34-4f36-973e-b9eb58bf511a',1703775901779);
-- sql query
BEGIN EXCLUSIVE;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "E" found.undefined
-- sql query
INSERT INTO contacts(presence_name,servername,avatar,photouri,options,groups,pgpkreplace,systemaccount,last_presence,jid,rtpCapability,systemname,accountUuid,last_time) VALUES (NULL,NULL,NULL,NULL,28,'[]','{}',NULL,NULL,'sloir.be@conversations.im',NULL,NULL,'bd8f918b-0e34-4f36-973e-b9eb58bf511a',0);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert contacts
-- sql query
DELETE FROM contacts WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND jid='conversations.im';
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion='6565c8e2319974c8e3e030874128a98fc1645059',kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
select conversations.accountUuid,conversations.contactJid from conversations join messages on conversations.uuid=messages.conversationUuid where messages.status!=0 and carbon==0  and conversations.mode=0 and messages.timeSent>='1701183901826' group by conversations.uuid order by count(body) desc limit 4;
-- ERROR: SyntaxError: Expected "!", "#", "$", "'", "(", "+", "-", "--", "/*", "0x", ":", "?", "@", "@@", "AVG", "CASE", "CAST", "COUNT", "CURRENT_DATE", "CURRENT_TIME", "CURRENT_TIMESTAMP", "CURRENT_USER", "DATE", "DATETIME", "DATE_TRUNC", "EXTRACT", "FALSE", "GROUP_CONCAT", "INTERVAL", "MATCH", "MAX", "MIN", "N", "NULL", "SESSION_USER", "SUM", "SYSTEM_USER", "TIME", "TIMESTAMP", "TRUE", "USER", "X", "\"", "_binary", "_latin1", "`", "b", "binary", "convert", "trim", "~", [ \t\n\r], [0-9], or [A-Za-z_] but "=" found.undefined
-- Found workaround select conversations
-- sql query
BEGIN EXCLUSIVE;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "E" found.undefined
-- sql query
INSERT INTO contacts(presence_name,servername,avatar,photouri,options,groups,pgpkreplace,systemaccount,last_presence,jid,rtpCapability,systemname,accountUuid,last_time) VALUES (NULL,NULL,NULL,NULL,28,'[]','{}',NULL,NULL,'sloir.be@conversations.im',NULL,NULL,'bd8f918b-0e34-4f36-973e-b9eb58bf511a',0);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert contacts
-- sql query
DELETE FROM contacts WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND jid='conversations.im';
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion='6565c8e2319974c8e3e030874128a98fc1645059',kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
select conversations.accountUuid,conversations.contactJid from conversations join messages on conversations.uuid=messages.conversationUuid where messages.status!=0 and carbon==0  and conversations.mode=0 and messages.timeSent>='1701183901835' group by conversations.uuid order by count(body) desc limit 4;
-- ERROR: SyntaxError: Expected "!", "#", "$", "'", "(", "+", "-", "--", "/*", "0x", ":", "?", "@", "@@", "AVG", "CASE", "CAST", "COUNT", "CURRENT_DATE", "CURRENT_TIME", "CURRENT_TIMESTAMP", "CURRENT_USER", "DATE", "DATETIME", "DATE_TRUNC", "EXTRACT", "FALSE", "GROUP_CONCAT", "INTERVAL", "MATCH", "MAX", "MIN", "N", "NULL", "SESSION_USER", "SUM", "SYSTEM_USER", "TIME", "TIMESTAMP", "TRUE", "USER", "X", "\"", "_binary", "_latin1", "`", "b", "binary", "convert", "trim", "~", [ \t\n\r], [0-9], or [A-Za-z_] but "=" found.undefined
-- Found workaround select conversations
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'test-user-sloir@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
select count(*) from identities where account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND (trust = 'TRUSTED' OR trust = 'VERIFIED' OR trust = 'VERIFIED_X509') AND active > 0;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT device_id FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
SELECT * FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND device_id = '1141804581';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'test-user-sloir@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
select count(*) from identities where account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND (trust = 'TRUSTED' OR trust = 'VERIFIED' OR trust = 'VERIFIED_X509') AND active > 0;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT * FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND device_id = '1141804581';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND fingerprint = '056f430b20ee5c854ddd8a008ec78203274f834b99c88533c49244a3e63b83d14e';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
UPDATE identities SET active=1,fingerprint='056f430b20ee5c854ddd8a008ec78203274f834b99c88533c49244a3e63b83d14e',account='bd8f918b-0e34-4f36-973e-b9eb58bf511a',ownkreplace=0,last_activation=1703775910685,kreplace='BW9DCyDuXIVN3YoAjseCAydPg0uZyIUzxJJEo+Y7g9FO',name='sloir.be@conversations.im',trust='TRUSTED' WHERE account='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name='sloir.be@conversations.im' AND fingerprint ='056f430b20ee5c854ddd8a008ec78203274f834b99c88533c49244a3e63b83d14e';
-- sql query
INSERT INTO identities(active,fingerprint,account,ownkreplace,last_activation,kreplace,name,trust) VALUES (1,'056f430b20ee5c854ddd8a008ec78203274f834b99c88533c49244a3e63b83d14e','bd8f918b-0e34-4f36-973e-b9eb58bf511a',0,1703775910685,'BW9DCyDuXIVN3YoAjseCAydPg0uZyIUzxJJEo+Y7g9FO','sloir.be@conversations.im','TRUSTED');
-- sql query
INSERT INTO sessions(account,kreplace,name,device_id) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a','CvUCCAMSIQUlKNOPjbh+ywFrzo+IzZB38CU8cJVMePffIx+YN3SOIBohBW9DCyDuXIVN3YoAjseCAydPg0uZyIUzxJJEo+Y7g9FOIiBMMDD3g8pFkbGB4nc2MPdUrcNqspnPxETnjpnXmGeElDJrCiEFw4XPcs4f/q2KX2bPzeyL5UPddBC9id9VW11d/cAjEWwSIDgAKSufpB/0SuZ8ssFZQYRLLpxFQfJ/0Oyl4WBt1QhKGiQIABIgileNoZ3Q/BOVx3NuzoX1AjgRp4Ah+nxrScyetxXlCk06SQohBThLfuUnoZoLGSrQV3u7ZeUzXdNqTw5e5bULR8lJBrM7GiQIABIgPCc2iyk+bclR+jHM6w9A/YGerd5eBsrzaIRXXQXTLqhKJwg+EiEFeCSnvIcYPG/dH0zoCKz/Ym88r6Y2QiZm3z4VhxY8Gl8YAVAAWJu55H5qIQV4JKe8hxg8b90fTOgIrP9ibzyvpjZCJmbfPhWHFjwaXw==','sloir.be@conversations.im',1141804581);
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND fingerprint = '056f430b20ee5c854ddd8a008ec78203274f834b99c88533c49244a3e63b83d14e';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'test-user-sloir@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
select count(*) from identities where account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND (trust = 'TRUSTED' OR trust = 'VERIFIED' OR trust = 'VERIFIED_X509') AND active > 0;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
select count(*) from identities where account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND (trust = 'TRUSTED' OR trust = 'VERIFIED' OR trust = 'VERIFIED_X509') AND active > 0;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'test-user-sloir@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
select count(*) from identities where account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND (trust = 'TRUSTED' OR trust = 'VERIFIED' OR trust = 'VERIFIED_X509') AND active > 0;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
INSERT INTO messages(remoteMsgId,timeSent,counterpart,encryption,bodyLanguage,axolotl_fingerprint,carbon,edited,status,serverMsgId,conversationUuid,readByMarkers,oob,body,read,type,uuid,markable,relativeFilePath,trueCounterpart,errorMsg,deleted) VALUES (NULL,1703775910747,'sloir.be@conversations.im',5,NULL,'052528d38f8db87ecb016bce8f88cd9077f0253c70954c78f7df231f9837748e20',0,'[]',5,NULL,'9af3c10e-a3bf-432f-8a3f-8d411535d0f4','[]',0,'Hello Simon, wassup ? ',1,0,'f4f891f8-ed29-40e8-9ed5-b1a3e2c00ebc',0,NULL,NULL,NULL,0);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert messages
-- sql query
SELECT * FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND device_id = '1141804581';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
UPDATE conversations SET status=0,mode=0,name='sloir.be',uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',contactUuid=NULL,contactJid='sloir.be@conversations.im',attributes='{"next_message_timestamp":"0"}',accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',created=1703775901779 WHERE uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4';
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
UPDATE conversations SET status=0,mode=0,name='sloir.be',uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',contactUuid=NULL,contactJid='sloir.be@conversations.im',attributes='{"next_message_timestamp":"0"}',accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',created=1703775901779 WHERE uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4';
-- sql query
INSERT INTO sessions(account,kreplace,name,device_id) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a','CvUCCAMSIQUlKNOPjbh+ywFrzo+IzZB38CU8cJVMePffIx+YN3SOIBohBW9DCyDuXIVN3YoAjseCAydPg0uZyIUzxJJEo+Y7g9FOIiBMMDD3g8pFkbGB4nc2MPdUrcNqspnPxETnjpnXmGeElDJrCiEFw4XPcs4f/q2KX2bPzeyL5UPddBC9id9VW11d/cAjEWwSIDgAKSufpB/0SuZ8ssFZQYRLLpxFQfJ/0Oyl4WBt1QhKGiQIARIgRdqAVM82g5bF3T3PWbpnXHIgleYHfIQax8k+q/WohjM6SQohBThLfuUnoZoLGSrQV3u7ZeUzXdNqTw5e5bULR8lJBrM7GiQIABIgPCc2iyk+bclR+jHM6w9A/YGerd5eBsrzaIRXXQXTLqhKJwg+EiEFeCSnvIcYPG/dH0zoCKz/Ym88r6Y2QiZm3z4VhxY8Gl8YAVAAWJu55H5qIQV4JKe8hxg8b90fTOgIrP9ibzyvpjZCJmbfPhWHFjwaXw==','sloir.be@conversations.im',1141804581);
-- sql query
UPDATE messages SET remoteMsgId=NULL,timeSent=1703775910747,counterpart='sloir.be@conversations.im',encryption=5,bodyLanguage=NULL,axolotl_fingerprint='052528d38f8db87ecb016bce8f88cd9077f0253c70954c78f7df231f9837748e20',carbon=0,edited='[]',status=1,serverMsgId=NULL,conversationUuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',readByMarkers='[]',oob=0,body='Hello Simon, wassup ? ',read=1,type=0,uuid='f4f891f8-ed29-40e8-9ed5-b1a3e2c00ebc',markable=0,relativeFilePath=NULL,trueCounterpart=NULL,errorMsg=NULL,deleted=0 WHERE uuid='f4f891f8-ed29-40e8-9ed5-b1a3e2c00ebc';
-- sql query
UPDATE messages SET remoteMsgId=NULL,timeSent=1703775910747,counterpart='sloir.be@conversations.im',encryption=5,bodyLanguage=NULL,axolotl_fingerprint='052528d38f8db87ecb016bce8f88cd9077f0253c70954c78f7df231f9837748e20',carbon=0,edited='[]',status=2,serverMsgId=NULL,conversationUuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',readByMarkers='[]',oob=0,body='Hello Simon, wassup ? ',read=1,type=0,uuid='f4f891f8-ed29-40e8-9ed5-b1a3e2c00ebc',markable=0,relativeFilePath=NULL,trueCounterpart=NULL,errorMsg=NULL,deleted=0 WHERE uuid='f4f891f8-ed29-40e8-9ed5-b1a3e2c00ebc';
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND fingerprint = '052528d38f8db87ecb016bce8f88cd9077f0253c70954c78f7df231f9837748e20';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
SELECT * FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND device_id = '1141804581';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
SELECT * FROM sessions WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND device_id = '1141804581';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select sessions
-- sql query
SELECT trust, active, last_activation, kreplace FROM identities WHERE account = 'bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND name = 'sloir.be@conversations.im' AND ownkreplace = '0';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select identities
-- sql query
INSERT INTO sessions(account,kreplace,name,device_id) VALUES ('bd8f918b-0e34-4f36-973e-b9eb58bf511a','CpkDCAMSIQUlKNOPjbh+ywFrzo+IzZB38CU8cJVMePffIx+YN3SOIBohBW9DCyDuXIVN3YoAjseCAydPg0uZyIUzxJJEo+Y7g9FOIiCWdTDIAnRQauNv5vLrCiRC4/mwcD2Y+M5JJJDMuM3XuCgAMmsKIQUP54IPqzwogy0wKFvN8Lvy99W/36j4ccGl8PZuM2l1dhIgMK/AFEo/KPUKvG1w65MGSHxBErXWTzgR2OD5+a/qJGMaJAgAEiCs8HabWORJYQByFho9jkiUpJZVJp3WYxFWCG4uy1wqMzpJCiEFOEt+5SehmgsZKtBXe7tl5TNd02pPDl7ltQtHyUkGszsaJAgAEiA8JzaLKT5tyVH6MczrD0D9gZ6t3l4GyvNohFddBdMuqDpJCiEFO9mSWndnm8CRt5L4OnGkNx55UyqtD36X9tGPEcKY8lAaJAgBEiCQHpWte5Cakfb/5X81Y/LEsdndhptCFz6WdH2d/zo6HVAAWJu55H5qIQV4JKe8hxg8b90fTOgIrP9ibzyvpjZCJmbfPhWHFjwaXw==','sloir.be@conversations.im',1141804581);
-- sql query
INSERT INTO messages(remoteMsgId,timeSent,counterpart,encryption,bodyLanguage,axolotl_fingerprint,carbon,edited,status,serverMsgId,conversationUuid,readByMarkers,oob,body,read,type,uuid,markable,relativeFilePath,trueCounterpart,errorMsg,deleted) VALUES ('276cb4a1-92d2-4415-b762-2bcfef6e5d2b',1703775934854,'sloir.be@conversations.im/Conversations.iuQp',5,NULL,'056f430b20ee5c854ddd8a008ec78203274f834b99c88533c49244a3e63b83d14e',0,'[]',0,'1703775937846590','9af3c10e-a3bf-432f-8a3f-8d411535d0f4','[]',0,'Hello test user, wassup ? ',0,0,'331d3be1-28ea-40fb-b591-76a0fa2a6ea3',1,NULL,NULL,NULL,0);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert messages
-- sql query
UPDATE messages SET remoteMsgId='276cb4a1-92d2-4415-b762-2bcfef6e5d2b',timeSent=1703775934854,counterpart='sloir.be@conversations.im/Conversations.iuQp',encryption=5,bodyLanguage=NULL,axolotl_fingerprint='056f430b20ee5c854ddd8a008ec78203274f834b99c88533c49244a3e63b83d14e',carbon=0,edited='[]',status=0,serverMsgId='1703775937846590',conversationUuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',readByMarkers='[]',oob=0,body='Hello test user, wassup ? ',read=1,type=0,uuid='331d3be1-28ea-40fb-b591-76a0fa2a6ea3',markable=1,relativeFilePath=NULL,trueCounterpart=NULL,errorMsg=NULL,deleted=0 WHERE uuid='331d3be1-28ea-40fb-b591-76a0fa2a6ea3';
-- sql query
BEGIN EXCLUSIVE;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "E" found.undefined
-- sql query
INSERT INTO contacts(presence_name,servername,avatar,photouri,options,groups,pgpkreplace,systemaccount,last_presence,jid,rtpCapability,systemname,accountUuid,last_time) VALUES (NULL,NULL,NULL,NULL,25,'[]','{}',NULL,'Conversations.iuQp','sloir.be@conversations.im',NULL,NULL,'bd8f918b-0e34-4f36-973e-b9eb58bf511a',0);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert contacts
-- sql query
DELETE FROM contacts WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND jid='conversations.im';
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
select conversations.accountUuid,conversations.contactJid from conversations join messages on conversations.uuid=messages.conversationUuid where messages.status!=0 and carbon==0  and conversations.mode=0 and messages.timeSent>='1701183941779' group by conversations.uuid order by count(body) desc limit 4;
-- ERROR: SyntaxError: Expected "!", "#", "$", "'", "(", "+", "-", "--", "/*", "0x", ":", "?", "@", "@@", "AVG", "CASE", "CAST", "COUNT", "CURRENT_DATE", "CURRENT_TIME", "CURRENT_TIMESTAMP", "CURRENT_USER", "DATE", "DATETIME", "DATE_TRUNC", "EXTRACT", "FALSE", "GROUP_CONCAT", "INTERVAL", "MATCH", "MAX", "MIN", "N", "NULL", "SESSION_USER", "SUM", "SYSTEM_USER", "TIME", "TIMESTAMP", "TRUE", "USER", "X", "\"", "_binary", "_latin1", "`", "b", "binary", "convert", "trim", "~", [ \t\n\r], [0-9], or [A-Za-z_] but "=" found.undefined
-- Found workaround select conversations
-- sql query
SELECT * FROM discovery_results WHERE hash='sha-1' AND ver='zcIke+Rk13ah4d1pwDG7bEZsVwA=';
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select discovery_results
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion='4e38aa7e62cb82f2797f4821f0e06a46972fa305',kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
BEGIN EXCLUSIVE;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "E" found.undefined
-- sql query
INSERT INTO contacts(presence_name,servername,avatar,photouri,options,groups,pgpkreplace,systemaccount,last_presence,jid,rtpCapability,systemname,accountUuid,last_time) VALUES (NULL,NULL,NULL,NULL,25,'[]','{}',NULL,'Conversations.iuQp','sloir.be@conversations.im',NULL,NULL,'bd8f918b-0e34-4f36-973e-b9eb58bf511a',1703775941792);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert contacts
-- sql query
DELETE FROM contacts WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND jid='conversations.im';
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
select conversations.accountUuid,conversations.contactJid from conversations join messages on conversations.uuid=messages.conversationUuid where messages.status!=0 and carbon==0  and conversations.mode=0 and messages.timeSent>='1701183941798' group by conversations.uuid order by count(body) desc limit 4;
-- ERROR: SyntaxError: Expected "!", "#", "$", "'", "(", "+", "-", "--", "/*", "0x", ":", "?", "@", "@@", "AVG", "CASE", "CAST", "COUNT", "CURRENT_DATE", "CURRENT_TIME", "CURRENT_TIMESTAMP", "CURRENT_USER", "DATE", "DATETIME", "DATE_TRUNC", "EXTRACT", "FALSE", "GROUP_CONCAT", "INTERVAL", "MATCH", "MAX", "MIN", "N", "NULL", "SESSION_USER", "SUM", "SYSTEM_USER", "TIME", "TIMESTAMP", "TRUE", "USER", "X", "\"", "_binary", "_latin1", "`", "b", "binary", "convert", "trim", "~", [ \t\n\r], [0-9], or [A-Za-z_] but "=" found.undefined
-- Found workaround select conversations
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion='4e38aa7e62cb82f2797f4821f0e06a46972fa305',kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
BEGIN EXCLUSIVE;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "E" found.undefined
-- sql query
INSERT INTO contacts(presence_name,servername,avatar,photouri,options,groups,pgpkreplace,systemaccount,last_presence,jid,rtpCapability,systemname,accountUuid,last_time) VALUES (NULL,NULL,NULL,NULL,19,'[]','{}',NULL,'Conversations.iuQp','sloir.be@conversations.im',NULL,NULL,'bd8f918b-0e34-4f36-973e-b9eb58bf511a',1703775941792);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert contacts
-- sql query
DELETE FROM contacts WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND jid='conversations.im';
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
select conversations.accountUuid,conversations.contactJid from conversations join messages on conversations.uuid=messages.conversationUuid where messages.status!=0 and carbon==0  and conversations.mode=0 and messages.timeSent>='1701183941827' group by conversations.uuid order by count(body) desc limit 4;
-- ERROR: SyntaxError: Expected "!", "#", "$", "'", "(", "+", "-", "--", "/*", "0x", ":", "?", "@", "@@", "AVG", "CASE", "CAST", "COUNT", "CURRENT_DATE", "CURRENT_TIME", "CURRENT_TIMESTAMP", "CURRENT_USER", "DATE", "DATETIME", "DATE_TRUNC", "EXTRACT", "FALSE", "GROUP_CONCAT", "INTERVAL", "MATCH", "MAX", "MIN", "N", "NULL", "SESSION_USER", "SUM", "SYSTEM_USER", "TIME", "TIMESTAMP", "TRUE", "USER", "X", "\"", "_binary", "_latin1", "`", "b", "binary", "convert", "trim", "~", [ \t\n\r], [0-9], or [A-Za-z_] but "=" found.undefined
-- Found workaround select conversations
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion='15d8169450b98fff7ebe6a05da86f27da0253c50',kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
BEGIN EXCLUSIVE;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "E" found.undefined
-- sql query
INSERT INTO contacts(presence_name,servername,avatar,photouri,options,groups,pgpkreplace,systemaccount,last_presence,jid,rtpCapability,systemname,accountUuid,last_time) VALUES (NULL,NULL,'0f26721190e3b16c7fcb99f8845a497f3e10bfdc',NULL,19,'[]','{}',NULL,'Conversations.iuQp','sloir.be@conversations.im',NULL,NULL,'bd8f918b-0e34-4f36-973e-b9eb58bf511a',1703775941792);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert contacts
-- sql query
DELETE FROM contacts WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND jid='conversations.im';
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion='15d8169450b98fff7ebe6a05da86f27da0253c50',kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO discovery_results(result,ver,hash) VALUES ('{"identities":[{"category":"client","type":"phone","name":"Conversations"}],"features":["eu.siacs.conversations.axolotl.devicelist+notify","http:\/\/jabber.org\/protocol\/caps","http:\/\/jabber.org\/protocol\/chatstates","http:\/\/jabber.org\/protocol\/disco#info","http:\/\/jabber.org\/protocol\/muc","http:\/\/jabber.org\/protocol\/nick+notify","jabber:iq:version","jabber:x:conference","jabber:x:oob","storage:bookmarks+notify","urn:xmpp:avatar:metadata+notify","urn:xmpp:chat-markers:0","urn:xmpp:jingle-message:0","urn:xmpp:jingle:1","urn:xmpp:jingle:apps:dtls:0","urn:xmpp:jingle:apps:file-transfer:3","urn:xmpp:jingle:apps:file-transfer:4","urn:xmpp:jingle:apps:file-transfer:5","urn:xmpp:jingle:apps:rtp:1","urn:xmpp:jingle:apps:rtp:audio","urn:xmpp:jingle:apps:rtp:video","urn:xmpp:jingle:jet-omemo:0","urn:xmpp:jingle:jet:0","urn:xmpp:jingle:transports:ibb:1","urn:xmpp:jingle:transports:ice-udp:1",";
-- ERROR: SyntaxError: Expected "'", "''", "\"\"", "\\", "\\'", "\\/", "\\\"", "\\\\", "\\b", "\\f", "\\n", "\\r", "\\t", "\\u", "``", [^'\\], or [^'] but end of input found.undefined
-- Found workaround insert discovery_results
-- sql query
BEGIN EXCLUSIVE;
-- ERROR: SyntaxError: Expected "#", "--", "/*", ":=", "=", or [ \t\n\r] but "E" found.undefined
-- sql query
INSERT INTO contacts(presence_name,servername,avatar,photouri,options,groups,pgpkreplace,systemaccount,last_presence,jid,rtpCapability,systemname,accountUuid,last_time) VALUES (NULL,NULL,'0f26721190e3b16c7fcb99f8845a497f3e10bfdc',NULL,19,'[]','{}',NULL,'Conversations.iuQp','sloir.be@conversations.im','VIDEO',NULL,'bd8f918b-0e34-4f36-973e-b9eb58bf511a',1703775941792);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert contacts
-- sql query
DELETE FROM contacts WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND jid='conversations.im';
-- sql query
COMMIT;
-- ERROR: SyntaxError: Expected "#", "--", ".", "/*", ":=", "=", [ \t\n\r], or [A-Za-z0-9_$\x80-￿] but ";" found.undefined
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message=NULL,rosterversion='15d8169450b98fff7ebe6a05da86f27da0253c50',kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
-- sql query
INSERT INTO messages(remoteMsgId,timeSent,counterpart,encryption,bodyLanguage,axolotl_fingerprint,carbon,edited,status,serverMsgId,conversationUuid,readByMarkers,oob,body,read,type,uuid,markable,relativeFilePath,trueCounterpart,errorMsg,deleted) VALUES ('d0skbvK6cdhKVOuA4yLTUw',1703775984125,'sloir.be@conversations.im',0,NULL,NULL,0,'[]',0,'1703775987116244','9af3c10e-a3bf-432f-8a3f-8d411535d0f4','[]',0,'false:0',0,6,'44f40013-2710-4985-815f-bfaab91dce7d',0,NULL,NULL,NULL,0);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert messages
-- sql query
UPDATE messages SET remoteMsgId='d0skbvK6cdhKVOuA4yLTUw',timeSent=1703775984125,counterpart='sloir.be@conversations.im',encryption=0,bodyLanguage=NULL,axolotl_fingerprint=NULL,carbon=0,edited='[]',status=0,serverMsgId='1703775987116244',conversationUuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',readByMarkers='[]',oob=0,body='false:0',read=1,type=6,uuid='44f40013-2710-4985-815f-bfaab91dce7d',markable=0,relativeFilePath=NULL,trueCounterpart=NULL,errorMsg=NULL,deleted=0 WHERE uuid='44f40013-2710-4985-815f-bfaab91dce7d';
-- sql query
INSERT INTO messages(remoteMsgId,timeSent,counterpart,encryption,bodyLanguage,axolotl_fingerprint,carbon,edited,status,serverMsgId,conversationUuid,readByMarkers,oob,body,read,type,uuid,markable,relativeFilePath,trueCounterpart,errorMsg,deleted) VALUES ('3uPSygQoqD9zp2Sr97zXlA',1703776008467,'sloir.be@conversations.im',0,NULL,NULL,0,'[]',0,'1703776011459686','9af3c10e-a3bf-432f-8a3f-8d411535d0f4','[]',0,'false:0',0,6,'53cfd667-c0cc-4f16-b247-beb20eff2238',0,NULL,NULL,NULL,0);
-- ERROR: SyntaxError: Expected [A-Za-z0-9_:] but "," found.undefined
-- Found workaround insert messages
-- sql query
UPDATE messages SET remoteMsgId='3uPSygQoqD9zp2Sr97zXlA',timeSent=1703776008467,counterpart='sloir.be@conversations.im',encryption=0,bodyLanguage=NULL,axolotl_fingerprint=NULL,carbon=0,edited='[]',status=0,serverMsgId='1703776011459686',conversationUuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',readByMarkers='[]',oob=0,body='false:0',read=1,type=6,uuid='53cfd667-c0cc-4f16-b247-beb20eff2238',markable=0,relativeFilePath=NULL,trueCounterpart=NULL,errorMsg=NULL,deleted=0 WHERE uuid='53cfd667-c0cc-4f16-b247-beb20eff2238';
-- sql query
UPDATE conversations SET status=1,mode=0,name='sloir.be',uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',contactUuid=NULL,contactJid='sloir.be@conversations.im',attributes='{"next_message_timestamp":"0"}',accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',created=1703775901779 WHERE uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4';
-- sql query
SELECT * FROM messages WHERE conversationUuid='cb3d16bc-b40e-4cbd-8632-5cedc5661833' and timeSent<'1703775852495' ORDER BY timeSent DESC LIMIT 50;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select messages
-- sql query
UPDATE messages SET remoteMsgId=NULL,timeSent=1703775852495,counterpart='conversations.im',encryption=0,bodyLanguage=NULL,axolotl_fingerprint=NULL,carbon=0,edited='[]',status=0,serverMsgId=NULL,conversationUuid='cb3d16bc-b40e-4cbd-8632-5cedc5661833',readByMarkers='[]',oob=0,body='Thank you for choosing conversations.im as your XMPP provider. Find more information on:https://account.conversations.imPlease log in to enter an email address for password recovery:https://account.conversations.im/login/',read=1,type=0,uuid='b21ab1aa-a7b2-4535-8db0-776c49224e85',markable=0,relativeFilePath=NULL,trueCounterpart=NULL,errorMsg=NULL,deleted=0 WHERE uuid='b21ab1aa-a7b2-4535-8db0-776c49224e85';
-- sql query
UPDATE conversations SET status=0,mode=0,name='conversations.im',uuid='cb3d16bc-b40e-4cbd-8632-5cedc5661833',contactUuid=NULL,contactJid='conversations.im',attributes='{"next_message_timestamp":"0"}',accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',created=1703775858251 WHERE uuid='cb3d16bc-b40e-4cbd-8632-5cedc5661833';
-- sql query
SELECT * FROM conversations WHERE accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a' AND (contactJid like 'sloir.be@conversations.im/%' OR contactJid='sloir.be@conversations.im');
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select conversations
-- sql query
UPDATE conversations SET status=0,mode=0,name='sloir.be',uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',contactUuid=NULL,contactJid='sloir.be@conversations.im',attributes='{"next_message_timestamp":"0"}',accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',created=1703775901779 WHERE uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4';
-- sql query
SELECT * FROM messages WHERE conversationUuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4' ORDER BY timeSent DESC LIMIT 50;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select messages
-- sql query
SELECT * FROM messages WHERE conversationUuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4' and timeSent<'1703775910747' ORDER BY timeSent DESC LIMIT 50;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select messages
-- sql query
SELECT * FROM messages WHERE conversationUuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4' and timeSent<'1703775910747' ORDER BY timeSent DESC LIMIT 50;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select messages
-- sql query
UPDATE conversations SET status=0,mode=0,name='sloir.be',uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4',contactUuid=NULL,contactJid='sloir.be@conversations.im',attributes='{"next_message_timestamp":"0"}',accountUuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',created=1703775901779 WHERE uuid='9af3c10e-a3bf-432f-8a3f-8d411535d0f4';
-- sql query
SELECT * FROM presence_templates ORDER BY last_used desc;
-- ERROR: TypeError: Cannot read properties of undefined (reading '0')undefined
-- Found workaround select presence_templates
-- sql query
DELETE FROM presence_templates WHERE message='Hello, I''m new to this';
-- sql query
DELETE FROM presence_templates WHERE uuid not in (select uuid from presence_templates order by last_used desc limit 9);
-- sql query
INSERT INTO presence_templates(status,uuid,message,last_used) VALUES ('','ab325466-2b2e-4cb1-b67e-1a5a157d8d33','Hello, I''m new to this',1703776074940);
-- sql query
UPDATE accounts SET avatar=NULL,options=208,server='conversations.im',status=NULL,fast_token=NULL,resource='Conversations.pTwZ',hostname=NULL,username='test-user-sloir',status_message='Hello, I''m new to this',rosterversion='15d8169450b98fff7ebe6a05da86f27da0253c50',kreplaces='{"axolotl_reg_id":"265886875","show_error":"true","axolotl_cur_prekreplace_id":"100"}',port=5222,uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a',pinned_mechanism='SCRAM-SHA-1',fast_mechanism=NULL,password='ywqyRyGkGRuo',pinned_channel_binding=NULL,display_name=NULL WHERE uuid='bd8f918b-0e34-4f36-973e-b9eb58bf511a';
