
import boto3
import configparser
import json
import os

# os.environ['AWS_CONFIG_FILE']='~/.aws/config'
# os.environ['AWS_SHARED_CREDENTIALS_FILE']='~/.aws/credentials'

# session = boto3.Session(profile_name='default')
# client = session.client('secretsmanager',region_name='ap-south-1')

# response = client.get_secret_value(
#     SecretId = 'mysql-db-secret'
# )



    
# secretDict = json.loads(response['SecretString'])


# Use this code snippet in your app.
# If you need more information about configurations
# or implementing the sample code, visit the AWS docs:
# https://aws.amazon.com/developer/language/python/

# import boto3
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




    host=secretDict['host'],
    user=secretDict['username'],
    password=custompasssecretDict['password'],
    db=secretDict['dbname']

    custombucket = "emp-info-bucket"
    customregion = "ap-south-1"

# secret_name = "mysql-db-secret"
# region_name = "ap-south-1"
# config = configparser.ConfigParser()
# config.read( '~/.aws/credentials')
# profile_name = 'default'

# access_key = config.get(profile_name,'aws_access_key_id')
# secret_key = config.get(profile_name,'aws_secret_acess_key')

# session = boto3.session.Session()
# client = session.client(
#     service_name = 'secretsmanager',
#     region_name = region_name
# )


# response = client.get_secret_value(SecretId=secret_name)
# secret_value = json.loads(response['SecretString'])













