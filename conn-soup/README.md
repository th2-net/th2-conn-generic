# SOUP family codecs

## Available service types

This "Connect" box provides users with the following services:

### SoupBinTcp client
The configuration type that needs to be used is - **th2_service:SoupBinTcp_Client**.

#### Configuration parameters

```yaml
# It is a required parameter.
# Address to connect.
address: 127.0.0.1

# It is a required parameter.
# Port to connect to
port: 1234

# Enables auto-logon on service start
doLoginOnStart: true

# Member that will be sent in LoginRequestPacket message
member: ""

# Password that will be sent in LoginRequestPacket message
password: ""

# Version that will be sent in LoginRequestPacket message
version: ""

# RequestedSequenceNumber that will be sent in LoginRequestPacket message
requestedSequenceNumber: 0

# RequestedSession that will be sent in LoginRequestPacket message
requestedSession: ""

# Decompress the incoming messages from the system
compressionUsed: false

# Chunk delimiter that should precede the actual chunk (2 bytes).
# If delimiter is different an error will be reported.
compressedChunkDelimeter: 57005

# Indicate whether the "connect" should automatically reconnect if connection was closed by the opposite side.
reconnecting: true

# Timeout in milliseconds before reconnecting if connection was closed by the opposite side.
reconnectingTimeout: 5000

# The required parameter for reconnection logic. If it set to value of `false` the reconnection won't perform
disposeWhenSessionClosed: true

# Enables the feature to send heartbeat automatically. You can specify a time interval in 'heartbeatTimeout' option.
sendHeartBeats: true

# Sends Heartbeat every specified seconds (if no other messages are sent during that time). This feature may be enabled by 'sendHeartBeats' option
heartbeatTimeout: 5

# Keeps all logical message parts together. If it set to value of `true` they won't be split to different batches
evolutionSupportEnabled: true
```

### OUCH client
The configuration type that needs to be used is - **th2_service:OUCH_Client**.

#### Configuration parameters

```yaml
# It is a required parameter.
# Address to connect.
address: 127.0.0.1

# It is a required parameter.
# Port to connect to
port: 1234

# Enables auto-logon on service start
doLoginOnStart: true

# It is a required parameter.
# RequestedSequenceNumber that will be sent in LoginRequestPacket message
requestedSequenceNumber: 0

# It is a required parameter.
# RequestedSession that will be sent in LoginRequestPacket message
requestedSession: ""

# Decompress the incoming messages from the system
compressionUsed: false

# Chunk delimiter that should precede the actual chunk (2 bytes).
# If delimiter is different an error will be reported.
compressedChunkDelimeter: 57005

# Indicate whether the "connect" should automatically reconnect if connection was closed by the opposite side.
reconnecting: true

# Timeout in milliseconds before reconnecting if connection was closed by the opposite side.
reconnectingTimeout: 5000

# The required parameter for reconnection logic. If it set to value of `false` the reconnection won't perform
disposeWhenSessionClosed: true

# Enables the feature to send heartbeat automatically. You can specify a time interval in 'heartbeatTimeout' option.
sendHeartBeats: true

# Sends Heartbeat every specified seconds (if no other messages are sent during that time). This feature may be enabled by 'sendHeartBeats' option
heartbeatTimeout: 5

# Keeps all logical message parts together. If it set to value of `true` they won't be split to different batches
evolutionSupportEnabled: true
```

### MoldUDP64 client
The configuration type that needs to be used is - **th2_service:MoldUDP64_Client**.

#### Configuration parameters
```yaml
# It is a required parameter.
# Address to connect.
address: 127.0.0.1

# It is a required parameter.
# Port to connect to
port: 1234

# The network interface to listen to UDP traffic.
# If it is not set the first found interface will be used.
# The interface can be specified either by name or by interface's IP address.
networkInterface: 0.0.0.0

# Keeps all logical message parts together. If it set to value of `true` they won't be split to different batches
evolutionSupportEnabled: true
```
