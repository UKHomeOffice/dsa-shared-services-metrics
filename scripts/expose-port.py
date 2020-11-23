from http.server import BaseHTTPRequestHandler, HTTPServer
class StoreHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        print(self.path)
        if self.path == '/dsa-monitor/prometheus':
            with open('/APP/scripts/tracing.json') as fh:
                self.send_response(200)
                self.send_header('Content-type', 'text/json')
                self.end_headers()
                self.wfile.write(fh.read().encode())
server = HTTPServer(('', 8000), StoreHandler)
print("port 8000 opened")
server.serve_forever()
