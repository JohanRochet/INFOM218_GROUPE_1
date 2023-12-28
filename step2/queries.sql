SELECT EXISTS(SELECT endpoint FROM push WHERE account = {{question}} AND transport = {{question}})
select * from conversations
select * from contacts
select * from conversations where status = {{question}} and contactJid is not null order by created desc
SELECT messages.*,conversations.contactJid,conversations.accountUuid,conversations.mode FROM messages JOIN conversations ON messages.conversationUuid=conversations.uuid JOIN messages_index ON messages_index.rowid=messages.rowid WHERE encryption NOT IN(6,1,4,7) AND type IN(0,4) AND messages_index.body MATCH {{question}} ORDER BY timeSent DESC limit 300
SELECT messages.*,conversations.contactJid,conversations.accountUuid,conversations.mode FROM messages JOIN conversations ON messages.conversationUuid=conversations.uuid JOIN messages_index ON messages_index.rowid=messages.rowid WHERE encryption NOT IN(6,1,4,7) AND type IN(0,4) AND messages_index.body MATCH {{question}} AND conversations.uuid={{question}} ORDER BY timeSent DESC limit 300
select uuid,relativeFilePath from messages where type in (1,2,5) and deleted=0 and relativeFilePath is not null and conversationUuid=(select uuid from conversations where accountUuid={{question}} and (contactJid={{question}} or contactJid like {{question}})) order by timeSent desc{{na}}
select messages.timeSent from accounts join conversations on accounts.uuid=conversations.accountUuid join messages on conversations.uuid=messages.conversationUuid where accounts.uuid={{question}} and messages.axolotl_fingerprint={{question}} order by messages.timesent desc limit 1
select conversations.accountUuid,conversations.contactJid from conversations join messages on conversations.uuid=messages.conversationUuid where messages.status!=0 and carbon==0  and conversations.mode=0 and messages.timeSent&gt;={{question}} group by conversations.uuid order by count(body) desc limit 4;
select messages.* from messages join conversations on conversations.uuid=messages.conversationUuid where conversations.accountUuid={{question}}

INSERT INTO messages_index(messages_index) VALUES('rebuild');
CREATE TRIGGER after_message_insert AFTER INSERT ON messages BEGIN INSERT INTO messages_index(rowid,uuid,body) VALUES(NEW.rowid,NEW.uuid,NEW.body); END;
CREATE TRIGGER after_message_insert AFTER INSERT ON messages BEGIN INSERT INTO messages_index(rowid,uuid,body) VALUES(NEW.rowid,NEW.uuid,NEW.body);

delete from contacts
DELETE FROM discovery_results
CREATE TRIGGER after_message_delete AFTER DELETE ON messages BEGIN DELETE FROM messages_index WHERE rowid=OLD.rowid; END;