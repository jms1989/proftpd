# Running the container
docker run --net=host -d --name proftpd  -v /host_folder_to_share:/home/username jms1989/proftpd

OR

docker-compose

```
    proftpd:
        image: jms1989/proftpd
        restart: always
        volumes:
            - /host_folder_to_share:/home/username
            - ./ftpd.passwd:/etc/proftpd/ftpd.passwd
        network_mode: host
```

# Passive mode note
--net=host - required for passive mode connections.

# Persistent users
to make the users persistent share the passwords file with the host or a data 
-v /home/docker/proftpd/ftpd.passwd:/etc/proftpd/ftpd.passwd 


# Adding new user
docker exec -it  proftpd ftpasswd --file=/etc/proftpd/ftpd.passwd --passwd --shell=/bin/false  --name=username --uid=1001 --home=/home/username 

#User permissions note
--uid - needs to be set to a user id that has permissions to read and write to the home directory

# Deleting user
docker exec -it proftpd ftpasswd --passwd --file /etc/proftpd/ftpd.passwd --delete-user --name username

# Example with persistent users
docker run --restart=always --net=host -d --name proftpd -v /home/http:/home/ -v /home/docker/proftpd/ftpd.passwd:/etc/proftpd/ftpd.passwd jms1989/proftpd



