# docker build -t aaheiev/moto-sqs-server .
FROM python:3.10

RUN python -m pip install --upgrade pip \
    && pip install 'moto[server,sqs]'

CMD moto_server sqs -H 0.0.0.0

HEALTHCHECK --interval=15s --timeout=3s CMD curl --fail http://localhost:5000/?Action=ListQueues || exit 1

EXPOSE 5000
