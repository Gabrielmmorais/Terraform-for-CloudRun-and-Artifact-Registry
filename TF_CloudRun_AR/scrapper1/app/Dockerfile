FROM python:3.12.4

WORKDIR /app

COPY requirements.txt  .

RUN pip install --no-cache-dirr -r requirements.txt

COPY . .

RUN rm -rf /app/Terrform

EXPOSE 8080

COPY server.py . 

CMD ["python", "server.py"]