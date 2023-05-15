FROM ubuntu
RUN sudo apt-get  update &&\ 
sudo apt-get -y mysql-client  \
sudo apt-get install -y pip3 \
sudo apt-get install -y python3-pip \
sudo apt-get install -y python3-flask \
sudo apt-get install  python3-pymysql \
sudo apt-get install -y sudo
sudo apt-get install  python3-boto3 
COPY . /web-app
EXPOSE 5000
ENTRYPOINT ['python3']
CMD ['EmpApp.py']
CMD

CMD python3 /web-app/EmpApp.py