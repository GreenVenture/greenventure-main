<h1 align="center"> GreenVenture </h1> <br>

<p>
Inspired by the Healthy 365 app launched by the Health Promotion Board (HPB), GreenVenture is an application that rewards users for recyling a non-contaminated recyclable. Like the Healthy 365 app where users are allowed to scan a QRCode to gain points after purchasing a healthier choice product, this approach towards recycling not only incentives users to come ahead to recycle, but also provide instant feedback to users on whether their item is valid recyclable. 
</p>

## Table of Contents

- [Tech Stack](#tech-stack)
- [Features](#features)
- [Requirements](#requirements)
- [Quick Start](#quick-start)
- [Screenshots](#screenshots)

## Tech Stack
* Front-End: Vue.js & React.js
* Back-End: Flask & Node.js + Express.js
* Databases: MySQL & MongoDB
* Tools: Docker & LavinMQ

## Features

* Participate and complete sustainability themed missions and earn points
* Redeem vouchers with points
* Participate in the community and view the leaderboards


## Requirements
The application can be run locally or in a docker container, the requirements for the setup is listed below.

### Docker
* [Docker](https://www.docker.com/get-docker)

### Quick Start

#### Run Docker

First build the image:
```bash
$ docker-compose build
```

When ready, run it:
```bash
$ docker-compose up
```

Application will run by default on port `8080` <br>
Secondary UIs: <br>
* `recycling-bin-frontend` - `8081`
* `leaderboards` - `3000`

## Screenshots
#### INSERT MORE SCREENSHOTS

#### Leaderboards Page
![Screenshot 2023-04-01 at 3 57 37 PM](https://user-images.githubusercontent.com/86020207/229273581-a90da9d4-1453-4e09-b278-be2adc280f2f.png)
