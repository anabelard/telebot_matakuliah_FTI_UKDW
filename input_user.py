import mysql.connector
import csv
import json


db = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="evaluasi_bot"
)


def getinput():
    cursor = db.cursor(dictionary=True)
    query = '''SELECT input_result FROM `input_user` where username != 'anabelard';'''
    cursor.execute(query)
    return cursor.fetchall()

input_data = getinput()

results = []

# print(input_data)

for i in input_data: 
    json_str = i['input_result']
    parsed_data = json.loads(json_str)
    text = parsed_data['text']

    if parsed_data['intents']:
        intent = parsed_data['intents'][0]['name']
    else:
        intent = ''
    
    results.append((text, intent))

print(results)



with open('input_resultsss.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Text', 'Predicted Intent'])
    writer.writerows(results)

