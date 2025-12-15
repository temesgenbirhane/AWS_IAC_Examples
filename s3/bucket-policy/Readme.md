# create a bucket

```sh
aws s3 mb s3://bucketpolicyexample0209
```

# create a bucket policy

```sh
aws s3api put-bucket-policy \
--bucket bucketpolicyexample0209 \
--policy file://policy.json
```
# copy a file into the new bucket
```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucketpolicyexample0209
```
# cleanup

```sh
aws s3 rm s3://bucketpolicyexample0209/bootcamp.txt
aws s3 rb s3://bucketpolicyexample0209
```