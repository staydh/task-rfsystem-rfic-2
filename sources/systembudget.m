##Variaveis iniciais

Frf=95.7e6; #Hz
d=70e3; #m
BW = 200e3; #Hz

### Parte 1
## Link
### Metodo LOS (link budget) visada direta

#### FSPL (Free Space Path Loss) - em dB

FSPL = 20*log10(d)+20*log10(Frf)-147.55 #dB

##Trasmissor

Ptx1 = 10e3; #W
Ztx = 20; #ohm
Gtxa = 20; #dBi

Ptx = 10*log10(1000*Ptx1) #dBm


#Misturador do transmissor

VmT = 20; #Volts
RmT = 50; #ohm

#Supondo o ganho do misturador 

Gmist = 20; #dB

#Oscilador do transmissor;
Ffi = 455e3; #Hz
#Frf = Ffi + Fosc
FoscT = Frf - Ffi #Hz

#Ganho do amplificador de potencia do transmissor

Pt = (VmT^2)/RmT #dB

PinT = 10*log10(1000*Pt) 
PoutT = Ptx

#GaT é ganho do amplificador do transmissor
GaT = PoutT - PinT - Gmist

###Receptor

##Parte 2 - Sinal de entrada do receptor
##Apenas com os seguintes dados:
#Potencia na saída do amplificador de potencia
#Impedância do amplificador de potência
#Ganho da antena

#Considerando
Ltx = 0;
Lm = 0;
Lrx = 0;
Grx = 0;

Prx = Ptx + Gtxa - FSPL #dBm

#Oscilador do receptor
Ffi1 = 10e6; #Hz
Ffi2 = 455e3; #Hz 

FoscR1 = Frf + Ffi1
Fosc2 = Frf + Ffi2

#Conversor A/D
VconvR = 50e-3; #V 

#Sensibilidade no receptor

Pr = ((VconvR)^2)/50;

PinR = 10*log10(1000*Pr)

Psen = PinR + Prx

#Ganho da antena do receptor
Grx = Prx - Ptx - Gtxa + FSPL

#Filtro do receptor
QuantidadeFiltro = 2;
PerdaFiltro = -1; #dB

#Misturador do receptor
QuantidadeMisturador = 1;
PerdaMisturador = -10; #dB

#Ganho de cada amplificador do receptor
QuantidadeAmplifRecp = 2;

Ppa = (Prx - (QuantidadeFiltro*PerdaFiltro) + (QuantidadeMisturador*PerdaMisturador))/QuantidadeAmplifRecp



