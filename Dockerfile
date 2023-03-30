FROM pytorch/pytorch:latest

COPY . /app
WORKDIR /app

RUN echo $(ls -1 /app)

RUN cd /app
RUN echo $(ls -1)

RUN pip install -r requirements.txt

ENTRYPOINT [ "python", "/app/run.py" ]