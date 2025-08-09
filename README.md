# react-point-of-sale

A simple point of sale application built using react &amp; node.js, yarn..

## Steps to Build and Run application in Docker

Important: Go to Testleaf-pos/src/api/apiBuilder.js -> modify your server ip

### 1. Build Docker Image

To build the Docker image, run the following command in your terminal:

```sh
docker build -t pos-system-app:latest .
```

### 2. Run Application

To run the Docker image, use the following command:

```sh
docker run -d -p 80:80 -p 3500:3500 --name pos-system-app pos-system-app:latest
```

Navigate to `http://publicip` and use `admin` as **username** & **password** to see the dashboard.

## Some screenshots

<img width="1440" alt="login" src="https://user-images.githubusercontent.com/11159061/41917847-c7aaa21e-7978-11e8-89a3-c24991753fd5.png">

<img width="1438" alt="admin page" src="https://user-images.githubusercontent.com/11159061/41917850-c7ea76a0-7978-11e8-8341-363ecbc421f3.png">

<img width="1440" alt="cart" src="https://user-images.githubusercontent.com/11159061/41918060-2fd37dde-7979-11e8-8a17-02d988f1487e.png">
