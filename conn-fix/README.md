# FIX Connect (4.0.1)

This "Connect" component extension supports connections to the target system via [FIX protocol](https://www.fixtrading.org/what-is-fix/).

## Available service types

This "Connect" component provides users with two types of services:

### FIX Client

The "Connect" component acts like a client that connects to the target system.
The configuration type that needs to be used is - **FIX_Client**.

This 'conn' decodes the message that should be sent and updates the header. 
Full workflow is:
1. Receives a raw message via MQ from th2.
1. Parses the raw message to the internal format.
1. Updates the header from the parsed message according to the current session state.
1. Encodes the message to bytes and sends them to the remote system.

#### Configurable parameters

The FIX Client has the following parameters to configure:
```yaml
# It is a required parameter. It's the FIX version that this session should use.
# Possible values: "FIX.4.0", "FIX.4.1", "FIX.4.2", "FIX.4.3", "FIX.4.4", "FIXT.1.1"
beginString: FIXT.1.1

# It is a required parameter. Your ID that is associated with this FIX session.
senderCompID: sender

# It is a required parameter. Counter Parties ID that are associated with this FIX session.
targetCompID: target

# It is a required parameter. Directory to store sequence number and message files inside the workspace directory.
fileStorePath: store/fix/sessions

# It is a required parameter. Time of the day that this FIX session becomes activated.
# time in the format of HH:MM:SS, time is represented in UTC.
# If the session creation time is not between the StartTime and the EndTime, the session state will be reset (incoming / outgoing sequences and message cache will be dropped).
# The bounds move daily. So it means that, in the next day after the start at 'EndTime', the bounds will be moved
# Format of the value is 99:99:99
startTime: 00:00:00

# It is a required parameter. Time of the day that this FIX session becomes deactivated.
# time in the format of HH:MM:SS, time is represented in UTC.
# If the session creation time is not between the StartTime and the EndTime, the session state will be reset (incoming / outgoing sequences and message cache will be dropped).
# The bounds move daily. So it means that, in the next day after the start at 'EndTime', the bounds will be moved
# Format of the value is 99:99:99
endTime: 00:00:00

# It is a required parameter.
# Specifies the default application version ID for the session.
# This can either be the ApplVerID enum (see the ApplVerID field) or the BeginString for the default version.
# The possible values are: "2", "3", "4", "5", "6", "7", "8", "9"
defaultApplVerID: 9

# Determines if the sequence numbers should be reset to 1, after a normal logout termination
resetOnLogout: false

# Determines if the sequence numbers should be reset to 1, after an abnormal termination
resetOnDisconnect: false

# Save Heartbeats to QFJ logs file or not. Does not affect appearance of the HB messages in the console log
logHeartbeats: false

# If it is set to true, it will check required tags.
checkRequiredTags: true

# If this is set to true (checked), messages must be received from the counterparty within a defined number of seconds (refer to MaxLatency).
# It is useful to turn this off if a system uses localtime for it's timestamps instead of GMT.
checkLatency: false

# If CheckLatency is set to true (checked), this defines the number of seconds latency allowed for a message to be processed. The default value is 120.
maxLatency: 120

# If this is set to true (checked), it allows unknown fields in messages. This is intended for unknown fields with tags < 5000 (not user defined fields).
allowUnknownMsgFields: false

# Determines if milliseconds should be added to timestamp fields. Only available for AML 3
millisecondsInTimeStampFields: true

# Determines if microseconds should be added to timestamp fields. Only available for AML 3. This value is more prioritized than 'Milliseconds In Time Stamp Fields'
microsecondsInTimeStampFields: false

# Receive limit in bytes to emulate Slow Consumer
receiveLimit: 0

# The client send rejects in case the message is invalid
rejectInvalidMessage: true          

# If this is set to false (unchecked), the user defined fields will not be rejected if they are not defined in the data dictionary, or in case they are present in messages that they do not belong to.
validateUserDefinedFields: true

# If this is set to false (unchecked), fields that are out of order (i.e. body fields in the header, or header fields in the body) will not be rejected. Useful for connecting to systems which do not properly order fields.
validateFieldsOutOfOrder: true

# If this is set to false (unchecked), messages which contain values not presented in the range will not be rejected.
validateFieldsOutOfRange: true

# If this is set to false (unchecked), fields without values (empty) will not be rejected. Useful for connecting to systems which improperly send empty tags.
validateFieldsHaveValues: true

# If this is set to true (checked), no reject is sent on the incoming message with "duplicate tags allowed".
duplicateTagsAllowed: false

# If specified, the session start and end will be converted from default zone to UTC
useLocalTime: false

# Enables SSL usage for QFJ acceptor or initiator
useSSL: false

# KeyStore that will be used with SSL
sslKeyStore: ""

# KeyStore password that will be used with SSL
sslKeyStorePassword: ""

# It controls which particular protocols for secure connection are enabled for handshake
sslEnabledProtocols: ""

# It controls which particular SSL cipher suites are enabled for secure connection
sslCipherSuites: ""

# Checks the next expected target SeqNum against the received SeqNum. Checked by default.
# If a mismatch is detected, the following logic is applied:
# * if lower than expected SeqNum , logout
# * if higher, send a resend request
validateSequenceNumbers: true

# SenderSubId value. If this field is empty , it won't be set in the sent message's header
senderSubID: ""

# TargetSubId value. If this field is empty , it won't be set in the sent message's header
targetSubID: ""

# It is a required parameter. Host to connect to.
# Valid IP address in the format of x.x.x.x or a domain name.
socketConnectHost: localhost

# For week long sessions, it is the starting day of the week for the session. Used in combination with StartTime.
# Day of the week in English using any abbreviation (i.e. mo, mon, mond, monda, monday are all valid).
startDate: ""

# For week long sessions, it is the ending day of the week for the session. Used in combination with EndTime.
# Day of the week in English using any abbreviation (i.e. mo, mon, mond, monda, monday are all valid).
endDate: ""

# It is a required parameter. Heartbeat interval in seconds.
# Positive integer.
heartBtInt: 5

# Time between reconnection attempts in seconds.
# Positive integer
reconnectInterval: 5

# The tag DefaultApplVerID might be used in Logon message or not
useDefaultApplVerID: true

# It is a required parameter. Socket port for connecting to a session.\nPositive integer
socketConnectPort: 12345

# The value of a Username(553) tag that is used in Logon(A) message
username: "user name"

# The value of Password(554) tag that is used in Logon(A) message
password: "password"

# The value of the NewPassword(925) tag that is used in Logon(A) message
newPassword: ""

# If enabled the Password(554) and NewPassword(925) (if set) will have the value in Logon(A) message which will be encrypted using RSA algorithm.
# The key for encryption will be loaded from the file that is specified in the parameter encryptionKeyFilePath.
encryptPassword: false

# Path to the file with public key in RSA format.
# It will be used to encrypt the passwords values, if password encryption is enabled
encryptionKeyFilePath: ""

# The value of ResetSeqNumFlag(141) tag that is used in Logon(A) message. If the value is not set , then the tag won't be sent in the Logon
resetSeqNumFlag: true

# The number of seconds to wait for a logon response before disconnecting.
logonTimeout: 10

# The number of seconds to wait for a logout response before disconnecting.
logoutTimeout: 10

# The value of the tag DefaultCstmApplVerID(1408) that is used in Logon(A) message
defaultCstmApplVerID: ""

# Sender initial sequence number.
# It is applied when the service starts.
seqNumSender: 0

# The target initial sequence number.
# It is applied when the service starts.
seqNumTarget: 0

# Add NextExpectedMsgSeqNum(789) tag into Logon(A) message
addNextExpectedMsgSeqNum: false

# Ignore if the tag ResetSeqNumFlag(141) is not available in the received Logon(A) message
ignoreAbsenceOf141tag: false

# If it is set to true (checked), the service will not store messages
performanceMode: false

# Create a new session after disconnecting on the server side
autorelogin: true

# If it is specified , then we will check for OrigSendingTime in resend request
requiresOrigSendingTime: true

# Value for encryptMethod(98) field. Value is taken from dictionary by alias specified in this setting.
encryptMethod: PKCS
```

### FIX Server

The "Connect" component behaves like a server and waits for a client to connect.
The configuration type that needs to be used is - **FIX_Server**.

#### Configurable parameters

The FIX Server has the following parameters to configure:
```yaml
# It is a required parameter. It's the FIX version that this session should use.
# Possible values: "FIX.4.0", "FIX.4.1", "FIX.4.2", "FIX.4.3", "FIX.4.4", "FIXT.1.1"
beginString: FIXT.1.1

# It is a required parameter. Your ID that is associated with this FIX session.
senderCompID: sender

# It is a required parameter. Counter Parties ID that are associated with this FIX session.
targetCompID: target

# It is a required parameter. Directory to store sequence number and message files inside the workspace directory.
fileStorePath: store/fix/sessions

# It is a required parameter. Time of the day that this FIX session becomes activated.
# The time is in the format of HH:MM:SS, represented in UTC.
# If the session creation time is not between the StartTime and the EndTime, the session state will be reset (incoming / outgoing sequences and message cache will be dropped).
# The bounds move daily. So it means that, in the next day after the start of 'EndTime', the bounds will be moved
# Format of the value is 99:99:99
startTime: 00:00:00

# It is a required parameter. Time of the day that this FIX session becomes deactivated.
# The time in the format of HH:MM:SS and is represented in UTC.
# If the session creation time is not between StartTime and EndTime, the session state will be reset (incoming / outgoing sequences and message cache will be dropped).
# The bounds move daily. So it means that, in the next day after the start at 'EndTime', the bounds will be moved
# Format of the value is 99:99:99
endTime: 00:00:00

# It is a required parameter.
# Specifies the default application version ID for the session.
# This can either be the ApplVerID enum (see the ApplVerID field) or the BeginString for the default version.
# The possible values are: "2", "3", "4", "5", "6", "7", "8", "9"
defaultApplVerID: 9

# Determines if the sequence numbers should be reset to 1, after a normal logout termination
resetOnLogout: false

# Determines if the sequence numbers should be reset to 1, after an abnormal termination
resetOnDisconnect: false

# Save Heartbeats to QFJ logs file or not. Does not affect appearance of the HB messages in the console log
logHeartbeats: false

# Check required tags or not.
checkRequiredTags: true

# If this is set to checked, messages must be received from the counterparty within a defined number of seconds  (refer to MaxLatency).
# It is useful to turn this off if a system uses localtime for it's timestamps instead of GMT.
checkLatency: false

# If CheckLatency is set to true (checked), this defines the number of seconds that latency allows for a message to be processed. The default value is set to 120.
maxLatency: 120

# If this is set to true (checked), it allows unknown fields in messages. This is intended for unknown fields with tags < 5000 (not user defined fields).
allowUnknownMsgFields: false

# Determines if milliseconds should be added to timestamp fields. Only available for AML 3
millisecondsInTimeStampFields: true

# Determines if microseconds should be added to timestamp fields. Only available for AML 3. This value is more prioritized than 'Milliseconds In Time Stamp Fields'
microsecondsInTimeStampFields: false

# Receive limit in bytes to emulate Slow Consumer
receiveLimit: 0

# The client send rejects in case the message is invalid
rejectInvalidMessage: true          

# If this is set to false (unchecked), the user defined fields will not be rejected if they are not defined in the data dictionary, or in case they are present in messages which they do not belong to.
validateUserDefinedFields: true

# If this is set to false (unchecked), fields that are out of order (i.e. body fields in the header, or header fields in the body) will not be rejected. Useful for connecting to systems which do not properly order fields.
validateFieldsOutOfOrder: true

# If this is set to false (unchecked), messages which contain values not presented in the range will not be rejected.
validateFieldsOutOfRange: true

# If this is set to false (unchecked), fields without values (empty) will not be rejected. Useful for connecting to systems which improperly send empty tags.
validateFieldsHaveValues: true

# If this is set to true (checked), no reject is sent on the incoming message with duplicate tags.
duplicateTagsAllowed: false

# If this is specified, the session start and end time will be converted from the default zone to UTC
useLocalTime: false

# Enables SSL usage for QFJ acceptor or initiator
useSSL: false

# KeyStore that will be used with SSL
sslKeyStore: ""

# KeyStore password that will be used with SSL
sslKeyStorePassword: ""

# It controls which particular protocols for secure connection are enabled for handshake
sslEnabledProtocols: ""

# It controls which particular SSL cipher suites are enabled for secure connection
sslCipherSuites: ""

# Checks the next expected target SeqNum against the received SeqNum. Checked by default.
# If a mismatch is detected, the following logic is applied:
# * if lower than expected SeqNum , logout
# * if higher, send a resend request
validateSequenceNumbers: true

# It is a required parameter.
# Socket port for listening to incoming connections from the client.
socketAcceptPort: 1234

# Session setting that causes the session to reset its sequence numbers when initiating a Logon
resetOnLogon: false

# It tells the session whether or not to expect a data dictionary.
# You should always use a DataDictionary, in case you are using repeating groups.
useDataDictionary: true

# The class name of the FIX Server application implemented logic responsible for autonomous work.
applicationClassName: com.exactpro.sf.services.fix.ServerApplication

# It tells the application to keep messages in memory and whether to store them into DB or not
keepMessagesInMemory: true

# If it is set to true, then the server will not wait a logout message from the system and will close the session immediately after sending its own logout
forceDisconnectByDispose: false

# The heartbeat interval (in seconds) that will be used, in case the tag 108 is absent in the client Logon message.
# If this parameter has a negative value (less than ZERO), it won't be used
defaultHeartbeatInterval: 5
```

## Release notes

### 4.0.1

+ Updated `sailfish-core` version from `3.3.54` to `3.3.93`
+ New `fix` client property `encryptMethod`: password encryption support

### 4.0.0

+ `th2-conn` version with books/pages

### 3.8.0

+ Updated `sailfish-core` version from `3.2.1741` to `3.3.54`
+ Updated `common` from `3.33.0` to `3.44.0`

### 3.7.2
+ Update sailfish version to 3.2.1860 
  + Detection of errors in FIXSession and FIXCodec during parsing qfj messages

### 3.4.2
+ Fixed the problem in which conn sends a correct user's message to the remote system but sends an incorrect copy of it to the th2 with short header instead of an enriched version

### 3.1.0
+ Validates a message to be sent by the configured dictionary during decoding, for future header update.
