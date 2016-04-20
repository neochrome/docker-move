# Move
Moves existing and new files from one directory to another. Works by
scanning the source directory for files and then moving them into the
specified target directory.

## Usage
Mount volumes with source and target directories and specify those
directories as command line arguments when launching:
```
$ docker run --rm -it -v /path/to/monitor:/incoming -v /path/to/drop:/processed neochrome/move /incoming /processed
```

Default scanning interval is 30 seconds, but may be specified using the `-i` switch:

```
$ docker run --rm -it -v /path/to/monitor:/incoming -v /path/to/drop:/processed neochrome/move -i 10 /incoming /processed
```
