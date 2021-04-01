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

Gmist = -5; #dB

#Oscilador do transmissor;
Ffi = 455e3; #Hz
#Frf = Ffi + Fosc
FoscT = Frf - Ffi #Hz

#Ganho do amplificador de potencia do transmissor

Pt = (VmT^2)/RmT #dB

PinT = 10*log10(1000*Pt) 
PoutT = Ptx

#Ppa e ganho do amplificador do transmissor (PA)
PpaT = PoutT - PinT - Gmist

###Receptor

##Parte 2 - Sinal de entrada do receptor
##Apenas com os seguintes dados:
#Potencia na saída do amplificador de potencia
#Impedância do amplificador de potência
#Ganho da antena

#Estipulando que o ganho total do receptor
#apˆus a antena atˆm antes do conversor A/D ˆm 60 dB

PoutRT = 60; #dB 

#Considerando
Ltx = 5; #dB
Lm = 3; #dB
Lrx = 4;  #dB
Grx = 20; #dBi
Lfs = FSPL;

Prx = Ptx + Gtxa - Ltx - Lfs - Lm + Grx - Lrx #dBm

#Oscilador do receptor
Ffi1 = 10e6; #Hz
Ffi2 = 455e3; #Hz 

FoscR1 = Frf + Ffi1
FoscR2 = Frf + Ffi2

#Conversor A/D 
Nbits = 8; #Quantiade de bits do conversor A/D
VconvR = 50e-3; #V 
RconvR =  (2^Nbits);

#Sensibilidade no receptor
##O menor sinal possivel na entrada do receptor que possa ser visualizado

Pr = ((VconvR)^2)/RconvR;

PinR = 10*log10(1000*Pr)

Psen = PinR - PoutRT

#Filtro do receptor
QuantidadeFiltro = 4;
PerdaFiltro = -1; #dB

#Misturador do receptor
QuantidadeMisturador = 2;
PerdaMisturador = -20; #dB

#Ganho de cada amplificador do receptor (LNA)
QuantidadeAmplifRecp = 2;

Plna = (PoutRT - (QuantidadeFiltro*PerdaFiltro) - (QuantidadeMisturador*PerdaMisturador))/QuantidadeAmplifRecp



