# Generic connects (3.2.1)

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