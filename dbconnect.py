from flask import Flask, render_template, request, jsonify
import mariadb
import sys
import datetime
import json
from collections import Counter

app = Flask(__name__, template_folder='templates', static_folder='assets')
app.config["DEBUG"] = True
app.config.update(
    DEBUG=True,
    TEMPLATES_AUTO_RELOAD=True,
)


def dbConnect():
    try:
        conn = mariadb.connect(
            user="root",
            password="password",
            host="127.0.0.1",
            port=3306,
            database=""

        )
    except mariadb.Error as e:
        print(f"Error connecting to MariaDB Platform: {e}")
        sys.exit(1)
    return conn