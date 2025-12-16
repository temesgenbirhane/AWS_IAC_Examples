# create bucket
```sh
aws s3 mb s3://objectlock876876
```

# Turn on S3 Versioning
aws s3api put-bucket-versioning \
--bucket objectlock876876 \
--versioning-configuration Status=Enabled

# Turn on Object Locking
aws s3api put-object-lock-configuration \
--bucket objectlock876876 \
--object-lock-configuration '{ "ObjectLockEnabled": "Enabled", "Rule": { "DefaultRetention": { "Mode": "GOVERNANCE", "Days": 1 }}}'

# New file and upload
echo "Hi there" > hi.txt
aws s3 cp hi.txt s3://objectlock876876


# delete the file
aws s3 rm s3://objectlock876876/hi.txt


# delete the object/versioned file
aws s3api delete-object \
--bucket objectlock876876 --key hi.txt \
--version-id="FeOmV0iEhOvTR0_hcJdSv5gH2CgIN7sT" \
--bypass-governance-retention


