# RhodeCode VCS Server

[![](https://images.microbadger.com/badges/version/ckulka/rhodecode-vcsserver:4.9.0.svg)](https://github.com/ckulka/rhodecode-vcsserver "Get your own version badge on microbadger.com")

This image is the same as [ckulka/rhodecode-rccontrol](https://hub.docker.com/r/ckulka/rhodecode-rccontrol/), with the exception that a
VCS Server is installed and ready-to-use.

```bash
docker run -it -p 9900:9900 ckulka/rhodecode-vcsserver:4.9.0
```

For more details, see <https://github.com/ckulka/rhodecode-vcsserver>.

## Supported Tags

I follow the same naming scheme for the images as [RhodeCode](https://docs.rhodecode.com/RhodeCode-Enterprise/release-notes/release-notes.html) themselves

- [latest](https://github.com/ckulka/rhodecode-vcsserver/tree/master) (corresponds to 4.9.0)
- [4.9.0](https://github.com/ckulka/rhodecode-vcsserver/tree/4.9.0)

## Complete Stack

The following `docker-compose.yaml` file spins up a complete RhodeCode stack

```yaml
version: "3"

services:
  vcsserver:
    image: ckulka/rhodecode-vcsserver:4.9.0

  db:
    image: postgres:9-alpine
    environment:
      POSTGRES_PASSWORD: cookiemonster

  rhodecode:
    image: ckulka/rhodecode-ce:4.9.0
    environment:
      RC_USER: admin
      RC_PASSWORD: ilovecookies
      RC_EMAIL: adalovelace@example.com
      RC_DB: postgresql://postgres:cookiemonster@db
      RC_CONFIG: |
        [app:main]
        vcs.server = vcsserver:9900
    ports:
      - "5000:5000"
    links:
      - db
      - vcsserver
```
