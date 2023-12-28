create table accounts
(
    uuid                   TEXT PRIMARY KEY,
    username               TEXT,
    server                 TEXT,
    password               TEXT,
    display_name           TEXT,
    status                 TEXT,
    status_message         TEXT,
    rosterversion          TEXT,
    options                NUMBER,
    avatar                 TEXT,
    keys                   TEXT,
    hostname               TEXT,
    resource               TEXT,
    pinned_mechanism       TEXT,
    pinned_channel_binding TEXT,
    fast_mechanism         TEXT,
    fast_token             TEXT,
    port                   NUMBER DEFAULT 5222
);

create table conversations
(
    uuid        TEXT PRIMARY KEY,
    name        TEXT,
    contactUuid TEXT,
    accountUuid TEXT,
    contactJid  TEXT,
    created     NUMBER,
    status      NUMBER,
    mode        NUMBER,
    attributes  TEXT,
    FOREIGN KEY (accountUuid) REFERENCES accounts (uuid)
        ON
            DELETE
            CASCADE
);

create table messages
(
    uuid                TEXT PRIMARY KEY,
    conversationUuid    TEXT,
    timeSent            NUMBER,
    counterpart         TEXT,
    trueCounterpart     TEXT,
    body                TEXT,
    encryption          NUMBER,
    status              NUMBER,
    type                NUMBER,
    relativeFilePath    TEXT,
    serverMsgId         TEXT,
    axolotl_fingerprint TEXT,
    carbon              INTEGER,
    edited              TEXT,
    read                NUMBER DEFAULT 1,
    oob                 INTEGER,
    errorMsg            TEXT,
    readByMarkers       TEXT,
    markable            NUMBER DEFAULT 0,
    deleted             NUMBER DEFAULT 0,
    bodyLanguage        TEXT,
    remoteMsgId         TEXT,
    FOREIGN KEY (conversationUuid) REFERENCES conversations (uuid)
        ON
            DELETE
            CASCADE
);
CREATE INDEX message_time_index
    ON messages (timeSent);
CREATE INDEX message_conversation_index
    ON messages (conversationUuid);
CREATE INDEX message_deleted_index
    ON messages (deleted);
CREATE INDEX message_file_path_index
    ON messages (relativeFilePath);
CREATE INDEX message_type_index
    ON messages (type);
create table contacts
(
    accountUuid   TEXT,
    servername    TEXT,
    systemname    TEXT,
    presence_name TEXT,
    jid           TEXT,
    pgpkey        TEXT,
    photouri      TEXT,
    options       NUMBER,
    systemaccount NUMBER,
    avatar        TEXT,
    last_presence TEXT,
    last_time     NUMBER,
    rtpCapability TEXT,
    groups        TEXT,
    FOREIGN KEY (accountUuid) REFERENCES accounts (uuid)
        ON
            DELETE
            CASCADE,
    UNIQUE (accountUuid, jid)
        ON CONFLICT REPLACE
);
create table discovery_results
(
    hash   TEXT,
    ver    TEXT,
    result TEXT,
    UNIQUE (hash, ver)
        ON CONFLICT REPLACE
);
CREATE TABLE sessions
(
    account   TEXT,
    name      TEXT,
    device_id INTEGER,
    key       TEXT,
    FOREIGN KEY (account) REFERENCES accounts (uuid)
        ON
            DELETE
            CASCADE,
    UNIQUE (account, name, device_id)
        ON CONFLICT REPLACE
);
CREATE TABLE prekeys
(
    account TEXT,
    id      INTEGER,
    key     TEXT,
    FOREIGN KEY (account) REFERENCES accounts (uuid)
        ON
            DELETE
            CASCADE,
    UNIQUE (account, id)
        ON CONFLICT REPLACE
);
CREATE TABLE signed_prekeys
(
    account TEXT,
    id      INTEGER,
    key     TEXT,
    FOREIGN KEY (account) REFERENCES accounts (uuid)
        ON
            DELETE
            CASCADE,
    UNIQUE (account, id)
        ON CONFLICT REPLACE
);
CREATE TABLE identities
(
    account         TEXT,
    name            TEXT,
    ownkey          INTEGER,
    fingerprint     TEXT,
    certificate     BLOB,
    trust           TEXT,
    active          NUMBER,
    last_activation NUMBER,
    key             TEXT,
    FOREIGN KEY (account) REFERENCES accounts (uuid)
        ON
            DELETE
            CASCADE,
    UNIQUE (account, name, fingerprint)
        ON CONFLICT IGNORE
);
CREATE TABLE presence_templates
(
    uuid      TEXT,
    last_used NUMBER,
    message   TEXT,
    status    TEXT,
    UNIQUE (message, status)
        ON CONFLICT REPLACE
);
create table resolver_results
(
    domain        TEXT,
    hostname      TEXT,
    ip            BLOB,
    priority      NUMBER,
    directTls     NUMBER,
    authenticated NUMBER,
    port          NUMBER,
    UNIQUE (domain)
        ON CONFLICT REPLACE
);
CREATE VIRTUAL TABLE messages_index USING fts4
(
    uuid,
    body,
    notindexed =
    "uuid",
    content =
    "messages",
    tokenize =
    'unicode61'
);
CREATE TRIGGER after_message_insert
    AFTER INSERT
    ON messages
BEGIN
    INSERT INTO messages_index(rowid, uuid, body)
    VALUES (NEW.rowid, NEW.uuid, NEW.body);
END
;
CREATE TRIGGER after_message_update
    UPDATE
        OF uuid, body
    ON messages
BEGIN
    UPDATE
        messages_index
    SET body = NEW.body,
        uuid = NEW.uuid
    WHERE rowid = OLD.rowid;
END;
CREATE TRIGGER after_message_delete
    AFTER
        DELETE
    ON messages
BEGIN
    DELETE
    FROM messages_index
    WHERE rowid = OLD.rowid;
END;