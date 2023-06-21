import os
from flask import Flask, request, jsonify
from flask_cors import CORS
from google.cloud import firestore

app = Flask(__name__)
CORS(app)  # This will enable CORS for all routes
db = firestore.Client()

# Define the expected API key
@app.route('/update-counter', methods=['POST'])
def update_counter():
    # Get the counter document reference
    counter_ref = db.collection('counters').document('my-counter')
    
    # Get the current value of the counter from Firestore
    counter = counter_ref.get()
    if not counter.exists:
        # If the counter document doesn't exist, initialize it to 0
        counter_ref.set({'count': 0})
        updated_count = 0
    else:
        # If the counter document exists, increment it by 1
        updated_count = counter.to_dict().get('count', 0) + 1
        counter_ref.update({'count': updated_count})
    
    return jsonify({'count': updated_count})


@app.route('/uptime-check', methods=['GET'])
def uptime_check():
    return jsonify({'status': 'OK'}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))

