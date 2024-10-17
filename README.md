# docker-np-exporttools-build

docker build . -t ymiroshnyk/docker-np-exporttools-build:latest

docker run -it --rm --privileged -v $(pwd)/../dev-all:/opt/dev-all -v $(pwd)/ccache:/ccache ymiroshnyk/docker-np-exporttools-build:latest bash
