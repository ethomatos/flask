FROM python:3

WORKDIR ./

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

LABEL com.datadoghq.tags.service="flaskapp"
LABEL com.datadoghq.tags.version="1.0.0"
LABEL com.datadoghq.tags.env="melville"

CMD ["python", "./flask_trace.py" ]
