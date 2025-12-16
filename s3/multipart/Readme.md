# create a large file
```sh 
dd if=/dev/zero of=largefile.txt bs=1M count=50
ls -lah | grep large
```

# create a bucket
```sh
aws s3 mb s3://multipart76ytuytuyt
```

# create multipart upload
```sh
aws s3api create-multipart-upload --bucket multipart76ytuytuyt --key 'largefile'
```
# list upload id
```sh
aws s3api list-multipart-uploads --bucket multipart76ytuytuyt --query Uploads[].UploadId
``` 

# split the file
```sh
split -b 10M -d largefile.txt part-
```
# set env't variable
```sh
UPLOAD_ID="rjhDor1NXX9dnxGjEuwohEXPAiaRCVqB6cWtyVtKENM9418XGtEF7X35HHAHGchobeogJs60gibu7.G621jMNsocL1lEbyph_v2rdOah3hzR8MawQc9xtCQdHYAfTboR" env | grep UPLOAD
``` 
# upload part
```sh
aws s3api upload-part --bucket $BUCKET --key 'largfile' --part-number 1 --body part-00 --upload-id  $UPLOAD_ID aws s3api upload-part --bucket $BUCKET --key 'largfile' --part-number 2 --body part-01 --upload-id  $UPLOAD_ID aws s3api upload-part --bucket $BUCKET --key 'largfile' --part-number 3 --body part-03 --upload-id  $UPLOAD_ID aws s3api upload-part --bucket $BUCKET --key 'largfile' --part-number 4 --body part-04 --upload-id  $UPLOAD_ID

``` 

# list part

```sh
aws s3api list-parts --bucket $BUCKET --key 'largefile' --upload-id $UPLOAD_ID --query "Parts[].{PartNumber: PartNumber, ETag: ETag}" > parts.json
```

# complete upload
```sh
aws s3api complete-multipart-upload --multipart-upload file://parts.json --bucket $BUCKET --key 'largefile' --upload-id $UPLOAD_ID
```

# clean up
```sh
aws s3 rb s3://$BUCKET
```