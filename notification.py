import json
import os
import uuid
from datetime import datetime

import boto3
import requests

def main():
    sqs = boto3.client('sqs')
    q_url = os.environ['QUEUE_URL']

    response = sqs.receive_message(
        QueueUrl=url,
        AttributeNames=[
            'SentTimestamp'
        ],
        MaxNumberOfMessages=1,
        VisibilityTimeout=0,
        WaitTimeSeconds=0
    )

    message = response['Messages'][0]
    body = json.loads(message['Body'])
    print(body)
