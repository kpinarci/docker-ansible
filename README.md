# Mount local directory
```bash
$~   docker run --rm -it -v $(pwd):/ansible -v ~/.ssh/:/root/.ssh/:ro <containername>:latest /bin/sh
```
