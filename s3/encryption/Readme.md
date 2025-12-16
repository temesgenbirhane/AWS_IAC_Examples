# create bucket
```sh 
aws s3 mb s3://encryptionfun856667
```
# initilialize ruby
```sh
bundle init
bundle install
bundle exec ruby encryption.rb
```
checksumexample65785876
aws s3 presign s3://checksumexample65785876/hello.txt \
--expires-in 604800
