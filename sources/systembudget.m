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

Ptx = 10*log10(Ptx1/(1e-3)) #dBm

#Misturador do transmissor

VmT = 20; #Volts
RmT = 50; #ohm
N_mT = 3;

#Supondo o ganho do misturador 

Gmist = -5; #dB

#Oscilador do transmissor;
Ffi = 455e3; #Hz
#Frf = Ffi + Fosc
FoscT = Frf - Ffi #Hz

#Ganho do amplificador de potencia do transmissor
N_paT = 5
Pt = (VmT^2)/RmT #dB

PinT = 10*log10(Pt/(1e-3)) 
PoutT = Ptx

#Ppa e ganho do amplificador do transmissor (PA)
GpaT = PoutT - PinT - Gmist

#Ruˆqdo em cascata do transmissor
N_T = N_mT + (N_paT-1)/(GpaT)
NF_T = 10*log10(N_T)

###Receptor

##Parte 2 - Sinal de entrada do receptor
##Apenas com os seguintes dados:
#Potencia na saida do amplificador de potencia
#Impedacia do amplificador de potencia
#Ganho da antena

#Estipulando que o ganho total do receptor
#apos a antena ate antes do conversor A/D ˆm 60 dB

GoutRT = 60; #dB 

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
Nbits = 8; #Quantidade de bits do conversor A/D
VconvR = 50e-3; #V 
RconvR =  (2^Nbits);

#SNR minimo para a resolu??o de 8 bits
SNR = -60

#Sinal na entrada do conversor A/D

Pr = ((VconvR)^2)/RconvR;

PinR = 10*log10(Pr/(1e-3))

#Filtro do receptor
QuantidadeFiltro = 4;
PerdaFiltro = -1; #dB

#Misturador do receptor
QuantidadeMisturador = 2;
PerdaMisturador = -20; #dB
N_misR = 3;

#Ganho de cada amplificador do receptor (LNA)
N_lna=5;
QuantidadeAmplifRecp = 2;

Glna = (GoutRT - (QuantidadeFiltro*PerdaFiltro) - (QuantidadeMisturador*PerdaMisturador))/QuantidadeAmplifRecp

#Ruido em cascata do receptor
N_R = N_lna + ((N_misR-1)/(PerdaMisturador)) + ((N_misR-1)/(PerdaMisturador*PerdaMisturador)) + ((N_lna-1)/(PerdaMisturador*PerdaMisturador*Glna))

NF_R = 10*log10(N_R)

#Sensibilidade
Psen = -174 + NF_R + 10*log10(BW) + SNR