# SPRILIB Muscat FX Docker instance


This Docker instance creates the SPRILIB catalogue.

SPRILIB uses the ancient Muscat FX 32-bit software, released in 1998.



## Run

To create the service and run it as a daemon:

```
sudo docker compose -f /path/to/webmuscat-docker/docker-compose.yml up -d --build --force-recreate
```

This assumes the database data is at `/websites/muscatdata`.

The service will then be available to local processes as:

http://localhost:8091/cgi-bin/fx.sp.wrapper?DB=PolarPics


## Author

 - Docker definitions: Martin Lucas-Smith, Department of Geography, 2023
 - Muscat FX: Muscat Ltd (now defunct)
 - Linux libraries: Linux


## License

 - Docker definitions: GPL3
 - Muscat FX: Commercial
 - Linux libraries: GPL


