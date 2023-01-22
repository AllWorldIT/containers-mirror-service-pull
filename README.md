[![pipeline status](https://gitlab.conarx.tech/containers/mirror-service-pull/badges/main/pipeline.svg)](https://gitlab.conarx.tech/containers/mirror-service-pull/-/commits/main)

# Container Information

[Container Source](https://gitlab.conarx.tech/containers/mirror-service-pull) - [GitHub Mirror](https://github.com/AllWorldIT/containers-mirror-service-pull)

This is the Conarx Containers Mirror Pull Service image, it provides a basic container for scheduling of rsync pulls from an
upstream mirror.



# Mirrors

|  Provider  |  Repository                                         |
|------------|-----------------------------------------------------|
| DockerHub  | allworldit/mirror-service-pull                      |
| Conarx     | registry.conarx.tech/containers/mirror-service-pull |



# Conarx Containers

All our Docker images are part of our Conarx Containers product line. Images are generally based on Alpine Linux and track the
Alpine Linux major and minor version in the format of `vXX.YY`.

Images built from source track both the Alpine Linux major and minor versions in addition to the main software component being
built in the format of `vXX.YY-AA.BB`, where `AA.BB` is the main software component version.

Our images are built using our Flexible Docker Containers framework which includes the below features...

- Flexible container initialization and startup
- Integrated unit testing
- Advanced multi-service health checks
- Native IPv6 support for all containers
- Debugging options



# Community Support

Please use the project [Issue Tracker](https://gitlab.conarx.tech/containers/mirror-service-pull/-/issues).



# Commercial Support

Commercial support for all our Docker images is available from [Conarx](https://conarx.tech).

We also provide consulting services to create and maintain Docker images to meet your exact needs.



# Environment Variables

Environment variables are available from...
* [Conarx Containers Alpine image](https://gitlab.conarx.tech/containers/alpine).



# Volumes


## /data

Mirror data directory.

Files and directories should be owned by 1001:1001.



# Setup

The rsync pull script that needs to be run needs to be mounted along with a cron to run it.

```yaml
mirror-pull:
  image: registry.conarx.tech/containers/mirror-service-pull/3.17
  volumes:
    # Crontab
    - ./config/pull/crontab:/etc/cron.d/mirror-pull
    - ./config/pull/script:/home/pull/rsync-pull
    # Mirror root
    - ./data/mirror:/data
  networks:
    - internal
```

An example of the `mirror-pull` crontab above can be found below...

```cron
# min   hour    day     month   weekday   user    command
*/1     *       *       *       *         pull    /home/pull/rsync-pull
```
