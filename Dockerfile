# base image
FROM python:3.9.15-alpine

# set environment variable
ENV FLASK_APP flasky.py
ENV FLASK_CONFIG docker

# create user `flasky`
RUN adduser -D flasky
# change to the user `flasky`
USER flasky

# working directory
WORKDIR /home/flasky

# copy `requirements` into working directory as `requirements`
COPY requirements requirements
# run python command to create python virtual environment
RUN python -m venv venv
# run command to install python dependencies
RUN venv/bin/pip install -r requirements/docker.txt

COPY app app
COPY migrations migrations
COPY flasky.py config.py boot.sh ./

# expose port `5000`
EXPOSE 5000
# set the start up script
ENTRYPOINT ["./boot.sh"]