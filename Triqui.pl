
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

libre(P,Tablero):-estado(P,Tablero,v).

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
		
jugador(Tablero,E,Tablero1):-read(P),estado(E),tachar(P,E,Tablero,Tablero1),imprimir(Tablero1).

turno(Tablero):-
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
	turno(Tablero2).

jugar(_):-iniciar(Tablero),nl,imprimir(Tablero),turno(Tablero).
