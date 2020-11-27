# Generic connects

This project contains extensions for the base component "[Connect](https://github.com/th2-net/th2-conn)" component
to support communication with the target system by using common protocols.

Currently, it contains extensions for the following protocols:
+ [fix](conn-fix/README.md)

## Build connects

To build the "Connect" component you will need to have a Docker installed on your machine.

Execute the Docker build using Dockerfile from the project root and pass the project name
(the project you want to use for creating the image) using the build argument named `project_name`.

For example, if you need to build "Connect" for the FIX protocol the `project_name` parameter should be equal to **conn-fix**.

NOTE: please, make sure that the folder which contains the subproject and the project name in Gradle are the same.

## Connect parameters and supported services types
Each connect can support several service types and each one can have its own parameters to configure.
You can find the description for the available service types and their configurable parameters within subprojects.
