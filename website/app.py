from flask.helpers import total_seconds
import pandas as pd 
from flask_sqlalchemy import SQLAlchemy
from flask import (Flask,render_template, jsonify, request, redirect)
import json
import plotly
import plotly.express as px
import pickle5 as pickle




################################################
#Database Setup
################################################

################################################
#Flask Setup
################################################
app = Flask(__name__,static_folder='static/css')


# model = pickle.load(open('finalized_model.pkl','rb'))

#create route that renders index.html template

#Query the database and send the jsonified results
@app.route('/')
def city():
    
    return render_template("index.html")

@app.route('/map')
def map():
    
    return render_template("map.html")

@app.route('/table')
def table():
    filename = 'static/data/master_dataset.csv' 
 
	# to read the csv file using the pandas library 
    data = pd.read_csv(filename, header=0) 
 
    myData = data.values 
    return render_template('table.html', myData=myData) 

@app.route('/chart1')
def chart1():
    csv_path = "static/data/master_dataset.csv"

    
    df = pd.read_csv(csv_path, encoding="utf-8")


    fig = px.bar(df, x="State", y= "crime_per_10k", color="County")

    graphJSON = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)
    header="Crimes Committed"
    description = """
    This chart represents the number of crimes committed for every 10 thousand residents of a county/state.
    """
    
    return render_template('chart1.html', graphJSON=graphJSON, header=header,description=description)

@app.route('/chart2')
def chart2():
    csv_path = "static/data/master_dataset.csv"
    df = pd.read_csv(csv_path, encoding="utf-8")


    fig = px.scatter(df, x="State", y=["pov 2a1w1c","min 2a1w1c","live 2a1w1c"])

    graphJSON = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)
    header="Family Income"
    description = """
    This chart illustrates poverty, minimum wage and living wage within the state/county for the average household of two parents with one working and one child.
    """
    return render_template('chart1.html', graphJSON=graphJSON, header=header,description=description)

@app.route('/chart3')
def chart3():
    csv_path = "static/data/master_dataset.csv"
    df = pd.read_csv(csv_path, encoding="utf-8")


    fig = px.bar(df, x="State", y=["pct_college"])

    graphJSON = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)
    header="Fortune 500"
    description = """
    This chart illustrates the average fortune 500 company rank, total amount of employees, total revenue, total profit and the total amount of fortune 500 companies located in major cities in the United States.
    """
    return render_template('chart1.html', graphJSON=graphJSON, header=header,description=description)



# @app.route('/predict', methods=['GET', 'POST'])
# def main():
#     if Flask.request.method == 'GET':
#         return(Flask.render_template('predict.html'))
#     if Flask.request.method == 'POST':
#         temperature = Flask.request.form['temperature']
#         humidity = Flask.request.form['humidity']
#         windspeed = Flask.request.form['windspeed']
#         input_variables = pd.DataFrame([[temperature, humidity, windspeed]],
#                                        columns=['temperature', 'humidity', 'windspeed'],
#                                        dtype=float)
#         prediction = model.predict(input_variables)[0]
#         return Flask.render_template('predict.html',
#                                      original_input={'Temperature':temperature,
#                                                      'Humidity':humidity,
#                                                      'Windspeed':windspeed},
#                                      result=prediction,
#                                      )

if __name__ == "__main__":
    app.run(debug=True)