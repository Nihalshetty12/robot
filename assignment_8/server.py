import paramiko
import socket
import threading

host_key = paramiko.RSAKey.generate(2048)

class SSHServer(paramiko.ServerInterface):
    def __init__(self):
        self.event = threading.Event()

    def check_auth_password(self, username, password):
        if username == "user" and password == "password":
            return paramiko.AUTH_SUCCESSFUL
        return paramiko.AUTH_FAILED

    def get_allowed_auths(self, username):
        return "password"

    def check_channel_request(self, kind, chanid):
        if kind == "session":
            return paramiko.OPEN_SUCCEEDED
        return paramiko.OPEN_FAILED_ADMINISTRATIVELY_PROHIBITED

def start_server():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind(("127.0.0.1", 2221))
    server_socket.listen(5)

    print("Server is listening on port 2000")

    client_socket, addr = server_socket.accept()
    print(f"Connection from {addr}")

    transport = paramiko.Transport(client_socket)
    transport.add_server_key(host_key)

    server = SSHServer()
    transport.start_server(server=server)

    channel = transport.accept(20)
    if channel is None:
        print("No channel opened")
        return

    print("Client connected")

    message = "The temperature is 32 degree today."
    channel.send(message)
    print(f"Sent: {message}")

    response = channel.recv(1024).decode()
    print(f"Client Response: {response}")

    channel.close()
    transport.close()
    server_socket.close()
    print("Connection closed.")

if __name__ == "__main__":
    start_server()
