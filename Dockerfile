FROM python

RUN pip install --no-cache-dir grpclib grpcio-tools protobuf mypy-protobuf
