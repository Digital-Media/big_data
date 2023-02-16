# Get Access to an ELK Stack

## Use ELK Docker Containers

### Use Docker Desktop

For a Download Link and how to install Docker Desktop see [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)
Docker Desktop on Windows makes adminstrative tasks easier to handle.

### Get the official ELK Docker image

Open Powershell or other Terminal.
Note that tag `latest` is not supported.

We use the template from [gitHub](https://github.com/deviantony/docker-elk) for demonstration purposes.
Cloning from Digital-Media guarantees, that you work with a version, that was used during creating the exercises.
If the original template changes, that has no effect on the repo on Digital-Media, because changes are not merged automatically.
```shell
git clone https://github.com/Digital-Media/elk-stack-dock.git
```

use docker compose v3.3 or hiher
```shell
docker compose -f docker-stack.yml up -d
```

The current version already supports extensions like filebeat, metricbeat and so on

Using and starting these extension is part of the instruction in the [exercises](https://github.com/Digital-Media/big_data/blob/main/elk-stack/EXERCISE.md)