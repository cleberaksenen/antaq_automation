import subprocess
import sys

libraries = [
    "requests",
    "beautifulsoup4",
    "pandas",
    "pyodbc",
    "unidecode",
    "pyspark",
    "sqlalchemy",
    "apache-airflow"
]

for lib in libraries:
    subprocess.check_call([sys.executable, "-m", "pip", "install", lib])