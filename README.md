# Imaginary Container

![GitHub License](https://img.shields.io/github/license/anthochamp/container-imaginary?style=for-the-badge)
![GitHub Release](https://img.shields.io/github/v/release/anthochamp/container-imaginary?style=for-the-badge&color=457EC4)
![GitHub Release Date](https://img.shields.io/github/release-date/anthochamp/container-imaginary?style=for-the-badge&display_date=published_at&color=457EC4)

Container images based on [imaginary](https://github.com/h2non/imaginary), a fast, simple, and scriptable microservice server for high-level image processing.

## How to use this image

```shell
docker run -p 9000:9000 anthochamp/imaginary
```

## Port

| Port   | Protocol | Description           |
|--------|----------|-----------------------|
| `9000` | TCP      | HTTP API (default)    |

## Configuration

Sensitive values may be loaded from files by appending `__FILE` to any supported environment variable name (e.g., `IMAGINARY_API_KEY__FILE=/run/secrets/api_key`).

### IMAGINARY_PORT

**Default**: `9000`

Port for the imaginary HTTP server.

### Command-line arguments

Additional imaginary CLI arguments can be passed as the container command:

```shell
docker run anthochamp/imaginary -concurrency 20 -enable-url-source
```

Refer to the [imaginary documentation](https://github.com/h2non/imaginary#flag-options) for the full list of flags.

## References

- [imaginary documentation](https://github.com/h2non/imaginary)
- [imaginary API documentation](https://github.com/h2non/imaginary#http-api)
