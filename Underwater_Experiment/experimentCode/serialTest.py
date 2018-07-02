import serial
import time
import csv

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
depth_counter = 0
ser.isOpen()
file_name = input('Input a logfile name: ')
with open(file_name +'.csv', 'w') as csvfile:
    writer = csv.writer(csvfile, delimiter=' ',
                            quotechar='|', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(['AIN0,AIN1,AIN2,AIN3,AIN4,DEPTH'])
    while(True):
        write_line = input('Need to change? (y/N)').lower()
        if(write_line == 'q'):
            ser.close()
            break
        if(not write_line == 'n'):
            ser.write('1'.encode())
            ## IN THIS AREA I NEED TO MENTION DEPTH INCREMENT
            #The depth will be entered by creating a blank line in the csv
            #file.
            depth_counter += 1
            ser.flush()
            time.sleep(5)
            #uncomment the following for debugging.
            #while ser.inWaiting() > 0:
            #    print(ser.readline().decode())
            input('Ready?')
        else:
            count = 0
            for i in range(5):
                ser.write('0'.encode())
                ser.flush()
                #Give an opportunity to put some data in the queue
                time.sleep(1)
                while ser.inWaiting() > 0:
                    read_line = ser.readline().decode()[0:-3]
                    writer.writerow(read_line +','+ str(depth_counter))
                    print(read_line)
                    count += 1
            print('THE COUNT IS: 0' + str(count))
exit()
