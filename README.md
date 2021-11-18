# Generic connects (3.7.0)

This project contains extensions for the base component "[Connect](https://github.com/th2-net/th2-conn)", which is responsible for
supporting communication with the target system by using common protocols.

Currently, it contains extensions for the following protocols:
+ [fix](conn-fix/README.md)
+ [ntg](conn-ntg/README.md)

## Build connects

To build the "Connect" component you will need to have Docker installed on your machine.

Execute the Docker build using Dockerfile from the project root and pass the project name
(the project you want to use for creating the image) using the build argument named `project_name`.

For example, if you need to build "Connect" for the FIX protocol the `project_name` parameter should be equal to **conn-fix**.

NOTE: please, make sure that the folder which contains the subproject and the project name in Gradle are the same.

## Connect parameters and supported services types
Each connect can support several service types and each one can have its own parameters to configure.
You can find the description for the available service types and their configurable parameters within subprojects folder.

## Release notes

### 3.7.0

+ Update sailfish version to 3.2.1741
  + fix problem with dropping metadata in FIX conn when sending 

### 3.6.1

+ Update Sailfish version to 3.2.1684

### 3.6.0

+ Updated base image to th2-conn:3.9.0, it includes sailfish service based on MINA decodes the message as sender during sending.
  This approach is important for protocols in which a pair of messages have the same protocol message type and different structures depending on the direction.

### 3.5.0

+ Disable waiting for connection recovery when closing the `SubscribeMonitor`

### 3.4.1

+ Update Sailfish version to 3.2.1603
+ FIX connect rejects messages if the user tries to send them before the logon is completed (fixes issue with corrupting sender sequence number)

### 3.4.0

+ Added conn-soup
+ Reading dictionary from new directory (`var/th2/config/directory`)

### 3.3.0

+ Added maxMessageBatchSize option to configure limitation of message batch size 
+ Added enableMessageSendingEvent option to manage the event emitted related to sent messages
+ Produce th2_conn_incoming_msg_quantity / th2_conn_outgoing_msg_quantity metrics
+ Use release version for sailfish-core
+ An alert is sent if it gets an ErrorMessage when sending raw message
+ Copies message properties from the th2 proto Message to Sailfish IMessage when converting
+ Resets embedded log4j configuration before configuring from a file

### 3.2.1

+ removed gRPC event loop handling
+ fixed dictionary reading

### 3.2.0

+ reads dictionaries from the /var/th2/config/dictionary folder.
+ uses mq_router, grpc_router, cradle_manager optional JSON configs from the /var/th2/config folder
+ tries to load log4j.properties files from sources in order: '/var/th2/config', '/home/etc', configured path via cmd, default configuration
+ update Cradle version. Introduce async API for storing events

### 3.1.0
+ Validates configured dictionaries during initialization

### 3.0.2
+ Embedded netty pipeline

### 3.0.0
+ Copies the parent event ID from the original raw message to the actual one;
+ Joins all related `IMessage`s to a single raw message;
+ Messages that were sent using this connectivity but did not have any parent event ID
  are attached to the dedicated event for this connectivity.
