Simple s3 bucket -> http fileserver

`docker run -p 80:80 -e S3_BUCKET=my-fileserver-bucket fijimunkii/s3-http-fileserver`

Assumes iam credentials (use with a role attached instance or be already logged in)

Good idea to use in a private network

Credit to @jbreckman for the original implementation
