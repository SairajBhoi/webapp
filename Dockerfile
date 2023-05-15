FROM ubuntu
RUN  apt-get  update &&\ 
  apt-get install -y mysql-client  \
  python3 \
  python3-flask \
  python3-pymysql \
  sudo \
  python3-boto3 \
  mysql-connector-python 
WORKDIR /web-app
COPY . /web-app
EXPOSE 5000
ENTRYPOINT ["python3"]
CMD ["EmpApp.py"]
