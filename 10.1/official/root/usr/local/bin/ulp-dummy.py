#!/usr/bin/env python3

# Adding this since Ubiquiti development doesn't seem to care to fix this and the logspam is annoying.
# Script by UI community user sbellon posted in:
# https://community.ui.com/questions/Manifest-request-to-ULP-failed-every-minute-in-server-log/2be0b5a3-504b-4864-a009-d084ea1031f6

from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/api/ucore/manifest':
            body = b"{}"
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)
        else:
            self.send_response(401)
            self.send_header("Content-Length", "0")
            self.end_headers()


HTTPServer(("127.0.0.1", 9080), Handler).serve_forever()
