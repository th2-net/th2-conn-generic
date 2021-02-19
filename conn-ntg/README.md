# Connect Native Trading Gateway (NTG)

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

# Idle timeout in milliseconds (if no message has been sent then client must sent Heartbeat message)
heartbeatTimeout: 30000

# Number of missed Heartbeat messages forcing the client to break the connection.
maxMissedHeartbeats: 5

# User ID
login: "user"

# User password
password: "password"

# User newPassword
newPassword: ""

# If true client sends heartbeat (response or timeout heartbeat).
autosendHeartbeat: true

# Version of the messages used in session.
messageVersion: 1

idleTimeout: 0

doLoginOnStart: true

# Auto reconnection timeout in milliseconds
reconnectTimeout: 5000

```
