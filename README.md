<h1 align="center"> GreenVenture </h1> <br>

<p align="center">
  Sample microservice description.
</p>


## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Quick Start](#quick-start)
- [Testing](#testing)
- [API](#requirements)
- [Acknowledgements](#acknowledgements)




## Introduction

TODO: Replace with introduction

## Features
TODO: Description of features

* Include a list of
* all the many beautiful
* web server features


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

## Testing
TODO: Additional instructions for testing the application.


## API
TODO: API Reference with examples, or a link to a wiki or other documentation source.

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

## Acknowledgements
TODO: Show folks some love.
