# Connect Native Trading Gateway (NTG) (3.8.1)

## Available service types

This "Connect" box provides users with the following services:

### NTG Client

The configuration type that needs to be used is - **th2_service:NTGClient**.

#### Configuration parameters

```yaml
# Real time IP address
serverIP: "127.0.0.1"

# Real time connection port
serverPort: 8181

# Connect timeout in milliseconds.
connectTimeout: 30000

# Login timeout in milliseconds.
loginTimeout: 30000

# Logout timeout in milliseconds.
logoutTimeout: 5000

# Idle timeout in milliseconds (if no message has been sent then the client must sent a Heartbeat message)
heartbeatTimeout: 30000

# Number of missed Heartbeat messages forcing the client to break the connection.
maxMissedHeartbeats: 5

# User ID
login: "user"

# User password
password: "password"

# User newPassword
newPassword: ""

# If true, the client sends a heartbeat (response or timeout heartbeat).
autosendHeartbeat: true

# Version of the messages used in session.
messageVersion: 1

# Inactivity service timeout in seconds after which service will be shut down automatically. If the value is set to 0 - do not shutdown the service.
idleTimeout: 0

# Send 'Logon' message at service startup
doLoginOnStart: true

# Reconnect will be executed with the specified timeout in milliseconds if service has lost the connection. 
# If the value is set to 0 (ZERO) , the service won't reconnect. In order for the reconnect task to work, the following settings must be enabled: Do Login On Start, Autosend Heartbeat.
reconnectTimeout: 5000
```

## Release notes

### 3.8.1
+ Updated `saifish-core` version from `3.3.54` to `3.3.93`

### 3.8.0

+ Updated `sailfish-core` version from `3.2.1741` to `3.3.54`
+ Updated `common` from `3.33.0` to `3.44.0`

### 3.7.2
+ Update
  + Add check scale for float and double types during encode
  + Increased accuracy of division double/float during decoding in ntg codec