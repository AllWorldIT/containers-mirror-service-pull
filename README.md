# Introduction

This is the AllWorldIT Mirror Pull image, used for pulling mirrors into our local storage.

Check the [Alpine Base Image](https://gitlab.iitsp.com/allworldit/docker/alpine/README.md) for more settings.



# Environment

No options available.



# Volumes

## Volume: /data

Data directory.



# Setup

The rsync pull script needs to be mounted along with a cron to run it.

    mirror-pull:
      image: registry.gitlab.iitsp.com/allworldit/docker/mirror-pull/v3.16:latest
      volumes:
        # Crontab
        - ./config/pull/crontab:/etc/crontabs/pull
        - ./config/pull/script:/home/pull/rsync-pull
        # Mirror root
        - ./data/mirror:/data
      networks:
        - internal

An example of the crontab can be found below...

    # min   hour    day     month   weekday command
    */1     *       *       *       *       /home/pull/rsync-pull

