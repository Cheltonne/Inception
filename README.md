# Inception
<h1>Introduction</h1>

This Docker compose infrastructure is designed to provide a simple and easy-to-use environment for running a Wordpress website, with MariaDB as the database and Redis for caching. Additionally, an FTP server is provided to allow easy file uploads.
Prerequisites

    Docker
    Docker Compose

Getting Started

    Clone this repository.

git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git

    Change into the project directory

cd srcs

    Build and start the containers

make

    Once the containers are running, you can access your Wordpress website by visiting http://localhost:8080 in your browser.

    You can also access phpMyAdmin on http://localhost:8081 to manage your MariaDB database

    Connect to the FTP server using your favorite FTP client software by using the host localhost, port 21 and the credentials provided in the .env file

    The redis server is also running on default port 6379 and can be accessed with the credentials provided in the .env file

    If you want to stop the containers, you can use the following command

make down

Note

    You can change the credentials and other settings by modifying the .env file
    You can also customize the configuration of the services by modifying the respective configuration files located in the config directory
    If you make any changes to the Dockerfile, run the following command to rebuild the services:

make 

Conclusion

This is a basic Docker Compose infrastructure that you can use as a starting point for your own projects. With this setup, you can easily spin up a development environment, run your tests, and deploy your application to production with minimal changes.
