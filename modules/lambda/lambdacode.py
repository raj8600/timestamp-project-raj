import json
import boto3
from time import time, strftime

dynamodb = boto3.resource('dynamodb')
table_name = "timestamp_tb"
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    try:
        # Get user timestamp from API Gateway event
        #user_timestamp = event['queryStringParameters']['timestamp']

        # Convert timestamp to human-readable format
        timestamp = strftime('%Y-%m-%d %H:%M:%S')
 
        #fetch the first and last name of user
        name = event.get('firstName', '') + ' ' + event.get('lastName', '')

        # Store user timestamp in DynamoDB
        table.put_item(
            Item={
                'ID': name,
                'timestamp': timestamp
            }
        )
        
        # Return success response
        response = {
            'statusCode': 200,
            'body': json.dumps('Timestamp stored successfully')
        }
        
    except Exception as e:
        # Return error response
        response = {
            'statusCode': 500,
            'body': json.dumps(str(e))
        }
        
    return response
