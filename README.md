# task-rfsystem
Primeira tarefa da disciplina PSC0043 - Tópicos Especiais em Comunicação I (Circuitos Integrados para Comunicação)

## Definição da tarefa
Elaborar programa para análise em cascata de sistemas de RF: *system budget* e *link budget*

*Guidelines*:
1. Utilizar *python* (.py ou .ipynb), *octave* ou *C/C++*;
2. Utilizar abordagem de modo que o programa possa ser atualizado e interfaceado em tarefas futuras;
3. Definir como entradas, no mínimo: quantidade de sistemas de RF (receptor, transmissor e link); blocos de RF (em cada sistema), ganhos/perdas de cada bloco;
4. Definir como saídas, no mínimo: ganhos de sistema, potência de saída do transmissor, perdas do link, sensibilidade do receptor;
5. Utilizar conversões entre grandezas, caso as entradas não sejam fornecidas em dB ou dBm (V, P e/ou Z, por exemplo);
6. Atualizar descrição do repositório (em ## Início da organização);
7. Manter todo o código em diretório *sources* dentro do repositório;
8. Demonstrar o funcionamento do programa através da resolução do [exercício](ex1.pdf).

## Referências

1. [Ref. 1](https://www.phys.hawaii.edu/~anita/new/papers/militaryHandbook/rcvr_sen.pdf).
2. [RFCafe example](https://www.rfcafe.com/references/electrical/cascade-budget.htm).
3. [Matlab tool example](https://www.mathworks.com/help/rf/ug/superheterodyne-receiver-using-rf-budget-analyzer-app.html)
4. [Python tool example](https://github.com/fronzbot/python-rfdesigner).
5. [ADS example](https://literature.cdn.keysight.com/litweb/pdf/ads2004a/pdf/rfsysbudget.pdf).

## Prazos máximos

    - Commit de versão inicial: 29/03 (*sources* e descrição inicial)
    - Commit de versão intermediária: 31/03 (*sources*, descrição incluíndo a demonstração)
    - Prazo para issues/pull requests: 02/04
    - Commit de versão final: 05/04 (*sources* finais e descrição completa)

## Inicio da organização
Esse programa faz a analise system budget de um sistema RF composto por um transmissor, link e receptor. As caracteristicas do sistema são:

1.	O transmissor tem uma arquitetura do tipo transmissão direta;
2.	O receptor tem uma arquitetura super-heteródina: é composto por duas frequências intermediárias (FI's); usa 2 osciladores locais; dois conversores de frequência e dois filtros de FI;
3.	A frequência intermediária do sinal FM broadcast é 455 kHz;
4.	As perdas de filtros em relação ao parâmetro S não são ideais, sendo assim, supõe-se que é aproximadamente -1 dB;
5.	A frequência central de sistemas FM na América do Norte é 200 kHz;
6.	Em relação ao amplificador LNA: Para um sinal, o ponto de compressão de 1dB geralmente é especificado como limite superior de utilidade para operações lineares;


## Transmissor:

1. Conversor D/A
* Sinal de saída: 20 V;
* Impedância: 50 ohm;

2. Misturador:
* Perda: -4 dB;

3. Oscilador:
* Frequência intermediária: 455 kHz;

4. Amplificador de Potência
* Potência de saída: 10 kW;
* Impedância: 50 ohm;

## Dados iniciais
* Frequência RF: 97.5 MHz
* Distância: 70 Km;
* Largura de banda - BW: 200 kHz;
* Ganho da antena: 20 dBi;

## Receptor
1. Filtros:
* Quantidade: 4;
* Perda: -1 dB;

2. Amplificador:
* Quantidade: 2;

3. Oscilador:
* Frequência intermediária 1: 10 MHz;
* Frequência intermediária 2: 455 kHz;

4. Misturador:
* Quantidade: 2;
* Perda: -20 dB;

5. Conversor D/A:
* Sinal de entrada: 50 mV;
* Quantidade de bits: 8;


## Variáveis utilizadas

* Frf - Frequência RF em Hz;
* d - Distância entre o emissor e o receptor em m; 
* FSPL e Lfs - Perda de caminho de espaço livre em dB;
* Lm - Perdas diversas em dB;

1. Transmissor
* Ptx1 - Potência do amplificador de potência em W;
* Ptx - Potência do amplificador de potência em dBm;
* Ztx - Impedância do amplificador de potência em Ohm;
* Gtxa - Ganho da antena em dBi;
* VmT - Sinal de saída do conversor D/A na entrada do misturador em Volts;
* RmT - Impedância e saída do conversor D/A na entrada do misturador em Ohm;
* Gmist - ganho do misturador em dB;
* Ffi - Frequência intermediária do oscilador em Hz;
* Pt - Potência de entrada do amplificador em W;
* PinT - Potência de entrada do amplificador em dBm;
* PpaT - Ganho do amplificador PA;
* Ltx - Perdas em dB;

2. Receptor
* PoutRT - Ganho total do receptor (após a antena até antes do conversor A/D) em dB;
* Lrx - Perdas em dB;
* Grx - Ganho da antena em dBi;
* Ffi1 - Frequência intermediária 1 em Hz;
* Ffi2 - Frequência intermediária 2 em Hz;
* FoscR1 - Faixa 1 de frequência do oscilador em Hz;
* FoscR2 - Faixa 2 de frequência do oscilador em Hz;
* Nbits - Quantidade de bits do conversor A/D;
* VconvR - Mínimo sinal na entrada do conversor A/D em Volts;
* RconvR - Impedância do conversor A/D em Ohm;
* Pr - Potência na entrada do conversor D/A em W;
* PinR - Potênci na entrada do conversor D/A em dBm;
* Psen - Sensibilidade do receptor dB;
* QuantidadeFiltro - Quantiade de filtros;
* PerdaFiltro - Perda no filtro em dB;
* QuantidadeMisturador - Quantidade de misturadores;
* PerdaMisturador - Perda no misturador em dB;
* QuantidadeAmplifRecp - Quantidade de amplificadores no receptor;
* Plna - Ganho no amplificador LNA em dB;



