import paramiko
import socket
import threading
import time

host_key = paramiko.RSAKey.generate(2048)

MAX_CONNECTIONS = 3
current_clients = 0

class SSHServer(paramiko.ServerInterface):
    def __init__(self):
        self.event = threading.Event()

    def check_auth_password(self, username, password):
        if username == "User" and password == "Password":
            return paramiko.AUTH_SUCCESSFUL
        return paramiko.AUTH_FAILED

    def get_allowed_auths(self, username):
        return "password"

    def check_channel_request(self, kind, chanid):
        if kind == "session":
            return paramiko.OPEN_SUCCEEDED
        return paramiko.OPEN_FAILED_ADMINISTRATIVELY_PROHIBITED

def handle_client(client_socket):
    global current_clients
    try:
        transport = paramiko.Transport(client_socket)
        transport.add_server_key(host_key)

        server = SSHServer()
        transport.start_server(server=server)

        channel = transport.accept(20)
        if channel is None:
            print("No channel opened")
            return

        #print("Client connected!")

        message = "Temperature is 32 degrees today."
        channel.send(message)
        #print(f"Sent: {message}")

        response = channel.recv(1024).decode()
        print(f"Client Response: {response}")

    finally:
        channel.close()
        transport.close()
        client_socket.close()
        current_clients -= 1
        print("Connection closed.")

def start_server():
    global current_clients
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind(("127.0.0.1", 2223))
    server_socket.listen(5)
    print("Server is listening on port 2222")

    while True:
        client_socket, addr = server_socket.accept()

        if current_clients >= MAX_CONNECTIONS:
            print(f"Connection from {addr} rejected - Server is full")
            client_socket.send("Server is full. Try again later.")
            client_socket.close()
            continue

        print(f"Connection from {addr} accepted.")
        current_clients += 1

        threading.Thread(target=handle_client, args=(client_socket,)).start()
        #time.sleep(1)

if __name__ == "__main__":
    start_server()
