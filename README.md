# grpclib-docker

Docker container with tools to build Python modules for protobuf messages and grpclib-based services from proto-files.

Usage:

    docker run --mount type=bind,src=$(pwd),target=/src -w /src otkds/grpclib python -m grpc_tools.protoc -I... --python_out=...

or

    docker run --mount type=bind,src=$(pwd),target=/src -w /src otkds/grpclib python -m grpc_tools.protoc -I... --python_grpc_out=...

or

    docker run --mount type=bind,src=$(pwd),target=/src -w /src otkds/grpclib python -m grpc_tools.protoc -I... --mypy_out=...
