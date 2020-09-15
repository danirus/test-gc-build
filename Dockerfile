FROM nikolaik/python-nodejs:python3.8-nodejs12-alpine
RUN apk add --update gettext git && rm -rf /var/cache/apk/*
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN pip install -r requirements_tests.pip
RUN tox -e pep8 && tox


