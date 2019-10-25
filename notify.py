import json
import os
import uuid
from datetime import datetime

import requests


def main(event, context):
    print('event: ')
    print(json.dumps(event))

    for record in event['Records']:
        print('-----')
        data = json.loads(record['body'])
        result = requests.post(os.environ['NOTIFICATION_ENDPOINT'], json=data)
        print(result)

    return
