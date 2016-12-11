from __future__ import print_function
from boto3.dynamodb.conditions import Key, Attr
from botocore.exceptions import ClientError


import json
import time
import random
import boto3
import datetime

def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    clientDb = boto3.client('dynamodb')
    client = boto3.client('lambda')
    table = dynamodb.Table('WeCook')
    response = table.get_item(Key= {
            'email address' : event['email address']
    })
    
    if ('Item' not in response):
        print('please check your email address/password')
        return 0
    else:
        print('successful')
        return 1