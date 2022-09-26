import socket
import sys, re
import time

class MainCapturaYazaki:

    EscribirFile  = ''
    Fecha = ''
    host = "172.30.31.142" # "192.168.1.89" # 
    port = 9002 # 9000
    baud = 512

    rutaSalida = "/home/sittel/SITIOS/Avaya/Central/rawdata"   # "/home/sittel/Avaya/rawdata"


    def MainCapturaYazaki(self):
        try:
            print ("\n\t\tEstamos en Main Captura AFIRME\n")
            self.Fecha = self.ObtenerFecha()
            self.EscribirFile = open(str(self.rutaSalida) + '/Central' + self.Fecha + '.CSV','a')
            self.Proceso()
        except (Exception, e):
            print ("Error en MainCapturaYazaki\n"  % str(e))
            return

    def Proceso(self):
        try:
            Datos = []
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # cereamos el soket
            server_address = (self.host, self.port)
            print ('starting up on %s port %s' % server_address)
            sock.bind(server_address)
            sock.listen(1)
            while True:
                print ('\n\twaiting for a connection')
                connection, client_address = sock.accept()
                try:
                    print ('cliente conectado : ', client_address)
                    while True:
                        auxFecha = self.ObtenerFecha()
                        if (str(auxFecha) != str(self.Fecha)):
                            self.Fecha = auxFecha
                        data = connection.recv(self.baud)
                        auxData =  data
                        auxData = re.sub('n\'', '', str(auxData))
                        auxData = re.sub('b\'', '', str(auxData))
                        auxData = re.sub('\\\\', '', str(auxData))

                        if data:
                            Datos.append(auxData)
                            if(len(Datos) == 5):
                                self.EscribirArchivoActual(Datos)
                                Datos = []
                        else:
                            break
                finally:
                    connection.close()

        except (Exception, e):
            print ("Error en Proceso\n" % str(e))
            return

    def ObtenerFecha(self):
        try:
            fechaHoy = time.strftime("%Y%m%d")
            return fechaHoy
        except (Exception, e):
            print("Error en ObtenerFecha\n" % str(e))
            return

    def EscribirArchivoActual(self, lista):
        try:
            self.EscribirFile = open(str(self.rutaSalida) + '/Central' + self.Fecha + '.CSV','a')
            print ("Escribiedno en archivo: " + str(self.EscribirFile.name))
            for line in lista:
                self.EscribirFile.write(line + "\n")
            self.EscribirFile.close()
        except (Exception, e):
            print ("Error en EscribirArchivoActual\n" % str(e))
            return

Obj = MainCapturaYazaki()
Obj.MainCapturaYazaki()
# https://pymotw.com/2/socket/tcp.html
