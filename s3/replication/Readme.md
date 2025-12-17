# create two buckets
```sh
aws s3 mb s3://replicationonettiuy
aws s3 mb s3://replicationtwo687tt
```

# enable versioning for both buckets
```sh
aws s3api put-bucket-versioning --bucket replicationonettiuy --versioning-configuration Status=Enabled

aws s3api put-bucket-versioning --bucket replicationtwo687tt --versioning-configuration Status=Enabled
```

# create iam policy
```sh
aws iam create-policy \
--policy-name my-policy \
--policy-document file://policy.json
```
# create a role
```sh
aws iam create-role \
--role-name Test-Role \
--assume-role-policy-document file://trust.json
```
# attach role policy
```sh
aws iam attach-role-policy \
--policy-arn arn:aws:iam::537124968418:policy/my-policy \
--role-name Test-Role
```
# turn on replication for s3 bucket
```sh
aws s3api put-bucket-replication \
--bucket replicationonettiuy \
--replication-configuration file://replication.json
```

# create a file and upload to our bucket
```sh
echo "hello world" > hello.txt
aws s3 cp hello.txt s3://replicationonettiuy/hello.txt
```

# check dest bucket to see if replication worked
```sh
aws s3 ls s3://replicationtwo687tt
```
# clean up buckets, preferablly inside the console