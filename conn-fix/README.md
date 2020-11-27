# FIX Connect

This "Connect" component extension supports connection to the target system via [FIX protocol](https://www.fixtrading.org/what-is-fix/).

## Available service types

This "Connect" component provides users with two types of the services:

### FIX Client

The "Connect" component acts like a client that connects to the system.
The configuration type that needs to be used is - **FIX_Client**.

#### Configurable parameters

The FIX Client has the following parameters to configure:
```yaml
# It is a required parameter. It's the FIX version that this session should use.
# Possible values: "FIX.4.0", "FIX.4.1", "FIX.4.2", "FIX.4.3", "FIX.4.4", "FIXT.1.1"
beginString: FIXT.1.1

# It is a required parameter. Your ID that is associated with this FIX session.
senderCompID: sender

# It is a required parameter. Counter Parties ID that is associated with this FIX session.
targetCompID: target

# It is a required parameter. Directory to store sequence number and message files inside the workspace directory.
fileStorePath: store/fix/sessions

# It is a required parameter. Time of day that this FIX session becomes activated.
# time in the format of HH:MM:SS, time is represented in UTC.
# If the session creation time is not between the StartTime and the EndTime, the session state will be reset (incoming / outgoing sequences and message cache will be drop).
# The bounds move daily. So it means that, in the next day after the start at 'EndTime' the bounds will be moved
# Format of the value is 99:99:99
startTime: 00:00:00

# It is a required parameter. Time of day that this FIX session becomes deactivated.
# time in the format of HH:MM:SS, time is represented in UTC.
# If the session creation time is not between the StartTime and the EndTime, the session state will be reset (incoming / outgoing sequences and message cache will be drop).
# The bounds move daily. So it means that, in the next day after the start at 'EndTime' the bounds will be moved
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

# Save Heartbeats to logs or not.
logHeartbeats: false

# Check required tags or not.
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

# Determines if microseconds should be added to timestamp fields. Only available for AML 3. This value is more priority than 'Milliseconds In Time Stamp Fields'
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

# It enables fields ordering in raw message by dictionary
orderingFields: false

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

# For week long sessions, the starting day of week for the session. Use in combination with StartTime.
# Day of the week in English using any abbreviation (i.e. mo, mon, mond, monda, monday are all valid).
startDate: ""

# For week long sessions, the ending day of week for the session. Use in combination with EndTime.
# Day of the week in English using any abbreviation (i.e. mo, mon, mond, monda, monday are all valid).
endDate: ""

# It is a required parameter. Heartbeat interval in seconds.
# Positive integer.
heartBtInt: 5

# Time between reconnection attempts in seconds.
# Positive integer
reconnectInterval: 5

# Use tag DefaultApplVerID in Logon message or not
useDefaultApplVerID: true

# It is a required parameter. Socket port for connecting to a session.\nPositive integer
socketConnectPort: 12345

# The value of a Username(553) tag that is used in Logon(A) message
username: "user name"

# The value of Password(554) tag that is used in Logon(A) message
password: "password"

# The value of the NewPassword(925) tag that is used in Logon(A) message
newPassword: ""

# If enabled the Password(554) and NewPassword(925) (if set) will value in Logon(A) message will be encrypted using RSA algorithm.
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

# Inactivity service timeout (in seconds) in which the service will be shutdown automatically. If set to "0" - the service does not shutdown.
idleTimeout: 0

# Perform logon when service starts
doLogonOnStart: true

# The value of the tag DefaultCstmApplVerID(1408) that is used in Logon(A) message
defaultCstmApplVerID: ""

# Sender initial sequence number.
# It is applied when service starts.
seqNumSender: 0

# The target initial sequence number.
# It is applied when service starts.
seqNumTarget: 0

# Add NextExpectedMsgSeqNum(789) tag into Logon(A) message
addNextExpectedMsgSeqNum: false

# Ignore if the tag ResetSeqNumFlag(141) is not available in the received Logon(A) message
ignoreAbsenceOf141tag: false

# If it is set to true (checked), the service does not store messages
performanceMode: false

# Create a new session after disconnecting on the server side
autorelogin: true

# If it is specified , then we will check for OrigSendingTime in resend request
requiresOrigSendingTime: true
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

# It is a required parameter. Counter Parties ID that is associated with this FIX session.
targetCompID: target

# It is a required parameter. Directory to store sequence number and message files inside the workspace directory.
fileStorePath: store/fix/sessions

# It is a required parameter. Time of day that this FIX session becomes activated.
# The time is in the format of HH:MM:SS, represented in UTC.
# If the session creation time is not between the StartTime and the EndTime the session state will be reset (incoming / outgoing sequences and message cache will be dropped).
# The bounds move daily. So it means that, in the next day after the start of 'EndTime', the bounds will be moved
# Format of the value is 99:99:99
startTime: 00:00:00

# It is a required parameter. Time of day that this FIX session becomes deactivated.
# time in the format of HH:MM:SS, time is represented in UTC.
# If the session creation time is not between StartTime and EndTime the session state will be reset (incoming / outgoing sequences and message cache will be drop).
# The bounds move daily. That means next day after the start at 'EndTime' the bounds will be moved
# Format of value is 99:99:99
endTime: 00:00:00

# It is a required parameter.
# Specifies the default application version ID for the session.
# This can either be the ApplVerID enum (see the ApplVerID field) or the BeginString for the default version.
# Possible values: "2", "3", "4", "5", "6", "7", "8", "9"
defaultApplVerID: 9

# Determines if sequence numbers should be reset to 1 after a normal logout termination
resetOnLogout: false

# Determines if sequence numbers should be reset to 1 after an abnormal termination
resetOnDisconnect: false

# Save Heartbeats to logs or not.
logHeartbeats: false

# Check required tags or not.
checkRequiredTags: true

# If set to checked, messages must be received from the counterparty within a defined number of seconds (see MaxLatency).
# It is useful to turn this off if a system uses localtime for it's timestamps instead of GMT.
checkLatency: false

# If CheckLatency is set to checked, this defines the number of seconds latency allowed for a message to be processed. Default is 120.
maxLatency: 120

# If set to checked, allow unknown fields in messages. This is intended for unknown fields with tags < 5000 (not user defined fields).
allowUnknownMsgFields: false

# Determines if milliseconds should be added to timestamp fields. Only available for AML 3
millisecondsInTimeStampFields: true

# Determines if microseconds should be added to timestamp fields. Only available for AML 3. This value is more priority than 'Milliseconds In Time Stamp Fields'
microsecondsInTimeStampFields: false

# Receive limit in bytes to emulate Slow Consumer
receiveLimit: 0

# Client send reject if message is invalid
rejectInvalidMessage: true          

# If set to unchecked, user defined fields will not be rejected if they are not defined in the data dictionary, or are present in messages they do not belong to.
validateUserDefinedFields: true

# If set to unchecked, fields that are out of order (i.e. body fields in the header, or header fields in the body) will not be rejected. Useful for connecting to systems which do not properly order fields.
validateFieldsOutOfOrder: true

# If set to unchecked, messages which contain values not presented in the range will not be rejected.
validateFieldsOutOfRange: true

# If set to unchecked, fields without values (empty) will not be rejected. Useful for connecting to systems which improperly send empty tags.
validateFieldsHaveValues: true

# If set to checked, no reject sent on incoming message with duplicate tags Allow duplicated tags.
duplicateTagsAllowed: false

# If specified, the session start and end will be converted from default zone to UTC
useLocalTime: false

# Enables SSL usage for QFJ acceptor or initiator
useSSL: false

# KeyStore to use with SSL
sslKeyStore: ""

# KeyStore password to use with SSL
sslKeyStorePassword: ""

# Controls which particular protocols for secure connection are enabled for handshake
sslEnabledProtocols: ""

# Controls which particular SSL cipher suites are enabled for secure connection
sslCipherSuites: ""

# Enables fields ordering in raw message by dictionary
orderingFields: false

# Check the next expected target SeqNum against the received SeqNum. Default is checked.
# If a mismatch is detected, apply the following logic:
# * if lower than expected SeqNum , logout
# * if higher, send a resend request
validateSequenceNumbers: true

# It is a required parameter.
# Socket port for listening to incoming connections from client.
socketAcceptPort: 1234

# Session setting that causes the session to reset sequence numbers when initiating a Logon
resetOnLogon: false

# Tells session whether or not to expect a data dictionary.
# You should always use a DataDictionary if you are using repeating groups.
useDataDictionary: true

# Class name of the FIX Server application
applicationClassName: com.exactpro.sf.services.fix.FIXTESTApplication

# Tells application to keep messages in memory and store them to DB or not
keepMessagesInMemory: true

# if TRUE then server will not wait logout message from system and will close session immediately after sending its own logout
forceDisconnectByDispose: false

# The heartbeat interval in seconds that will be used if tag 108 absents in the client Logon message.
# If this parameter has value less than ZERO it won't be used
defaultHeartbeatInterval: 5
```
