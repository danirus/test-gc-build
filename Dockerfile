FROM nikolaik/python-nodejs:python3.8-nodejs12-alpine

ARG BRANCH_NAME=master

RUN apk add --update gettext git && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app

RUN git clone -b ${BRANCH_NAME} --depth=1 --single-branch \
  git://github.com/danirus/test-gc-build.git && \
  cd test-gc-build && \
  pip install -r requirements_tests.pip

WORKDIR /usr/src/app/test-gc-build

RUN tox -e pep8 && tox


