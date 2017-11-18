import json
import sys

sys.path.append('.mioenv/lib/python3.6/site-packages')
import mysql.connector

import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)


def handle_lookup(event, context):
    logger.info(str(event))

    hostname = '--host--'
    username = '--user--'
    password = '--pass--'
    database = '--database--'
    
    ingrediente_principale = event['currentIntent']['slots']['ingrediente_principale']
    tempo_di_cottura = event['currentIntent']['slots']['tempo_di_cottura']
    
    cnx = mysql.connector.connect(user=username, password=password, host=hostname, database=database)
    cursor = cnx.cursor(buffered=True)
    query = 'select * from ricette where ingrediente_principale = %s and tempo_di_cottura <=%s'#.format(ingrediente_principale, tempo_di_cottura)
    cursor.execute(query, (ingrediente_principale, tempo_di_cottura))
    
    risposta = "\n*Here's what I found:*\n"
    for r in cursor:
        logger.info(r)
        ricetta = "\n- *{}* which requires the ingredients: {}".format(r[1], r[3])
        risposta = risposta + ricetta
    
    return {
        'sessionAttributes': event['sessionAttributes'],
        'dialogAction': {
            'type': 'Close',
            'fulfillmentState': 'Fulfilled',
            'message': {
                'contentType': 'PlainText',
                'content': 'Here\'s a recipe for ' + ingrediente_principale + ' taking ' + tempo_di_cottura + "\n\n== " + risposta
            }
        }
    }


