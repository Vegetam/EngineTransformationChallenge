# EngineTransformationChallenge

Engine Transformation Challenge

# Technology Stack

Spring Boot 

Gson use it to serialize and deserialize Java objects to (and from) JSON.

Maven using to build the project :
```$xslt
mvn clean package
```
the rest service can either be accessed via the [SwaggerUI](http://localhost:8080/swagger-ui.html)

It is possible use any rest tools line postman, Advanced Rest Client or by curling requests at the relevant endpoints documented below.

API for search Train
```
GET http://localhost:8080/api/trains 
curl -X GET "http://localhost:8080/api/trains"

```
API To get platform specific trains
```
GET "http://localhost:8080/api/trains/Eastbound - Platform 2"
curl -X GET "http://localhost:8080/api/trains/Eastbound - Platform 2"
```

##Note
I configure few variable inside the application.yml file
ex: station and endpoints

```
Open web page in Browser
```
**WEB/HTML Page**
url: http://localhost:8080/home


Here is what this application is doing :
![website image][]

[website image]: EngineTransformationChallenge/src/main/resources/image/immagine.png "Screenshot 1"
