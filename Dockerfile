FROM python:3

WORKDIR ./

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["ddtrace-run", "python", "./flask_trace.py" ]