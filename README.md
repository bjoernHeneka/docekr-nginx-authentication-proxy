## Docker nginx basic authentication proxy

Use this image if you want to have a simple proxy with basic authentication.

The configuration is done with environemnt variables.

The purpose of that image is not high security. Basically i use ith to gave customers a preview of a teststage.

### Example:

You application to be secured:

```
docker run --name=my_application -d nginx
```

The proxy:

#### Build the image
```
git clone git@github.com:bjoernHeneka/docekr-nginx-authentication-proxy.git
```

```
docker build -t nginx-auth-test .
```

```
docker run -p 80:80 \
    -d \
    --link my_application:my_application \
    -e USERNAME=user \
    -e PASSWORD=S3cr3T \
    -e SERVICE_NAME=my_application \
    -e SERVICE_PORT=80 \
    -e SERVICE_DESC="My Application is secret" \
    nginx-auth-test
```

Or use the automated docker build

```
docker run -p 80:80 \
    -d \
    --link my_application:my_application \
    -e USERNAME=user \
    -e PASSWORD=S3cr3T \
    -e SERVICE_NAME=my_application \
    -e SERVICE_PORT=80 \
    -e SERVICE_DESC="My Application is secret" \
     bjoernHeneka/docker-nginx-authentication-proxy
```


### Environment Variables:

| Variable | Description |
| --- | --- |
| USERNAME | The username to use for basic auth |
| PASSWORD | The password to use for basic auth |
| SERVICE_NAME | Name of the linked service |
| SERVICE_PORT | Port the linked service listens to |
| SERVICE_DESC | Descripten of your restricted area |

### Known issues

At the moment this only supports port 80 and no SSL