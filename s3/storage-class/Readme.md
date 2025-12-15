select storage class when copying a file
```sh
echo "Hello World" > new.txt
aws s3 cp new.txt s3://byterangeexample787 --storage-class STANDARD_IA
```

clean up
```sh
aws s3 rm s3://byterangeexample787/new.txt
aws s3 rb s3://byterangeexample787
```