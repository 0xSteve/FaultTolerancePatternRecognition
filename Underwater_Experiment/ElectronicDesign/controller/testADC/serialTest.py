import serial
import time

# configure the serial connections (the parameters differs on the device you are connecting to)
ser = serial.Serial(
    port='/dev/ttyUSB0',
    baudrate=9600,
    parity=serial.PARITY_ODD,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.SEVENBITS
)

######
#ToDo: set up log file writing

read_line = ''
write_line = ''
ser.isOpen()
while(True):
    write_line = input('Need to change? (y/N)').lower()
    if(write_line == 'q'):
        ser.close()
        exit()
    if(not write_line == 'n'):
        ser.write('1'.encode())
        ## IN THIS AREA I NEED TO MENTION DEPTH INCREMENT
        ser.flush()
        time.sleep(5)
        while ser.inWaiting() > 0:
            print(ser.readline().decode())
        input('Ready?')
    else:
        ser.write('0'.encode())
        #time.sleep(2)
        ser.flush()
        time.sleep(5)
        while ser.inWaiting() > 0:
            print(ser.readline().decode())
