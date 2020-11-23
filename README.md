# Generic connects

This project contains extensions for base "[Connect](https://github.com/th2-net/th2-conn)" component
to support communication with the target system using common protocols.

Currently, it contains extensions for following protocols:
+ FIX

## Build connects

To build the "Connect" component you will need a Docker installed on your machine.

Execute the Docker build using Dockerfile from project root and pass the project name you need to build using build argument named `project_name`.

For example, if you need to build "Connect" for the FIX protocol the `project_name` parameter should be equal to **conn-fix**.

NOTE: please, make sure the folder with subproject and project name in Gradle are the same.

## Connect parameters and supported services types
Each connect can support several service types. Each one can have its own parameters to configure.
You can find the description for available service types and their configurable parameters in subprojects.