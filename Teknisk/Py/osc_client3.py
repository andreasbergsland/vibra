import paho.mqtt.client as mqtt
from pythonosc import udp_client
import matplotlib.path as mPath

import json

topic_names = {}

HOSTNAME = "mqtt.aass.oru.se"
#TOPIC = "vinotion/#"
#MQTT_USERNAME = "vinotionReader"
#MQTT_PASSWORD = "kRaBLYpEACES"

TOPIC = "vinotion/position"
MQTT_USERNAME = "vinotionReader"
MQTT_PASSWORD = "kRaBLYpEACES"

def on_message(mqttc, obj, msg,):
    # print(msg.topic + " " + str(msg.payload))
    payload = json.loads(msg.payload)
    markers = list(payload['markers'].keys())
    count = 0
    data = [0,] * 31
    for marker in markers:
        x = payload['markers'][marker]['position']['x']
        y = payload['markers'][marker]['position']['y']
        if not path.contains_point((x,y), radius=1.2):
            #print('True')
            data[data[1:].index(0)+1] = x
            data[data[1:].index(0)+1] = y
            count += 1
    data[0] = count
    ocs_client.send_message('/data', data)


try:
    ocs_client = udp_client.SimpleUDPClient('127.0.0.1', 9000)
    path = mPath.Path(((0,9.2),(3.4,10.5),(2.2,14.9),(-1.7,14.4)))

    mqttc = mqtt.Client()
    mqttc.on_message = on_message

    print("Setting user credentials")
    mqttc.username_pw_set(username=MQTT_USERNAME, password=MQTT_PASSWORD)

    print("Connecting to host %s" % HOSTNAME)
    mqttc.connect(HOSTNAME, 1883, 60)

    print("Subscribing to topic %s" % TOPIC)
    mqttc.subscribe(TOPIC, 0)

    print("Looping forever...")
    mqttc.loop_forever()


except KeyboardInterrupt:
    print ("Received topics:")
    for topic in topic_names:
        print (topic)



"""
import time
import paho.mqtt.client as mqtt
import json



class OruMqtt():
        def __init__(self):
                self.HOSTNAME = "mqtt.aass.oru.se"
                self.TOPIC = "/pozyx/position"
                self.MQTT_USERNAME = "mqtt"
                self.MQTT_PASSWORD = "password"

        def connect(self):
                self.client = mqtt.Client()

                # Set access token
                self.client.username_pw_set(username=self.MQTT_USERNAME, password=self.MQTT_PASSWORD)
                #client.username_pw_set(ACCESS_TOKEN)

                # Connect to ThingsBoard using default MQTT port and 60 seconds keepalive interval
                #client.connect(HOSTNAME, 1883, 60)
                returnCode = self.client.connect(self.HOSTNAME, 1883, 60)
                print("Connected to {}, publishing to {}".format( self.HOSTNAME, self.TOPIC))

        def start_loop(self):
                self.client.loop_start()

        def publish(self, pos_obj):
                data_obj = {"ts":time.time()*1000, "pos_data": pos_obj}
                json_message = json.dumps(data_obj, indent="\t")
                print(json_message)
                self.client.publish(self.TOPIC, json_message, 1)

        def close(self):
                self.client.loop_stop()
                self.client.disconnect()
"""
