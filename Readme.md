
### Build
```
docker build -t vue-app .
```

### Run 
```
docker run -it -d -p 80:80 --restart unless-stopped --name dockerize-vuejs-app vue-app
```
