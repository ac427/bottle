#!/bin/env python3

from bottle import route, run
import socket

@route('/hello')
def hello():
    return "Hello World! from " +socket.gethostname()
run(host='0.0.0.0', port=5000, debug=True)
