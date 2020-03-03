
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

insertar(E,1,[_|Xs],[E,Xs]).
insertar(E,P,[X|Xs],[X|Xs1]):-P1 is P-1,insertar(E,P1,Xs,[X|Xs1]).

movimiento(P,E,Tablero,Tablero1):-estado(N,Tablero,v),insertar(E,P,Tablero,Tablero1).
