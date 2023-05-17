
# Use this code snippet in your app.
# If you need more information about configurations
# or implementing the sample code, visit the AWS docs:
# https://aws.amazon.com/developer/language/python/

import boto3
from botocore.exceptions import ClientError


def get_secret():

    secret_name = "mysql-db-secret"
    region_name = "ap-south-1"

    # Create a Secrets Manager client
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        # For a list of exceptions thrown, see
        # https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
        raise e

    # Decrypts secret using the associated KMS key.
    secret = get_secret_value_response['SecretString']

    # Your code goes here.











    # customhost = secret[host]
    # customuser = secret[username]
    # custompass = secret[password]
    # customdb = "projet-app-db"
    # custombucket = "emp-info-bucket"
    # customregion = "ap-south-1"


    customhost = "mysql-db.cgyckgniwvyw.ap-south-1.rds.amazonaws.com"
    customuser = "root"
    custompass = "root1234"
    customdb = "projet-app-db"
    custombucket = "emp-info-bucket"
    customregion = "ap-south-1"
