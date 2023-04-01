import json
from flask import Flask, redirect, request, jsonify, url_for
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
import pika
from invokes import invoke_http
import os

app = Flask(__name__)
CORS(app)

COMMUNITY_URL = os.environ.get("COMMUNITY_URL")
ACCOUNT_URL = os.environ.get("ACCOUNT_URL")

# App Routes
@app.route("/", methods=["POST"])
def postComment():

    print("----------- INVOKING OF COMMENTPOST (COMPLEX SERVICE) ------------")

    print("----------- [1] START RETRIEVING REQUEST BODY DATA ------------")

    data = request.get_json()
    post_id = data["post_id"]
    action_user = data["action_user"]
    activity = data["activity"]
    comment = data["comment"]
    name = data["name"]

    print("----------- [2] SUCCESS - RETRIEVED REQUEST BODY DATA ------------")

    print("----------- [3] SEND POST TO COMMUNTIY SERVICE ------------")
    response = invoke_http(COMMUNITY_URL + f"post/{post_id}", method="POST", json=data)

    if response["code"] == 201:
        print("----------- [4] SUCCESS POST TO COMMUNTIY SERVICE ------------")

        print(
            "----------- [5] RETRIEVE USERID FROM COMMUNITY SERVICE USING POSTID------------"
        )
        response = invoke_http(COMMUNITY_URL + f"user/{post_id}", method="POST")
        if response["code"] == 201:
            poster_id = response["data"]["posterID"]
            print(
                "----------- [6] RETRIEVE EMAIL FROM ACCOUNT SERVICE USING USERID------------"
            )

            response = invoke_http(ACCOUNT_URL + f"{poster_id}", method="GET")
            email = response[0]["data"]["email"]

        print("----------- [7] POST REQUEST TO AMQP (SIMPLE SERVICE) ------------")

        def send_to_lavinmq(message):
            channel.basic_publish(exchange="", routing_key=queue_name, body=message)

        url = "amqps://pjfowojn:hi7ZiPRdS6bEQDHZo-_CKeLH7vbINRCn@possum.lmq.cloudamqp.com/pjfowojn"
        params = pika.URLParameters(url)
        connection = pika.BlockingConnection(params)
        channel = connection.channel()
        queue_name = "notifications"

        my_object = {
            "email": email,
            "message": f"{name} has commented on your post",
            "subject": "[Notifiation] Someone commented on your post!",
        }
        message = json.dumps(my_object)
        send_to_lavinmq(message)
        # Close the connection
        connection.close()

        print("----------- [8] SUCCESS - ALL SERVICES UPDATED ------------")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5208, debug=True)
