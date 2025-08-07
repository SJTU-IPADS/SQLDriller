FROM python:3.11

WORKDIR /

RUN pip3 install virtualenv
RUN python3 -m venv venv

ENV PATH="/venv/bin:$PATH"

COPY VeriEQL/requirements.txt .

RUN pip install -r requirements.txt

COPY VeriEQL /verieql

WORKDIR /verieql

RUN cp -fr z3py_libs/*.py /venv/lib/python3.11/site-packages/z3

RUN python -m test.test_env

RUN chmod -R 777 /verieql/*

RUN apt-get update
RUN apt-get install -y vim less