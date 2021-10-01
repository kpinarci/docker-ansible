# Mount local directory
```bash
$~   docker run --rm -it -v $(pwd):/ansible -v ~/.ssh/:/root/ <containername>:latest /bin/sh
```
