# Purpose of this Sandbox
This is sandbox running a simple Python Application with Docker. You can use this to troublshoot Docker APM issues configuration issues.

# Requirements: 
Need to have Docker Installed on the machine. 


# Python Flask APM Sandbox
This is a sample flask app with configurations in docker-compose file for APM.

### Create a custom .env file

Make sure that in your ~ directory, you have a file called sandbox.docker.env that contains:

```
DD_API_KEY=<Your API Key>
```

# STEPS:
1. Run `docker-compose build` to build the docker image
2. Run `docker-compose up` to spin up the containers
3. Open Chrome and hit `http://localhost:10000` or `http://127.0.0.1:10000/`
4. Use
```
curl http://127.0.0.1:10000
 ```
7. You can see the data by going to `http://127.0.0.1:10000/` from you chrome browser
8. See traces in your account


Remember to run `docker-compose down` to stop and remove the containers
