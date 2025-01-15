# Inception

## About

The **Inception** project focuses on system administration through Docker. It is a multi-container setup with services like **NGINX**, **WordPress**, **MariaDB**, and **Redis** on a personal virtual machine. The infrastructure is secured with **TLS** and optimized for performance.

## Services

1. **NGINX** (with TLS)
2. **WordPress** + **php-fpm**
3. **MariaDB**
4. **Redis Cache**

## Setup

- **Virtual Machine** environment required.
- **Makefile** is used to build Docker images and start services.
- **docker-compose.yml** manages the containers and networking.
- All containers should restart on crash.

## Steps

1. Clone the repository.
2. Run `make` to build the Docker images.
3. Start the containers with `docker-compose up --build`.

Access the application at `https://<your-login>.42.fr`.

## Security Best Practices

- Use **TLS** (TLSv1.2 or TLSv1.3) for secure connections.
- Store sensitive data in environment variables or Docker secrets.
- No credentials in Dockerfiles.

## Conclusion

This project demonstrates creating a secure, multi-service infrastructure using Docker. It enhances your understanding of containerization, networking, and security best practices.


 

![inception grade 105/100](https://github.com/Cheltonne/Cheltonne/blob/main/inception%20grade.png?raw=true)
