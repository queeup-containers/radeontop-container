
# [radeontop](https://github.com/clbr/radeontop) in a container

## Tags

- `latest`: latest radeontop on top of scratch image
  - `1.4-r1`: you can choose specific version of radeontop

## Use

```bash
docker run \
    --rm \
    --interactive \
    --tty \
    --device /dev/dri \
    ghcr.io/queeup-containers/radeontop-container:latest
```

## Build

```bash
docker build -t radeontop-container --file Containerfile .
```
