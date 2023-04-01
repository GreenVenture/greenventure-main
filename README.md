<h1 align="center"> GreenVenture </h1> <br>

<p>
Sustainability has become an important aspect of corporate responsibility. Companies are looking for innovative ways to promote sustainable practices   and engage their customers in this mission. Our approach is through sustainability themed missions that rewards users by performing environmentally-     friendly activities through our app GreenVenture. The concept of sustainability missions involves users performing various activities such as recycling. These activities earn users points which they can later redeem for rewards such as vouchers, discounts, or even cashback. 
</p>

## Table of Contents

- [Tech Stack](#tech-stack)
- [Features](#features)
- [Requirements](#requirements)
- [Quick Start](#quick-start)
- [Screenshots](#screenshots)
- [API](#requirements)

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

## Screenshots
#### INSERT MORE SCREENSHOTS

#### Leaderboards Page
![Screenshot 2023-04-01 at 3 57 37 PM](https://user-images.githubusercontent.com/86020207/229273581-a90da9d4-1453-4e09-b278-be2adc280f2f.png)

## API Documentation
```
  {
      "name": "Community",
      "item": [
          {
              "name": "Get all UserPosts",
              "request": {
                  "method": "GET",
                  "header": [],
                  "url": {
                      "raw": "http://localhost:5104/all",
                      "protocol": "http",
                      "host": [
                          "localhost"
                      ],
                      "port": "5104",
                      "path": [
                          "all"
                      ]
                  }
              },
              "response": []
          },
          {
              "name": "Get all UserPost by UserID",
              "request": {
                  "method": "GET",
                  "header": [],
                  "url": {
                      "raw": "localhost:5104/00001",
                      "host": [
                          "localhost"
                      ],
                      "port": "5104",
                      "path": [
                          "00001"
                      ]
                  }
              },
              "response": []
          },
          {
              "name": "Get Poster's Email by PostID",
              "request": {
                  "method": "GET",
                  "header": [],
                  "url": {
                      "raw": "http://localhost:5104/user/00001",
                      "protocol": "http",
                      "host": [
                          "localhost"
                      ],
                      "port": "5104",
                      "path": [
                          "user",
                          "00001"
                      ]
                  }
              },
              "response": []
          },
          {
              "name": "Get all Post Details by PostID",
              "request": {
                  "method": "GET",
                  "header": [],
                  "url": {
                      "raw": "localhost:5104/post/00001",
                      "host": [
                          "localhost"
                      ],
                      "port": "5104",
                      "path": [
                          "post",
                          "00001"
                      ]
                  }
              },
              "response": []
          },
          {
              "name": "Create New Post",
              "request": {
                  "method": "POST",
                  "header": [],
                  "body": {
                      "mode": "raw",
                      "raw": "{\n    \"post\":  \"This is a test post\"\n}",
                      "options": {
                          "raw": {
                              "language": "json"
                          }
                      }
                  },
                  "url": {
                      "raw": "localhost:5104/00001",
                      "host": [
                          "localhost"
                      ],
                      "port": "5104",
                      "path": [
                          "00001"
                      ]
                  }
              },
              "response": []
          },
          {
              "name": "Create new post activity",
              "request": {
                  "method": "POST",
                  "header": [],
                  "body": {
                      "mode": "raw",
                      "raw": "{\n    \"action_user\": \"2\",\n    \"activity\": \"like\",\n    \"comment\":  null\n}",
                      "options": {
                          "raw": {
                              "language": "json"
                          }
                      }
                  },
                  "url": {
                      "raw": "localhost:5104/post/1",
                      "host": [
                          "localhost"
                      ],
                      "port": "5104",
                      "path": [
                          "post",
                          "1"
                      ]
                  }
              },
              "response": []
          },
          {
              "name": "Delete PostDetail by PrimaryKey",
              "request": {
                  "method": "DELETE",
                  "header": [],
                  "body": {
                      "mode": "raw",
                      "raw": "{\n    \"activity_datetime\": \"2023-04-01 02:19:53\",\n    \"action_user\": \"2\"\n}",
                      "options": {
                          "raw": {
                              "language": "json"
                          }
                      }
                  },
                  "url": {
                      "raw": "localhost:5104/post/1",
                      "host": [
                          "localhost"
                      ],
                      "port": "5104",
                      "path": [
                          "post",
                          "1"
                      ]
                  }
              },
              "response": []
          },
          {
              "name": "Delete Post by PostID",
              "request": {
                  "method": "DELETE",
                  "header": [],
                  "body": {
                      "mode": "raw",
                      "raw": "{\n    \"activity_datetime\": \"2023-03-26 14:11:21\",\n    \"action_user\": \"2\"\n}",
                      "options": {
                          "raw": {
                              "language": "json"
                          }
                      }
                  },
                  "url": {
                      "raw": "localhost:5104/4",
                      "host": [
                          "localhost"
                      ],
                      "port": "5104",
                      "path": [
                          "4"
                      ]
                  }
              },
              "response": []
          }
      ]
    },
    {
        "name": "Account",
        "item": [
            {
                "name": "GET OAUTH Facebook Login",
                "request": {
                    "method": "GET",
                    "header": [],
                    "url": {
                        "raw": "http://localhost:5100/login",
                        "protocol": "http",
                        "host": [
                            "localhost"
                        ],
                        "port": "5100",
                        "path": [
                            "login"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "GET OAUTH Get AccessToken",
                "request": {
                    "auth": {
                        "type": "oauth2",
                        "oauth2": [
                            {
                                "key": "scope",
                                "value": "email,public_profile",
                                "type": "string"
                            },
                            {
                                "key": "clientSecret",
                                "value": "{{FB_CLIENT_SECRET}}",
                                "type": "string"
                            },
                            {
                                "key": "clientId",
                                "value": "{{FB_CLIENT_ID}}",
                                "type": "string"
                            },
                            {
                                "key": "addTokenTo",
                                "value": "header",
                                "type": "string"
                            }
                        ]
                    },
                    "method": "GET",
                    "header": [],
                    "url": {
                        "raw": "http://localhost:5100/login",
                        "protocol": "http",
                        "host": [
                            "localhost"
                        ],
                        "port": "5100",
                        "path": [
                            "login"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "New Request",
                "request": {
                    "method": "GET",
                    "header": [],
                    "url": {
                        "raw": "localhost:5100/162804203307686",
                        "host": [
                            "localhost"
                        ],
                        "port": "5100",
                        "path": [
                            "162804203307686"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "Get User by UserID",
                "request": {
                    "method": "POST",
                    "header": [],
                    "body": {
                        "mode": "raw",
                        "raw": "{\n    \"aId\": \"123123123123\",\n    \"email\": \"test@gmail.com\",\n    \"name\": \"testie\"\n}",
                        "options": {
                            "raw": {
                                "language": "json"
                            }
                        }
                    },
                    "url": {
                        "raw": "http://localhost:5208/",
                        "protocol": "http",
                        "host": [
                            "localhost"
                        ],
                        "port": "5208",
                        "path": [
                            ""
                        ]
                    }
                },
                "response": []
            }
        ]
    },
    {
        "name": "Recycling Bin",
        "item": [
            {
                "name": "generate_code",
                "request": {
                    "method": "POST",
                    "header": [],
                    "body": {
                        "mode": "raw",
                        "raw": "{\n    \"params\":{\n    \"mission_category\":\"Paper\"\n    }\n}",
                        "options": {
                            "raw": {
                                "language": "json"
                            }
                        }
                    },
                    "url": {
                        "raw": "http://127.0.0.1:5105/generate_code",
                        "protocol": "http",
                        "host": [
                            "127",
                            "0",
                            "0",
                            "1"
                        ],
                        "port": "5105",
                        "path": [
                            "generate_code"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "redeem_code",
                "request": {
                    "method": "POST",
                    "header": [],
                    "body": {
                        "mode": "raw",
                        "raw": "{\n    \"params\":{\n    \"verification_code\":\"822850\"\n    }\n}",
                        "options": {
                            "raw": {
                                "language": "json"
                            }
                        }
                    },
                    "url": {
                        "raw": "http://127.0.0.1:5105/redeem_code",
                        "protocol": "http",
                        "host": [
                            "127",
                            "0",
                            "0",
                            "1"
                        ],
                        "port": "5105",
                        "path": [
                            "redeem_code"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "get_verification_code",
                "request": {
                    "method": "POST",
                    "header": [],
                    "body": {
                        "mode": "raw",
                        "raw": "{\n    \"mission_category\": \"Plastic\"\n}",
                        "options": {
                            "raw": {
                                "language": "json"
                            }
                        }
                    },
                    "url": {
                        "raw": "http://127.0.0.1:5105/generate_code",
                        "protocol": "http",
                        "host": [
                            "127",
                            "0",
                            "0",
                            "1"
                        ],
                        "port": "5105",
                        "path": [
                            "generate_code"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "/complete mission",
                "request": {
                    "method": "POST",
                    "header": [],
                    "body": {
                        "mode": "raw",
                        "raw": "{\n    \"missionid\": 1,\n    \"userid\": \"162804203307686\",\n    \"verification_code\": \"516931\"\n}",
                        "options": {
                            "raw": {
                                "language": "json"
                            }
                        }
                    },
                    "url": {
                        "raw": "http://localhost:5201/complete_mission",
                        "protocol": "http",
                        "host": [
                            "localhost"
                        ],
                        "port": "5201",
                        "path": [
                            "complete_mission"
                        ]
                    }
                },
                "response": []
            }
        ]
    },
    {
        "name": "Mission",
        "item": [
            {
                "name": "complete_mission",
                "request": {
                    "method": "POST",
                    "header": [],
                    "body": {
                        "mode": "raw",
                        "raw": "{\n    \"params\":{\n        \"userid\":2,\n        \"missionid\":2,\n        \"verification_code\": \"528819\"\n    }\n}",
                        "options": {
                            "raw": {
                                "language": "json"
                            }
                        }
                    },
                    "url": {
                        "raw": "http://127.0.0.1:5201/complete_mission",
                        "protocol": "http",
                        "host": [
                            "127",
                            "0",
                            "0",
                            "1"
                        ],
                        "port": "5201",
                        "path": [
                            "complete_mission"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "accept_mission",
                "request": {
                    "method": "POST",
                    "header": [],
                    "body": {
                        "mode": "raw",
                        "raw": "{\n    \"params\":{\n        \"userid\":2,\n        \"missionid\":4\n    }\n}",
                        "options": {
                            "raw": {
                                "language": "json"
                            }
                        }
                    },
                    "url": {
                        "raw": "http://127.0.0.1:5201/accept_mission",
                        "protocol": "http",
                        "host": [
                            "127",
                            "0",
                            "0",
                            "1"
                        ],
                        "port": "5201",
                        "path": [
                            "accept_mission"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "get_all_available_mission",
                "request": {
                    "method": "GET",
                    "header": [],
                    "url": {
                        "raw": "http://127.0.0.1:5201/mission/2",
                        "protocol": "http",
                        "host": [
                            "127",
                            "0",
                            "0",
                            "1"
                        ],
                        "port": "5201",
                        "path": [
                            "mission",
                            "2"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "get_all_in_progress_mission",
                "protocolProfileBehavior": {
                    "disableBodyPruning": true
                },
                "request": {
                    "method": "GET",
                    "header": [],
                    "body": {
                        "mode": "raw",
                        "raw": "{\n    \"userid\":2\n}",
                        "options": {
                            "raw": {
                                "language": "json"
                            }
                        }
                    },
                    "url": {
                        "raw": "http://127.0.0.1:5201/in_progress_mission/2",
                        "protocol": "http",
                        "host": [
                            "127",
                            "0",
                            "0",
                            "1"
                        ],
                        "port": "5201",
                        "path": [
                            "in_progress_mission",
                            "2"
                        ]
                    }
                },
                "response": []
            }
        ]
    },
    {
        "name": "Leaderboard",
        "item": [
            {
                "name": "GET All Record in Leaderboard",
                "request": {
                    "method": "GET",
                    "header": [],
                    "url": {
                        "raw": "http://localhost:5103/api/leaderboards/",
                        "protocol": "http",
                        "host": [
                            "localhost"
                        ],
                        "port": "5103",
                        "path": [
                            "api",
                            "leaderboards",
                            ""
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "GET Specific Record in Leaderboard",
                "request": {
                    "method": "GET",
                    "header": [],
                    "url": {
                        "raw": "http://localhost:5103/api/leaderboards/162804203307686",
                        "protocol": "http",
                        "host": [
                            "localhost"
                        ],
                        "port": "5103",
                        "path": [
                            "api",
                            "leaderboards",
                            "162804203307686"
                        ]
                    }
                },
                "response": []
            },
            {
                "name": "PATCH Add points to specific user",
                "request": {
                    "method": "PATCH",
                    "header": [],
                    "body": {
                        "mode": "raw",
                        "raw": "{\n    \"points\": 50000\n}",
                        "options": {
                            "raw": {
                                "language": "json"
                            }
                        }
                    },
                    "url": {
                        "raw": "http://localhost:5103/api/leaderboards/162804203302686",
                        "protocol": "http",
                        "host": [
                            "localhost"
                        ],
                        "port": "5103",
                        "path": [
                            "api",
                            "leaderboards",
                            "162804203302686"
                        ]
                    }
                },
                "response": []
            }
        ]
    },
    {
        "name": "commentPost Trigger",
        "request": {
            "method": "GET",
            "header": [],
            "url": {
                "raw": "localhost:5104/community/",
                "host": [
                    "localhost"
                ],
                "port": "5104",
                "path": [
                    "community",
                    ""
                ]
            }
        },
        "response": []
    }
],
"variable": [
    {
        "key": "FB_CLIENT_ID",
        "value": "207392055310912"
    },
    {
        "key": "FB_CLIENT_SECRET",
        "value": "85f92b197a5c9b7cad6cdeb19809e86a"
    }
]

```
