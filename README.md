<h1 align="center"> GreenVenture </h1> <br>

<p>
Sustainability has become an important aspect of corporate responsibility. Companies are looking for innovative ways to promote sustainable practices   and engage their customers in this mission. Our approach is through sustainability themed missions that rewards users by performing environmentally-     friendly activities through our app GreenVenture. The concept of sustainability missions involves users performing various activities such as recycling. These activities earn users points which they can later redeem for rewards such as vouchers, discounts, or even cashback. 
</p>


## Table of Contents

- [Tech Stack](#tech-stack)
- [Features](#features)
- [Requirements](#requirements)
- [Quick Start](#quick-start)
- [API](#requirements)

## Tech Stack
* Front-End: Vue.js & React.js
* Back-End: Flask & Node.js + Express.js
* Databases: MySQL & MongoDB
* Tools: Docker & LavinMQ

## Features

* Do missions, complete them and earn points
* Redeem vouchers with points
* Participate in the community and view the leaderboards


## Requirements
The application can be run locally or in a docker container, the requirements for each setup are listed below.


### Local


### Docker
* [Docker](https://www.docker.com/get-docker)

## Quick Start
Make sure ....

### Run Local
```bash
$ ??
```

Application will run by default on port `1234`

Configure the port by changing `server.port` in __application.yml__


### Run Docker

First build the image:
```bash
$ docker-compose build
```

When ready, run it:
```bash
$ docker-compose up
```

Application will run by default on port `1234`


## API

### Leaderboards
#### Base API URL
http://localhost:5103/api/leaderboards

#### Get all users
**GET:** /<br>
**Send:** NIL <br>
**Receive:** All Users, Response Code - 200 OK || Response Code - 404 || Response Code - 404, unknown endpoint

#### Get specific user
**GET:** /:userId <br>
**Send:** NIL <br>
**Receive:** Specific User, Response Code - 200 OK || Response Code - 404 || Response Code - 404, unknown endpoint

#### Add a user
**POST:** / <br>
**Send:** userId (String), name (String), points (Number)<br>
**Receive:**  User Object, Response Code - 201 || Exception || Response Code - 404, unknown endpoint

#### Update a user's points
**PATCH:** /:userId <br>
**Send:** points (Number) <br>
**Receive:** Response Code - 204, No Content || Respose Code - 404 ||Respose Code - 404, unknown endpoint
