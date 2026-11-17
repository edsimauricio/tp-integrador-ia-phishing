% Modulo de reglas (sistema experto) del agente anti-phishing
% TP Integrador - Inteligencia Artificial - Mauricio Adalian

% Hechos: lo que el agente percibe de cada correo
remitente(c1, soporte_empresa_co).
remitente(c2, rrhh_empresa_com).
remitente(c3, proveedor_net).
remitente(c4, banco_seguro_net).
externo(c1).
externo(c3).
externo(c4).
pide_credenciales(c1).
pide_credenciales(c4).
urgencia(c1).
urgencia(c3).
adjunto(c2, pdf).
adjunto(c3, exe).

% Conocimiento del experto: dominios que imitan al de la empresa
imita(soporte_empresa_co, empresa_com).

% Reglas de produccion: indicadores
suplanta_dominio(C)   :- remitente(C, D), imita(D, _).
adjunto_peligroso(C)  :- adjunto(C, exe).
pide_datos_afuera(C)  :- pide_credenciales(C), externo(C).

% Reglas de veredicto
sospechoso(C) :- suplanta_dominio(C).
sospechoso(C) :- pide_datos_afuera(C), urgencia(C).
sospechoso(C) :- adjunto_peligroso(C), externo(C).
a_revisar(C)  :- pide_datos_afuera(C).
