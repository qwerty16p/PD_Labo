% Derivada de una constante
d(Var, Func, 0) :-
    atomic(Var), number(Func).

% Derivada de una variable con respecto a si misma
d(Var, Func, 1) :-
    Var == Func.

% Derivada de una variable por una constante
d(Var, N*Var, N) :-
    atomic(Var), number(N).

% Derivada de una variable elevada a la N
d(Var, Var^N, N*Var^Nm1) :-
    number(N), is(Nm1, N - 1).

% Derivada de una variable elevada a la N por una constante
d(Var, K*Var^N, C*Var^Nm1) :-
    atomic(Var), number(K), number(N), is(C, K*N), is(Nm1, N-1).

% Derivada de un logaritmo natural
d(Var, log(Var), 1/Var) :-
    atomic(Var).

% Integral de una constante
s(Var, K, K*Var) :-
    number(K), atomic(Var).

% Integral de una variable con respecto a si misma
s(Var, Var, 1/2*Var^2) :-
    atomic(Var).

%% Integral de una constante por una variable elevada a la N
s(Var, K*Var^N, K/M*Var^M) :-
    atomic(Var), number(K), number(N), is(M, N+1).

suma(Var, A+B, R) :-
    coeficiente(Var, A, CA, Base),
    coeficiente(Var, B, CB, Base),
    C is CA+CB,
    termino(C, Base, R).

resta(Var, A-B, R) :-
    coeficiente(Var, A, CA, Base),
    coeficiente(Var, B, CB, Base),
    C is CA-CB,
    termino(C, Base, R).

coeficiente(Var, Var, 1, Var) :- atomic(Var).
coeficiente(Var, Var^N, 1, Var^N) :- atomic(Var), number(N).
coeficiente(Var, K*T, C, Base) :-
    number(K), coeficiente(Var, T, CT, Base), C is K*CT.
coeficiente(Var, -T, C, Base) :-
    coeficiente(Var, T, CT, Base), C is -CT.
coeficiente(Var, A+B, C, Base) :-
    coeficiente(Var, A, CA, Base),
    coeficiente(Var, B, CB, Base), C is CA+CB.
coeficiente(Var, A-B, C, Base) :-
    coeficiente(Var, A, CA, Base),
    coeficiente(Var, B, CB, Base), C is CA-CB.

termino(C, _, 0) :- C =:= 0, !.
termino(C, Base, Base) :- C =:= 1, !.
termino(C, Base, C*Base).
