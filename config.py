
import boto3
import configparser
import json
import os

os.environ['AWS_CONFIG_FILE']='~/.aws/config'
os.environ['AWS_SHARED_CREDENTIALS_FILE']='~/.aws/credentials'

session = boto3.Session(profile_name='default')
client = session.client('secretsmanager',region_name='ap-south-1')

response = client.get_secret_value(
    SecretId = 'mysql-db-secret'
)



    
secretDict = json.loads(response['SecretString'])

    # host=secretDict['host'],
    # user=secretDict['username'],
    # password=custompasssecretDict['password'],
    # db=secretDict['dbname']



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













