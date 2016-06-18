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
```
docker run -p 80:80 --link fooo:fooo -e USERNAME=user -e PASSWORD=S3cr3T -e SERVICE_NAME=my_application -e SERVICE_PORT=80 -e SERVICE_DESC="My Application is secret" -it nginx-auth-test
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