FROM ubuntu
RUN  apt-get  update &&\ 
 apt-get -y mysql-client  \
 apt-get install -y pip3 \
 apt-get install -y python3-pip \
 apt-get install -y python3-flask \
 apt-get install  python3-pymysql \
 apt-get install -y sudo
 apt-get install  python3-boto3 
COPY . /web-app
EXPOSE 5000
ENTRYPOINT ['python3']
CMD ['EmpApp.py']
CMD

CMD python3 /web-app/EmpApp.py