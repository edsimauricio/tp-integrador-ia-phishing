# Agente anti-phishing — TP Integrador de Inteligencia Artificial

Trabajo Práctico Integrador de **Inteligencia Artificial** (Universidad de Palermo, 2.º cuatrimestre 2026).
Autor: **Mauricio Adalian** — Grupo 2.

## De qué se trata

El trabajo propone un **agente inteligente que analiza el correo corporativo entrante** y decide, para cada mensaje, si lo **entrega**, lo **entrega con una advertencia** o lo envía a **cuarentena** para que lo revise un analista de seguridad.

La solución combina varias técnicas de IA:

| Técnica | Para qué se usa |
|---|---|
| Agente que aprende | Estructura general: percibe el correo, decide, actúa y mejora con los reportes de usuarios y analistas |
| Reglas de producción en Prolog | Indicadores conocidos de phishing, explicables (sistema experto) |
| Árbol de decisión y red bayesiana (Bayes simple) | Aprender de ejemplos etiquetados y estimar P(phishing \| evidencias) |
| Perceptrón multicapa | Detectar combinaciones no lineales de atributos |
| Árbol de decisión con esperanza matemática | Elegir la acción de menor costo esperado |
| Lógica difusa | Combinar la probabilidad con la criticidad del destinatario |

## Contenido del repositorio

| Archivo | Descripción |
|---|---|
| `reglas_phishing.pl` | Prototipo del módulo de reglas (base de conocimiento en Prolog) |
| `README.md` | Este archivo |

## Cómo probar la base de reglas

Requiere [SWI-Prolog](https://www.swi-prolog.org/).

```prolog
?- consult('reglas_phishing.pl').

?- sospechoso(X).        % correos que activan alguna regla de phishing
X = c1 ;
X = c1 ;
X = c3.

?- a_revisar(X).         % correos que piden credenciales desde afuera
X = c1 ;
X = c4.

?- sospechoso(c2).       % correo interno de RR. HH.
false.
```

> `c1` aparece dos veces porque lo confirman dos reglas distintas: suplanta el dominio de la empresa y además pide credenciales con urgencia.

## Datos

Los correos de ejemplo (`c1` a `c4`) y los dominios son **ficticios**. El repositorio no contiene datos reales ni información sensible.

## Bibliografía

Russell, S. y Norvig, P. (2004). *Inteligencia artificial: un enfoque moderno* (2.ª ed.). Pearson Prentice Hall.
