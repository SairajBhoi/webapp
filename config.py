import boto3
import configparser
import json
import os

secret_name = "mysql-db-secret"
region_name = "ap-south-1"
config      = configparser.ConfigParser()

config.read(r'/home/ubuntu/.aws')

profile_name = 'default' 
access_key   = config.get(profile_name, 'aws_access_key_id')
secret_key   = config.get(profile_name, 'aws_secret_access_key')
session      = boto3.session.Session()

client = session.client(
   aws_access_key_id     = access_key,
   aws_secret_access_key = secret_key,
   service_name          = 'secretsmanager',
   region_name           = region_name
)
response     = client.get_secret_value(SecretId=secret_name)
secret_value = json.loads(response['SecretString'])

customhost   = secret_value["host"]
customuser   = secret_value["username"]
custompass   = secret_value["password"]
customdb     = "projet_app_db"
custombucket = "emp-info-bucket"
customregion = "ap-south-1"
print(customhost)