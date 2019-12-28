/** Processing sketch */

/* 
** Based on other sketches:
**  cuberotate from Adafruit (with the BNO055 sensor)
*/
 
import processing.serial.*;
import g4p_controls.*;
import oscP5.*;
import netP5.*;

float roll  = 0.0F;
float pitch = 0.0F;
float yaw   = 0.0F;
float temp  = 0.0F;
float alt   = 0.0F;

// Serial port state.
Serial       xbee;
final String serialConfigFile = "serialconfig.txt";
boolean      printSerial = false;
boolean      printRead = false;

// UI controls.
GPanel    configPanel;
GDropList serialList;
GLabel    serialLabel;
GLabel    calLabel;
GCheckbox printSerialCheckbox;

// OSC variables
OscP5 oscP5;

NetAddressList myNetAddressList = new NetAddressList();
/* listeningPort is the port the server is listening for incoming messages */
int myListeningPort = 32000;
/* the broadcast port is the port the clients should listen for incoming messages from the server*/
int myBroadcastPort = 12000;

String myConnectPattern = "/bno/connect";
String myDisconnectPattern = "/bno/disconnect";

 
void setup() {
  size(600, 200);
  
  // Serial port setup.
  // Grab list of serial ports and choose one that was persisted earlier or default to the first port.
  int selectedPort = 0;
  String[] availablePorts = Serial.list();
  if (availablePorts == null) {
    println("ERROR: No serial ports available!");
    exit();
  }
  String[] serialConfig = loadStrings(serialConfigFile);
  if (serialConfig != null && serialConfig.length > 0) {
    String savedPort = serialConfig[0];
    // Check if saved port is in available ports.
    for (int i = 0; i < availablePorts.length; ++i) {
      if (availablePorts[i].equals(savedPort)) {
        selectedPort = i;
      } 
    }
  }
  
  // Build serial config UI.
  configPanel = new GPanel(this, 10, 10, width-20, 90, "Configuration (click to hide/show)");
  serialLabel = new GLabel(this,  0, 20, 80, 25, "Serial port:");
  configPanel.addControl(serialLabel);
  serialList = new GDropList(this, 90, 20, 200, 200, 6);
  serialList.setItems(availablePorts, selectedPort);
  configPanel.addControl(serialList);
  calLabel = new GLabel(this, 300, 20, 350, 25, "Calibration: Sys=? Gyro=? Accel=? Mag=?");
  configPanel.addControl(calLabel); 
  printSerialCheckbox = new GCheckbox(this, 5, 50, 200, 20, "Print serial data");
  printSerialCheckbox.setSelected(printSerial);
  configPanel.addControl(printSerialCheckbox);
  // Set serial port.
  setSerialPort(serialList.getSelectedText());
  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,myListeningPort);

}
 
void draw() {

  if (printRead) {
    printRead = false;

    OscMessage xMessage = new OscMessage("/bno/x");
    xMessage.add(yaw); /* add an int to the osc message */  
    oscP5.send(xMessage, myNetAddressList); 

    OscMessage yMessage = new OscMessage("/bno/y");
    yMessage.add(pitch); /* add an int to the osc message */  
    oscP5.send(yMessage, myNetAddressList); 

    OscMessage zMessage = new OscMessage("/bno/z");
    zMessage.add(roll); /* add an int to the osc message */  
    oscP5.send(zMessage, myNetAddressList);      
  }
  
  background(0);
}
 
void serialEvent(Serial xbee) {
  String incoming = xbee.readString();
  if (printSerial) {
    println(incoming);
  }
  
  if ((incoming.length() > 8))
  {
    String[] list = split(incoming, " ");
    if ( (list.length > 0) && (list[0].equals("Orientation:")) ) 
    {
      roll  = float(list[3]); // Roll = Z
      pitch = float(list[2]); // Pitch = Y 
      yaw   = float(list[1]); // Yaw/Heading = X
      printRead = true;
    }
    if ( (list.length > 0) && (list[0].equals("Alt:")) ) 
    {
      alt  = float(list[1]);
    }
    if ( (list.length > 0) && (list[0].equals("Temp:")) ) 
    {
      temp  = float(list[1]);
    }
    if ( (list.length > 0) && (list[0].equals("Calibration:")) )
    {
      int sysCal   = int(list[1]);
      int gyroCal  = int(list[2]);
      int accelCal = int(list[3]);
      int magCal   = int(list[4]);
      calLabel.setText("Calibration: Sys=" + sysCal + " Gyro=" + gyroCal + " Accel=" + accelCal + " Mag=" + magCal);
    }
       
  }
}

// Set serial port to desired value.
void setSerialPort(String portName) {
  // Close the port if it's currently open.
  if (xbee != null) {
    xbee.stop();
  }
  try {
    // Open port.
    xbee = new Serial(this, portName, 9600);
    xbee.bufferUntil('\n');
    // Persist port in configuration.
    saveStrings(serialConfigFile, new String[] { portName });
  }
  catch (RuntimeException ex) {
    // Swallow error if port can't be opened, keep port closed.
    xbee = null; 
  }
}

// UI event handlers

void handlePanelEvents(GPanel panel, GEvent event) {
  // Panel events, do nothing.
}

void handleDropListEvents(GDropList list, GEvent event) { 
  // Drop list events, check if new serial port is selected.
  if (list == serialList) {
    setSerialPort(serialList.getSelectedText()); 
  }
}

void handleToggleControlEvents(GToggleControl checkbox, GEvent event) { 
  // Checkbox toggle events, check if print events is toggled.
  if (checkbox == printSerialCheckbox) {
    printSerial = printSerialCheckbox.isSelected(); 
  }
}

void oscEvent(OscMessage theOscMessage) {
  /* check if the address pattern fits any of our patterns */
  if (theOscMessage.addrPattern().equals(myConnectPattern)) {
    connect(theOscMessage.netAddress().address());
  }
  else if (theOscMessage.addrPattern().equals(myDisconnectPattern)) {
    disconnect(theOscMessage.netAddress().address());
  }
  /**
   * if pattern matching was not successful, then broadcast the incoming
   * message to all addresses in the netAddresList. 
   */
  else {
    oscP5.send(theOscMessage, myNetAddressList);
  }
}

 private void connect(String theIPaddress) {
     if (!myNetAddressList.contains(theIPaddress, myBroadcastPort)) {
       myNetAddressList.add(new NetAddress(theIPaddress, myBroadcastPort));
       println("### adding "+theIPaddress+" to the list.");
     } else {
       println("### "+theIPaddress+" is already connected.");
     }
     println("### currently there are "+myNetAddressList.list().size()+" remote locations connected.");
 }

private void disconnect(String theIPaddress) {
if (myNetAddressList.contains(theIPaddress, myBroadcastPort)) {
    myNetAddressList.remove(theIPaddress, myBroadcastPort);
       println("### removing "+theIPaddress+" from the list.");
     } else {
       println("### "+theIPaddress+" is not connected.");
     }
       println("### currently there are "+myNetAddressList.list().size());
 }