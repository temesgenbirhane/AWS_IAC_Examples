require 'aws-sdk-s3'
require 'openssl'
require 'pry'

key = OpenSSL::PKey::RSA.new(1024)
bucket='encryptionfun856667'
object_key='hello'

# encryption client
s3 = Aws::S3::EncryptionV2::Client.new(encryption_key: key,
key_wrap_schema: :rsa_oaep_sha1,
content_encryption_schema: :aes_gcm_no_padding,
security_profile: :v2
)
resp = s3.put_object(bucket: bucket, key: object_key, body:'handshake')
puts 'put'
puts respresp = s3.get_object(bucket: bucket, key: object_key).body.read
puts "GET WITH KEy"
puts resp
#=> 'handshake'

# reading encrypted object without the encryption client
# results in the getting the cipher text
resp = Aws::S3::Client.new.get_object(bucket:bucket, key:object_key).body.read
puts "GET WITHOUT KEY"
puts resp