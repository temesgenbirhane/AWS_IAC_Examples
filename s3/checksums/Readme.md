# Create a new bucket
```sh
aws s3 mb s3://checksumexample65785876
```
# get a checksum of a file for md5 
```sh
echo "hi there" > file.txt
md5sum file.txt
```
# upload ourfile and look at its checksum
aws s3 cp file.txt s3://checksumexample65785876
aws s3api head-object --bucket checksumexample65785876 --key file.txt
