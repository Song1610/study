from flask import Flask
app = Flask(__name__)

# @app.route('/')
# def index():
#    return render_template('index.html')

@app.route('/')
def index():
   return 'hello world!'

if __name__ == '__main__':  
   app.run('0.0.0.0', port=5000, debug=True)