## create a bucket
```sh
aws s3 mb s3://byterangeexample787
```

## upload our file

```sh
touch hello.txt
echo "Hello World" > hello.txt
aws s3api put-object \
--bucket byterangeexample787 \
--key hello.txt \
--body hello.txt
```

# get the word hello
```sh
aws s3api get-object \
--bucket byterangeexample787 \
--key hello.txt \
--range bytes=0-4 hello.txt
```
