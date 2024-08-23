import http.server 
import socketserver
import subprocess

class RequestHandler(http.server.BaseHTTPRequestHandler):
    def do_POST(self):
        self.send_response(200)
        self.end_headers()

        print('POST from Cloud Scheduler - Restarting your app...')
        subprocess.run(['python', 'my-app.py', '--port=8080'])
    
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Server Running')

def run(server_class=http.server.HTTPServer, handler_class=RequestHandler, port=8080):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'HTTP Server running in {port}')
    httpd.serve_forever()

if __name__ == '__main__':
    run()