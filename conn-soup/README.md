# SOUP family codecs (4.0.1)

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

# Indicate whether the "connect" should automatically reconnect if the connection was closed by the opposite side.
reconnecting: true

# Timeout in milliseconds before reconnecting if the connection was closed by the opposite side.
reconnectingTimeout: 5000

# The required parameter for reconnection logic. If it is set to `false` the reconnection won't be performed
disposeWhenSessionClosed: true

# It enables the feature to send heartbeat automatically. You can specify a time interval in 'heartbeatTimeout' option.
sendHeartBeats: true

# It sends Heartbeat with the interval in seconds that is specified in this field (if no other messages are sent during that time). This feature may be enabled by setting 'sendHeartBeats' option to `true`
heartbeatTimeout: 5

# Maintains all the logical message parts together. If it is set to `true` they won't be split into different batches
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

# Timeout in milliseconds before reconnecting if the connection was closed by the opposite side.
reconnectingTimeout: 5000

# The required parameter for reconnection logic. If it is set to `false` the reconnection won't be performed
disposeWhenSessionClosed: true

# It enables the feature to send heartbeat automatically. You can specify a time interval in 'heartbeatTimeout' option.
sendHeartBeats: true

# It sends Heartbeat with the interval in seconds that is specified in this field (if no other messages are sent during that time). This feature may be enabled by setting 'sendHeartBeats' option to `true`
heartbeatTimeout: 5

# Maintains all the logical message parts together. If it is set to `true` they won't be split into different batches
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
# If it is not set the first interface that is found will be used.
# The interface can be specified either by name or by interface's IP address.
networkInterface: 0.0.0.0

# Maintains all the logical message parts together. If it is set to `true`, they won't be split into different batches
evolutionSupportEnabled: true
```

## Release notes

### 4.0.1

+ Updated `sailfish-core` version from `3.3.54` to `3.3.93`

### 4.0.0

+ `th2-conn` version with books/pages

### 3.8.0

+ Updated `sailfish-core` version from `3.2.1741` to `3.3.54`
+ Updated `common` from `3.33.0` to `3.44.0`


### 3.7.2

+ Update sailfish version to 3.2.1860
  + Add declared message length check

### 3.7.0
+ Fixed decoding of EndOfSession messages

### 3.6.0

+ Embedded service based on MINA decodes the message as sender during sending.
  This approach is important for cases in which a pair of messages have the same protocol message type and different structures depending on the direction.