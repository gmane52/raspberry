from app import app
from flask import render_template, abort
import os

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/mi_primera_pagina_web")
def mi_primera_pagina():
	return render_template("Mi_primera_pagina_web.html")
