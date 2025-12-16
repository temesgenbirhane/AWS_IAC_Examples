# upload a file with its metdata
```sh
aws s3api put-object \
--bucket checksumexample65785876 \
--key hello.txt \
--body hello.txt \
--metadata planet=Mars
```

# get the metdata using head object
```sh
aws s3api head-object --bucket checksumexample65785876 --key hello.txt
``` 

