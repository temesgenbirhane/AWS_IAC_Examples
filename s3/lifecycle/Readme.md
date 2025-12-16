# create a bucket
```sh
aws s3 mb s3://lifecycleiytiyt65676
```
# set lifecycle configuration
```sh
aws s3api put-bucket-lifecycle-configuration --bucket lifecycleiytiyt65676 --lifecycle-configuration  file://lifecycle.json
```