from datetime import datetime, date, time, timedelta
import pysftp, sys, os

class MainSFTP:

	def MainSFTP(self):
		try:
			DatosRemote = []
			DatosLocal	= []
			timeInicio 	= datetime.now()
			aux 		= list(sys.argv)
			
			if len(aux) == 8:
				IP, US, PS 	= aux[1], aux[2], aux[3]
				PR, PL, NF 	= aux[4], aux[5], aux[6]
				OPC 		= aux[7]
				timeInicio 	= datetime.now()
				print ("\n\t> Estamos en", aux[0])
				print ("\t\t- IP:", IP, "US:", US, "PS:", PS, "\n\t\t- Path Remoto:", PR, "\n\t\t- Path Local:", PL)
				print ("\t\t- Name File(s):", NF,"\n\t\t- OPC:", OPC)

				if self.ValidarPathLocal(PL):
					if self.ValidarCnnSFTP(IP, US, PS):
						print ("\t> Conexión exitosa", IP, "+ OPC:", OPC)
						if self.ValidarPathRemoto(IP, US, PS, PR):
							if OPC == "GET":
								if self.BuscaFilesPathRemoto(IP, US, PS, PR, PL, DatosRemote, DatosLocal, NF):
									if (len(DatosRemote) != 0 and len(DatosLocal) != 0):
										self.GetFiles(IP, US, PS, DatosRemote, DatosLocal)
							elif OPC == "PUT":
								self.BuscarArchivosLocales(PL, DatosLocal, NF)
								if len(DatosLocal)!= 0:
									for x in DatosLocal: self.SendFile(IP, US, PS, PR, x)
								else: print ("\t> COMPA NO HAY ARCHIVOS CON EL NOBRE >>", NF)
							else: print ("\t> COMPA CARAY ES GET ó PUT Y TÚ PIDES ->", OPC)
				timeFin = datetime.now()
				Minutos = timeFin - timeInicio
				print ("\n\t- Tiempo Get Data: ", str(Minutos), "Total Files:", len(DatosRemote))
			else:
				print ("\t> COMPA PARA USAR", aux[0], "TINES QUE PASAR 7 ARGUMENTOS")
				print ("\t1.- IP \n\t2.- Usuario \n\t3.- Contraseña \n\t4.- Path Remoto \n\t5.- Path Local \n\t6.- Nombre de File(s)")
				print ("\t7.- Opción(GET/PUT)")
		except (Exception, e):
			print ("Error en MainSFTP:\n" % str(e))
			return

	def SendFile(self, I, U, P, pathFTP, file):
		try:
			print ("\t\t- Enviando", file)
			with pysftp.Connection(I, username=U, password=P) as sftp:
				with sftp.cd(pathFTP):
					sftp.put(file)
				sftp.close()
			print ("\t\t- Enviado :)", file)
		except (Exception, e):
			print ("Error en SendFile:\n" % str(e))
			return

	def ValidarCnnSFTP(self, I, U, P):
		try:
			sftp 	= pysftp.Connection(I, username=U, password=P)
			sftp.close()
			return True
		except:
			print ("\t- COMPA TUS CREDENCIALES ESTÁN MAL!\n")
			return False

	def ValidarPathLocal(self, pathLocal):
		try:
			pathLocal = os.path.abspath(pathLocal)
			if(os.path.exists(pathLocal)): return True
			print ("\t* COMPA NO EXISTE ESTE Path Local:", pathLocal)
			return False
		except (Exception, e):
			print ("Error en ValidarPathLocal:\n" % str(e))
			return

	def BuscaFilesPathRemoto(self, I, U, P, pathR, pathL, lsitR, listL, files):
		try:
			auxBan = False
			sftp = pysftp.Connection(I, username=U, password=P)
			if(sftp.isdir(pathR)):
				sftp.cwd(pathR)
				directory_structure = sftp.listdir_attr()
				for attr in directory_structure:
					filename = str(attr.filename)
					if files in filename:
						remotFP = os.path.join(pathR, filename)
						localFP = os.path.join(pathL, filename)
						lsitR.append(remotFP)
						listL.append(localFP)
				auxBan = True
			else: print ("\t\t* COMPA NO EXISTE ESTE Path Remoto:", pathR)
			sftp.close()
			return auxBan
		except (Exception, e):
			print ("Error en BuscaFilesPathRemoto:\n" % str(e))
			return

	def ValidarPathRemoto(self, I, U, P, pathR):
		try:
			auxBan = False
			sftp = pysftp.Connection(I, username=U, password=P)
			if(sftp.isdir(pathR)):
				sftp.cwd(pathR)
				auxBan = True
			else: print ("\t\t* COMPA NO EXISTE ESTE Path Remotoo:", pathR)
			sftp.close()
			return auxBan
		except (Exception, e):
			print ("\t\t* COMPA NO EXISTE ESTE Path Remoto:", pathR)
			return False

	def GetFiles(self, I, U, P, listaRemote, listaLocal):
		try:
			with pysftp.Connection(I, username = U, password = P) as sftp:
				print ("\t> Connection succesfully stablished ... NoFiles:", len(listaRemote))
				for i, x in enumerate(listaRemote):
					print ("\t\t* No.", (i + 1), "- Get File:", x)
					sftp.get(x, listaLocal[i])
					print ("\t\t+ Archivo:", listaLocal[i])
				sftp.close()
		except (Exception, e):
			print ("Error en ValidarPathRemoto:\n" % str(e))
			return

	def BuscarArchivosLocales(self, path, listaFechas, auxNameFile):
		try:
			pathFiles = os.path.abspath(path)
			for root, dirs, files in os.walk(pathFiles):
				for filename in files:
					auxFile = os.path.abspath(os.path.join(root, filename))
					if auxNameFile in filename: listaFechas.append(auxFile)
		except (Exception, e):
			print ("Error en BuscarArchivosLocales:\n" % str(e))
			return

Obj = MainSFTP();
Obj.MainSFTP()