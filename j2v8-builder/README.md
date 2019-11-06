# j2v8 builder

## Linux

Build the Docker image:
```console
make build
```

Run the build:

```console
docker run --name builder j2v8-builder:latest
```

Extract the artifact:
```console
docker cp builder:/srv/artifacts .
```

## OSX

1. Install XCode
2. Install Oracle JDK 1.8
3. Check that Python 2.7 is installed

Run the build script:

```console
./build_osx.sh
```
