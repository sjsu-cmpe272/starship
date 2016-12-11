from __future__ import print_function
from boto3.dynamodb.conditions import Key, Attr
from botocore.exceptions import ClientError


import json
import time
import random
import boto3
import datetime

print('WeCook Signup Page')



def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    clientDb = boto3.client('dynamodb')
    client = boto3.client('lambda')
    table = dynamodb.Table('WeCook_Instructor')
    
    
    response = table.scan(
        
        )

    print(response)
    return(response)
  
    
   
    
   