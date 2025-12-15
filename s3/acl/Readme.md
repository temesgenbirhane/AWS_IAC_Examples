ACL have been retired since octobor 2025
create a bucket
``sh
aws s3 mb s3://newaclbucketemp
``
Turn off block publci access
``sh
aws s3api put-public-access-block \
--bucket newaclbucketemp \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
``

change bucket ownsership
``sh
aws s3api put-bucket-ownership-controls \
--bucket newaclbucketemp \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerEnforced}]"
``

Change ACLs to allow for a user in another AWS Account

``sh
aws s3api put-bucket-acl \
--bucket newaclbucketemp \
--access-control-pociy file 

``