# Create a vpc
```shaws ec2 create-vpc \
--cidr-block '10.0.0.0/16' \
--tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=MyVpc}']
```

# Create Network ACL
```sh
aws ec2 create-network-acl --vpc-id vpc-056f451e61259ad85
```

# add entry into nacl
```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-09f387095128e192b \
--ingress \
--rule-number 90 --protocol -1 \
--port-range From=0,To=65535 \
--cidr-block 174.5.108.3/32 --rule-action deny
```

# create a subnet
```sh
aws ec2 create-subnet \
--vpc-id vpc-056f451e61259ad85 \
--cidr-block '10.0.0.0/24' \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=my-ipv4-only-subnet}]'
```
