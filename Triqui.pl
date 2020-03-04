
%estados validos de las casillas
estado(o).
estado(x).
vacio(v).

%valor inicial de las casillas (vacio)
iniciar([v,v,v,v,v,v,v,v,v]).

gana([E,E,E,_,_,_,_,_,_]):-estado(E).
gana([_,_,_,E,E,E,_,_,_]):-estado(E).
gana([_,_,_,_,_,_,E,E,E]):-estado(E).

gana([E,_,_,E,_,_,E,_,_]):-estado(E).
gana([_,E,_,_,E,_,_,E,_]):-estado(E).
gana([_,_,E,_,_,E,_,_,E]):-estado(E).

gana([E,_,_,_,E,_,_,_,E]):-estado(E).
gana([_,_,E,_,E,_,E,_,_]):-estado(E).

estado(1,[X|_],X).
estado(P,[_|Xs],E):-P1 is P-1,estado(P1,Xs,E).

insertar(E,1,[_|Xs],[E|Xs]).							
insertar(E,P,[X|Xs],[X|Xs1]):-P1 is P-1,insertar(E,P1,Xs,Xs1).

tachar(P,E,Tablero,Tablero1):-estado(P,Tablero,v),insertar(E,P,Tablero,Tablero1).

ganador(Tablero,Jugador):-gana(Tablero),write('GANADOR: '),write(Jugador),nl.

empate([E1,E2,E3,E4,E5,E6,E7,E8,E9]):-
	\+ vacio(E1),\+ vacio(E2),\+ vacio(E3),\+ vacio(E4),\+ vacio(E5),\+ vacio(E6),\+ vacio(E7),\+ vacio(E8),\+ vacio(E9).

imp(o):-write(o).
imp(x):-write(x).
imp(v):-write(' ').

imprimir([E1,E2,E3,E4,E5,E6,E7,E8,E9]):-
		write(' | '),imp(E1),write(' | '),imp(E2),write(' | '),imp(E3),write(' |'),nl,
		write(' | '),imp(E4),write(' | '),imp(E5),write(' | '),imp(E6),write(' |'),nl,
		write(' | '),imp(E7),write(' | '),imp(E8),write(' | '),imp(E9),write(' |'),nl.
		
jugador(Tablero,E,Tablero1):-read(P),tachar(P,E,Tablero,Tablero1),imprimir(Tablero1).

tacharValido(E,Tablero,Tablero1):-random(1,10,P),tachar(P,E,Tablero,Tablero1);tacharValido(E,Tablero,Tablero1).

generarVic([E,v,v,_,_,_,_,_,_],E,P):-random(2,4,P).
generarVic([E,_,_,v,_,_,v,_,_],E,P):-random(1,3,R),R =:= 1,P is 4;P is 7.
generarVic([E,_,_,_,v,_,_,_,v],E,P):-random(1,3,R),R =:= 1,P is 5;P is 9.
generarVic([v,E,v,_,_,_,_,_,_],E,P):-random(1,3,R),R =:= 1,P is 1;P is 3.
generarVic([_,E,_,_,v,_,_,v,_],E,P):-random(1,3,R),R =:= 1,P is 5;P is 8.
generarVic([v,v,E,_,_,_,_,_,_],E,P):-random(1,3,P).
generarVic([_,_,E,_,v,_,v,_,_],E,P):-random(1,3,R),R =:= 1,P is 5;P is 7.
generarVic([_,_,E,_,_,v,_,_,v],E,P):-random(1,3,R),R =:= 1,P is 6;P is 9.
generarVic([v,_,_,E,_,_,v,_,_],E,P):-random(1,3,R),R =:= 1,P is 1;P is 7.
generarVic([_,_,_,E,v,v,_,_,_],E,P):-random(5,7,P).
generarVic([v,_,_,_,E,_,_,_,v],E,P):-random(1,3,R),R =:= 1,P is 1;P is 9.
generarVic([_,_,v,_,E,_,v,_,_],E,P):-random(1,3,R),R =:= 1,P is 3;P is 7.
generarVic([_,v,_,_,E,_,_,v,_],E,P):-random(1,3,R),R =:= 1,P is 2;P is 8.
generarVic([_,_,_,v,E,v,_,_,_],E,P):-random(1,3,R),R =:= 1,P is 4;P is 6.
generarVic([_,_,v,_,_,E,_,_,v],E,P):-random(1,3,R),R =:= 1,P is 3;P is 9.
generarVic([_,_,_,v,v,E,_,_,_],E,P):-random(4,6,P).
generarVic([_,_,_,_,_,_,E,v,v],E,P):-random(8,10,P).
generarVic([v,_,_,v,_,_,E,_,_],E,P):-random(1,3,R),R =:= 1,P is 1;P is 4.
generarVic([_,_,v,_,v,_,E,_,_],E,P):-random(1,3,R),R =:= 1,P is 3;P is 5.
generarVic([_,v,_,_,v,_,_,E,_],E,P):-random(1,3,R),R =:= 1,P is 2;P is 5.
generarVic([_,_,_,_,_,_,v,E,v],E,P):-random(1,3,R),R =:= 1,P is 7;P is 9.
generarVic([_,_,_,_,_,_,v,v,E],E,P):-random(7,9,P).
generarVic([_,_,v,_,_,v,_,_,E],E,P):-random(1,3,R),R =:= 1,P is 3;P is 6.
generarVic([v,_,_,_,v,_,_,_,E],E,P):-random(1,3,R),R =:= 1,P is 1;P is 5.

%ganar en la primera fila
ganar([E,E,v,_,_,_,_,_,_],E,3).
ganar([E,v,E,_,_,_,_,_,_],E,2).
ganar([v,E,E,_,_,_,_,_,_],E,1).

%ganar en la segunda fila
ganar([_,_,_,E,E,v,_,_,_],E,6).
ganar([_,_,_,v,E,E,_,_,_],E,4).
ganar([_,_,_,E,v,E,_,_,_],E,5).

%ganar en la tercera fila
ganar([_,_,_,_,_,_,E,E,v],E,9).
ganar([_,_,_,_,_,_,E,v,E],E,8).
ganar([_,_,_,_,_,_,v,E,E],E,7).

%ganar en la primera columna
ganar([E,_,_,E,_,_,v,_,_],E,7).
ganar([E,_,_,v,_,_,E,_,_],E,4).
ganar([v,_,_,E,_,_,E,_,_],E,1).

%ganar en la segunda columna
ganar([_,E,_,_,E,_,_,v,_],E,8).
ganar([_,E,_,_,v,_,_,E,_],E,5).
ganar([_,v,_,_,E,_,_,E,_],E,2).

%ganar en la tercera columna
ganar([_,_,E,_,_,E,_,_,v],E,9).
ganar([_,_,E,_,_,v,_,_,E],E,6).
ganar([_,_,v,_,_,E,_,_,E],E,3).

%ganar en la primera diagonal
ganar([E,_,_,_,E,_,_,_,v],E,9).
ganar([E,_,_,_,v,_,_,_,E],E,5).
ganar([v,_,_,_,E,_,_,_,E],E,1).

%ganar en la segunda diagonal
ganar([_,_,E,_,E,_,v,_,_],E,7).
ganar([_,_,E,_,v,_,E,_,_],E,5).
ganar([_,_,v,_,E,_,E,_,_],E,3).

maquina(Tablero,E,Tablero1):-
	%la maquina primero intenta ganar
	ganar(Tablero,E,P),tachar(P,E,Tablero,Tablero1),imprimir(Tablero1);
	
	%si no puede ganar defiende
	estado(Q),Q \= E,ganar(Tablero,Q,P),tachar(P,E,Tablero,Tablero1),imprimir(Tablero1);
	
	%si no necesita defender,genera una victoria
	generarVic(Tablero,E,P),tachar(P,E,Tablero,Tablero1),imprimir(Tablero1);
	
	%si no se puede generar una victoria, tacha una casilla valida
	tacharValido(E,Tablero,Tablero1),imprimir(Tablero1).

turno(Tablero,1):-
	write('JUGADOR 1 (o):'),
	nl,
	jugador(Tablero,o,Tablero1),
	\+ ganador(Tablero1,'Jugador 1'),
	\+ empate(Tablero1),
	write('JUGADOR 2 (x):'),
	nl,
	jugador(Tablero1,x,Tablero2),
	\+ ganador(Tablero2,'Jugador 2'),
	\+ empate(Tablero2),
	turno(Tablero2,1).

turno(Tablero,2):-
	write('JUGADOR 1 (o):'),
	nl,
	jugador(Tablero,o,Tablero1),
	\+ ganador(Tablero1,'Jugador 1'),
	\+ empate(Tablero1),
	write('Maquina (x):'),
	nl,
	maquina(Tablero1,x,Tablero2),
	\+ ganador(Tablero2,'Maquina'),
	\+ empate(Tablero2),
	turno(Tablero2,2).

jugar():-
	nl,
	write('Modo de juego? (1: Jugador vs Jugador | 2: Jugador vs Maquina): '),
	read(Modo),
	iniciar(Tablero),
	nl,
	imprimir(Tablero),
	turno(Tablero,Modo).
