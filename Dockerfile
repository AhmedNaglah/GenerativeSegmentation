FROM pytorch/pytorch:latest

COPY . /app
WORKDIR /app

RUN echo $(ls -1 /app)
RUN echo $(ls -1)

RUN pip install -r requirements.txt

ENTRYPOINT [ "python", "run.py" ]