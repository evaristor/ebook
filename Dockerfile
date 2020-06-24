FROM islasgeci/base:latest
COPY . .
RUN apt update && apt install --yes \
    pandoc \
    texlive \
    texlive-xetex
