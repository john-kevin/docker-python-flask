FROM python:3.8.3-alpine3.11

WORKDIR /app 
ADD . .  

RUN apk add bash 
RUN pip install flask flask-wtf
#RUN mv flaskenv .flaskenv


EXPOSE 5000 
CMD ["python", "microblog.py"]
#CMD tail -f /dev/null
