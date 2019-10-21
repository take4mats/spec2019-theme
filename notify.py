import json
import os
import uuid
from datetime import datetime

import boto3
import requests

def main(event, context):
    sqs = boto3.client('sqs')
    q_url = os.environ['QUEUE_URL']

    response = sqs.receive_message(
        QueueUrl=q_url,
        AttributeNames=[
            'SentTimestamp'
        ],
        MaxNumberOfMessages=1,
        VisibilityTimeout=0,
        WaitTimeSeconds=0
    )

    message = response['Messages'][0]
    data = json.loads(message['Body'])
    print(data)

    result = requests.post(os.environ['NOTIFICATION_ENDPOINT'], json=data)
    print(result)
    return