## IRIS-REST-API-DATABASEMANAGER

[![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/iris-rest-api-databasemanager-1)

Collaborator :
- Guillaume Leprêtre : [DC Profil](https://community.intersystems.com/user/guillaume-lepretre)

This application allow you to create  persistent Tables and Data in Cache Database.
It uses POST , GET , PUT and DELETE methods.
There is a POSTMAN collection in the project in order to test the application.
Docker default port are 9000 , 9001 and 9002.


## Installation with ZPM

zpm:USER>install iris-rest-api-databasemanager
 
## Installation with Docker

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 
Clone/git pull the repo into any local directory

```
$ git clone git@github.com:LucasBourre/IRIS-Restful-API-Database.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## How to Test it
You have a Postman collection in the Git, to be able to create some Tables and Data.
![](https://raw.githubusercontent.com/lucas.bourre/imagePostman.png)

Here are different types available :
String , Date , Integer (Int), Decimal, Float, TimeStamp , Boolean

## Next Features
What we plan to add :
- More possibilities ( Cardinality , relationship between tables)
- Send multiple datas or tables
- a Prediction API to predict values
