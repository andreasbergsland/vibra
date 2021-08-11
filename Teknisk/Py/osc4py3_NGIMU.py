# Import needed modules from osc4py3
from osc4py3.as_eventloop import *  #osc_send does not work with as.comthreads, could try with importing both and then specifying for receive and send
from osc4py3 import oscmethod as osm
from osc4py3 import oscbuildparse       # <<<<< Needed to create OSC messages.
import matplotlib.pyplot as plt
#import sklearn.preprocessing as preproc
import scipy.stats as scistats
import subprocess,time
import numpy as np
import struct

LOCALHOST = "127.0.0.1"
NGIMU_IP = ("192.168.1.34", "192.168.1.35", "192.168.1.36", "192.168.1.37", "192.168.1.38", "192.168.1.39", )
RECEIVEPORT = 54321
SENDPORT = 2222
RECEIVE_PERIOD = 0.001 #how long to wait between each cycle

class NGIMU(object):
    """docstring for NGIMU."""

    def __init__(self, receiveport, IP="192.168.1.3", sendport = 9000):
        #super(NGIMU, self).__init__()
        self.NGIMU_DATA_ADDR = (
        ("/sensors", ",ffffffffff"),
        ("/magnitudes", ",fff"),
        ("/quaternion", ",ffff"),
        ("/matrix", ",fffffffff"),
        ("/euler", ",fff"),
        ("/linear", ",fff"),
        ("/earth", ",fff"),
        ("/altitude",  ",f"),
        ("/temperature", ",ff"),
        ("/humidity", ",f"),
        ("/battery", ",ffffs"),
        ("/analogue", ",ffffffff"),
        ("/rssi", ",ff")
        )

        self.NGIMU_SETTINGS_ADDR = (
        ("/rate", ",f"),
        ("/name", ",s"),
        ("/wifi/mode", ",s"),
        ("/wifi/throughput", ",s"),
        ("/wifi/ip", ",s"),
        ("/wifi/send/ip", ",s"),
        ("/wifi/send/port", ",i"),
        ("/wifi/client/ip", ",i"),
        ("/wifi/receive/port", ",i")
        )

        self.DATA_RATES = [0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 1, 0, 0]

# A complete list of messages for different NGIMU settings can be found here:
# https://github.com/xioTechnologies/NGIMU-Software-Public/blob/master/NgimuApi/Settings/Settings.cs
NGIMUs = ("NGIMU1", "NGIMU2", "NGIMU3", "NGIMU4", "NGIMU5", "NGIMU6")
Active_NGIMUs = 6
HopSize = 8 # number of data points from one window to the next

euler_arr = np.zeros((Active_NGIMUs, 3, HopSize))
quat_arr = np.zeros((Active_NGIMUs, 4, HopSize))
lin_arr = np.zeros((Active_NGIMUs, 3, HopSize))
earth_arr = np.zeros((Active_NGIMUs, 3, HopSize))
batt_arr = np.zeros((Active_NGIMUs, 2))

time_arr = np.zeros((HopSize))
time_win = np.zeros((HopSize*4))
data_win = np.zeros((HopSize*4))

ontime = 0
msg1 = 0

earth_cnt = np.zeros((Active_NGIMUs))
eul_cnt = np.full((Active_NGIMUs), HopSize-1)
quat_cnt = np.zeros((Active_NGIMUs))
lin_cnt = np.zeros((Active_NGIMUs))

init_time = time.time()

def plotfigure(arr_x, arr_y, savefigure):
    fig, axe = plt.subplots(dpi = 150)
    axe.scatter(arr_x, arr_y, marker='o')
    plt.plot(arr_x, arr_y, 'r', label="fitted line")
    plt.legend()
    plt.show()
    if savefigure == 1:
        fig.savefig("testfig.png")
        plt.close(fig)
    pass

def euler(data, reader, time):
    global eul_cnt, HopSize, ontime, time_win, data_win, msg1
    NG_num = NGIMUs.index(reader)
    euler_arr[NG_num][0][int(eul_cnt[NG_num])] = data[0]
    euler_arr[NG_num][1][int(eul_cnt[NG_num])] = data[1]
    euler_arr[NG_num][2][int(eul_cnt[NG_num])] = data[2]
    ontime = time - init_time
    time_arr[int(eul_cnt[NG_num])] = ontime
    if eul_cnt[NG_num] > 0:
        eul_cnt[NG_num] -= 1
    else:
        # Shift data buffers into window
        endind = (3*HopSize)-1
        time_win = np.concatenate((time_arr, time_win[0:endind]))
        data_win = np.concatenate((euler_arr[NG_num][0], data_win[0:endind]))
        eul_cnt[NG_num] = HopSize-1 # Reset every HopSize data points
        res = scistats.linregress(time_win, data_win)
        slope = res.slope
        interc = res.intercept
        msg1 = oscbuildparse.OSCMessage("/linreg", ",ff", [slope, interc])
        print(msg1)
        osc_send(msg1, "to_NGIMUs")



def quaternion(data, reader, time):
    global quat_cnt, HopSize, ontime
    NG_num = NGIMUs.index(reader)
    quat_arr[NG_num][0][int(quat_cnt[NG_num])] = data[0]
    quat_arr[NG_num][1][int(quat_cnt[NG_num])] = data[1]
    quat_arr[NG_num][2][int(quat_cnt[NG_num])] = data[2]
    quat_arr[NG_num][3][int(quat_cnt[NG_num])] = data[3]
    ontime = time - init_time
    if quat_cnt[NG_num] < HopSize-1:
        quat_cnt[NG_num] += 1
    else:
        quat_cnt[NG_num] = 0 # Reset every HopSize data points
    print(data, reader)

def linear(data, reader, time):
    global lin_cnt, HopSize, ontime
    NG_num = NGIMUs.index(reader)
    lin_arr[NG_num][0][int(lin_cnt[NG_num])] = data[0]
    lin_arr[NG_num][1][int(lin_cnt[NG_num])] = data[1]
    lin_arr[NG_num][2][int(lin_cnt[NG_num])] = data[2]
    ontime = time - init_time
    if lin_cnt[NG_num] < HopSize-1:
        lin_cnt[NG_num] += 1
    else:
        lin_cnt[NG_num] = 0 # Reset every HopSize data points

    print(data, reader)

def earth(data, reader, time):
    global earth_cnt, HopSize, ontime
    NG_num = NGIMUs.index(reader)
    earth_arr[NG_num][0][int(earth_cnt[NG_num])] = data[0]
    earth_arr[NG_num][1][int(earth_cnt[NG_num])] = data[1]
    earth_arr[NG_num][2][int(earth_cnt[NG_num])] = data[2]
    ontime = time - init_time
    if earth_cnt[NG_num] < HopSize-1:
        earth_cnt[NG_num] += 1
    else:
        earth_cnt[NG_num] = 0 # Reset every HopSize data points
    print(data, reader)

def battery(data, reader, time):
    NG_num = NGIMUs.index(reader)
    batt_arr[NG_num][0] = data[0]
    batt_arr[NG_num][1] = data[1]
    print(data, reader)

#-------------------------------------------------------------------------------
# Start the system.
osc_startup()
# Make client and server channels to send and receive packets.
osc_udp_client(LOCALHOST, 9000, "to_NGIMUs")
setIP = oscbuildparse.OSCMessage("/wifi/send/ip", ",s", "192.168.1.3")
osc_send(setIP, "to_NGIMUs")


osc_udp_server("192.168.1.3", 8034, NGIMUs[0])
osc_udp_server("192.168.1.3", 8035, NGIMUs[1])
osc_udp_server("192.168.1.3", 8036, NGIMUs[2])
osc_udp_server("192.168.1.3", 8037, NGIMUs[3])
osc_udp_server("192.168.1.3", 8038, NGIMUs[4])
osc_udp_server("192.168.1.3", 8039, NGIMUs[5])

# Associate Python functions with message address patterns, using default
osc_method("/euler", euler, argscheme=osm.OSCARG_DATA + osm.OSCARG_READERNAME + osm.OSCARG_READTIME)
osc_method("/quaternion", quaternion, argscheme=osm.OSCARG_DATA + osm.OSCARG_READERNAME + osm.OSCARG_READTIME)
osc_method("/linear", linear, argscheme=osm.OSCARG_DATA + osm.OSCARG_READERNAME + osm.OSCARG_READTIME)
osc_method("/earth", earth, argscheme=osm.OSCARG_DATA + osm.OSCARG_READERNAME + osm.OSCARG_READTIME)
osc_method("/battery", battery, argscheme=osm.OSCARG_DATA + osm.OSCARG_READERNAME + osm.OSCARG_READTIME)

# Performance loop--------------------------------------------------------------
# Periodically call osc4py3 processing method in your event loop.
finished = False
while True:#not finished:
    osc_process()
    time.sleep(RECEIVE_PERIOD)

# Properly close the system.
osc_terminate()
