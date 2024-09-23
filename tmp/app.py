from flask import Flask, render_template
from flask_socketio import SocketIO, emit, join_room
from flask_cors import CORS  # Import CORS
import queue

CONNECT_FLAG = False
UPDATE_FLAG = False

#
app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app,
                    cors_allowed_origins="*",
                    async_mode='eventlet')
CORS(app)  # Enable CORS for the entire app

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/pcnn_page')
def pcnn_page():
    return render_template('pcnn_page.html')

@socketio.on('connect')
def handle_connect():
    global CONNECT_FLAG
    if not CONNECT_FLAG:
        logger("Client connected")
        CONNECT_FLAG = True
    join_room('plot_room')


if __name__ == '__main__':
    socketio.run(app, port=5002, debug=True)
