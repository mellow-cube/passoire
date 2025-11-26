# Passoire

## Getting started

### Installing the base image

### Cloning the repository

## Passoire container and application

### Source code

### Documentation

## Making changes to the app
Changes are performed by modifying the Dockerfile.

If you find a _vulnerability_ (bug / security problem):
1. Document it in [`docs/security-issues.md`](docs/security-issues.md)
2. Fix the vulnerability by making changes to the [`Dockerfile`](Dockerfile)
3. Create a new commit with these changes, describing the problem and the changes you performed.

> [NOTE!]
> In your commit message, focus on the _why_, that is, the reasons you made those changes.
> Everyone can already see the _what_, that is, which changes you performed.

## Git
Our app is improved using Git and GitHub.

## Docker

### Dockerfile
The Passoire is modified using instructions in a Dockerfile:
* [Quick Guide]()
* [Full Reference]()

Common ways to modify the image are:
* Changing configuration
* Replacing files (code)
* Deleting files (code)

### Useful commands

Listing available images:
```sh
docker images
```

Inspecting an image:
```sh
docker inspect passoire-group18-base:latest
```

Inspecting just the entrypoint and commands:
```sh
docker inspect passoire-group18-base:latest --format='ENTRYPOINT: {{.Config.Entrypoint}} CMD: {{.Config.Cmd}}'
```

Running an image:
```sh
docker run <image name>
```

Listing running containers (use this to get container IDs):
```sh
docker ps
```

Copying files from a running container:
```sh
docker cp <container id>:<file within container> <target within host>
```

Entering into a container (shell):
```sh
docker exec -it <container id> /bin/bash
```

> [NOTE!]
> To exit from the shell, use the command `exit`.

