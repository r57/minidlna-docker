# MiniDLNA 

MediaReady (former MiniDLNA) docker image based of Alpine linux.

| Component   | Version   |
|-------------|-----------|
| Alpine      | 3.18.2    |
| Minidlna    | 1.3.1     |

## Usage

```bash
docker run \
  --name=minidlna \
  -e UID=1000 \
  -e GID=1000 \
  -e USER=minidlna \
  -e GROUP=minidlna \
  -p 8200:8200 \
  -v "$(pwd)"/minidlna.conf:/etc/minidlna.conf \
  slajchrt/minidlna:latest
```