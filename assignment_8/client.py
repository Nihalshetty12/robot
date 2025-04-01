import paramiko
import socket

def start_client():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect(("127.0.0.1", 2221))

    transport = paramiko.Transport(sock)
    transport.connect(username="user", password="password")

    channel = transport.open_session()
    print("Connected to the server")

    message = channel.recv(1024).decode()
    print(f"Received from Server: {message}")

    response = "Message recieved from server."
    channel.send(response)
    print(f"Sent: {response}")

    channel.close()
    transport.close()
    sock.close()
    print("Connection closed.")

if __name__ == "__main__":
    start_client()
