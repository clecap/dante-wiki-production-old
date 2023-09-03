

# Debugging

We can enter the containers for introspection by shell commands via

`docker exec -it my-lap-container /bin/ash`
`docker exec -it my-mysql /bin/ash`


# Network access

Provided that these port numbers are free, you can access...

http://localhost:8080/wiki-dir/FAQ
https://localhost:4443/wiki-dir/FAQ

http://ANY_OWN_IP_ADDRESS:8080/wiki-dir/FAQ
https://ANY_OWN_IP_ADDRESS:4443/wiki-dir/FAQ

http://DOCKER_IP_ADDRESS:8080/wiki-dir/FAQ
https://DOCKER_OWN_IP_ADDRESS:4443/wiki-dir/FAQ

Where DOCKER_IP_ADDRESS is the .1 IP in the class C network 
of docker0

netstat -rn produces the line 
  172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0

Then we can reach the server on 172.17.0.1


# Certificate Issues:


TODO: Make a scenario which enables us to include a custom key and custom certificate file for the server.

https is recommended, since some of the Javascript features used in the webserver and in the browser require https for security purposes !!
(for example, delivery using http 2, use of the window placement api and more).



