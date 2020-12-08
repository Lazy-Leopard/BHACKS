import speech_recognition as sr
from flask import request
from flask import jsonify
from flask import Flask
from flask_cors import CORS

app = Flask(__name__ )
CORS(app)

r = sr.Recognizer()

@app.route('/tts' , methods=["POST"])
def tts():
    soundSource = request.files['sound_file']
    with sr.AudioFile(soundSource) as source:
        audio_text = r.listen(source)
        try:
            text = r.recognize_google(audio_text)
            print('Converting audio transcripts into text ...')
            response = {
                'text_result': text
            }
     
        except:
            response = {
                'text_result': "Sorry...try again"
            }
    return jsonify(response)


@app.route('/')
def home():
    return '<h1>Welcome to sound API</h1>'