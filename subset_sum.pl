% Subset Sum Problem
taill([H | T], T).
head([H | T], H).

running_sum(X, [], X).

running_sum([],[H|T],P):-
    running_sum([H],T,P).

running_sum([H1|T1],[H2|T2],P):-
    K is H1 + H2,
    running_sum([K,H1|T1],T2,P).


running_sum([H|T],Z):-
    (
    var(Z) -> running_sum([],[H|T],K),
    reverse(K, Z);
    inverse_subsum(X, Z , []),
    head(Z, H),
    append([H], X, [H | T])
    ).


inverse_subsum(X, [S1, S2 | Ss], Acc) :-
  Y is S2 - S1,
  write(Y), nl,
  append(Acc, [Y], NAcc),
  write(NAcc), nl,
  (
  length([S1, S2 | Ss], 2) -> write('foo'), X = NAcc;
  inverse_subsum(X, [S2 | Ss], NAcc)
  ).

powerset([], []).
powerset([H|T], P) :- powerset(T,P).
powerset([H|T], [H|P]) :- powerset(T,P).

subsum(Sum, X, L) :-
  powerset(L, X),
  running_sum([], X, S),
  head(S, H),
  H is Sum.

subset_sum(Set, Sum, Subset) :-
  findall(X, subsum(Sum, X, Set), Subset).