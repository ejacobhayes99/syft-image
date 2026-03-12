# Syft SBOM Scanner Image

Pre-built Docker image containing [Syft](https://github.com/anchore/syft) for
SBOM generation in CI pipelines. Replaces runtime curl-based Syft installation,
providing faster job startup and reproducible builds.

## Image Details

| Property | Value |
|----------|-------|
| Base | `alpine:3.23` |
| Syft version | `1.22.0` |
| Image version | `0.1.0` |
| Entrypoint | `syft` |
| Additional tools | `curl`, `bash`, `jq` |

The **image version** (`0.1.0`) tracks this image's release cycle independently
from the Syft tool version (`1.22.0`).

## Build

```bash
docker build -t syft:0.1.0 .
```

To build with a different Syft version:

```bash
docker build --build-arg SYFT_VERSION=1.23.0 -t syft:0.2.0 .
```

## Usage

### CLI

```bash
docker run --rm syft:0.1.0 <target>
```

### GitLab CI

This image is used by the `.syft-sbom` job template in the
[Templates](../../templates/) project:

```yaml
.syft-sbom:
  image:
    name: syft:0.1.0
    entrypoint: [""]
  script:
    - syft ${SYFT_TARGET} -o cyclonedx-json=sbom.cdx.json
```
