import subprocess
import sys
import importlib

libraries = [
    "requests",
    "beautifulsoup4",
    "pandas",
    "pyodbc",
    "unidecode",
    "pyspark",
    "sqlalchemy",
    "python-dotenv" 
]

for lib in libraries:
    try:
        importlib.import_module(lib)
    except ImportError:
        print(f"Instalando {lib}...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", lib])