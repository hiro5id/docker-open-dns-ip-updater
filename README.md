open-dns-ip-updater
============

This is a simple Docker container for running the [OpenDNS](http://www.opendns.com/) When using OpenDNS, the purpose of dynamic DNS is to preserve your OpenDNS preferences if your ISP or network operator changes your IP address. The software client keeps your IP up to date with OpenDNS automatically.

Usage
-----

Lets Create the **data-only** container to initialize the **/config** volume

	docker run --name=opendns-data -v /config sebestyen/open-dns-ip-updater echo "openDNS data container"

Now lets run openDNS updater and attach to the data only container:

	docker run --name=opendns -d -v /etc/localtime:/etc/localtime -v /config --volumes-from=opendns-data sebestyen/open-dns-ip-updater

When run for the first time, a file named ddclient.conf will be created in the config dir, and the container will exit. Edit
this file, adding your username (email), password, and domains. Then rerun the command.  You can re-start the existing container by running `docker start opendns`

You can edit the config file in the **/config** volume by mounting it and running our container in interactive mode

	docker run --name=opendns-editor -it -v /config --volumes-from=opendns-data sebestyen/open-dns-ip-updater vi /config/ddclient.conf

To check the status, run `docker logs opendns`.