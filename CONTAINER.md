# Imaginary Container Images

Container images based on [imaginary](https://github.com/h2non/imaginary), a fast, simple, and scriptable microservice server for high-level image processing.

Sources are available on [GitHub](https://github.com/anthochamp/container-imaginary).

See [README.md](README.md) for full documentation and configuration reference.

## Image tags

- `x.y.z-imaginaryA.B.C`: Container image version `x.y.z` with imaginary `A.B.C`.
- `edge-imaginaryA.B.C`: Latest commit build with imaginary `A.B.C`.

**Tag aliases:**

- `x.y-imaginaryA.B.C`: Latest patch of `x.y` (major.minor) with imaginary `A.B.C`.
- `x-imaginaryA.B.C`: Latest minor+patch of `x` (major) with imaginary `A.B.C`.
- `x.y.z`: Version `x.y.z` with latest imaginary (only latest container version updated).
- `x.y`: Latest patch of `x.y` (major.minor) with latest imaginary (only latest container major.minor updated).
- `x`: Latest minor+patch of `x` (major) with latest imaginary (only latest container major updated).
- `imaginaryA.B`: Latest container with latest patch of imaginary `A.B` (major.minor).
- `imaginaryA`: Latest container with latest minor+patch of imaginary `A` (major).
- `latest`: Latest `x.y.z-imaginaryA.B.C` tag.
- `edge-imaginaryA.B`: Latest commit build with latest patch of imaginary `A.B` (major.minor).
- `edge-imaginaryA`: Latest commit build with latest minor+patch of imaginary `A` (major).
- `edge`: Latest `edge-imaginaryA.B.C` tag.
