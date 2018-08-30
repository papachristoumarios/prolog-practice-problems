

weight([food(H, _) | T], S, Result) :-
  W is H + S,
  (
    T = [] -> Result = W;
    weight(T, W, Result)
  ).

calories([food(_, H) | T], S, Result) :-
  W is H + S,
  (
    T = [] -> Result = W;
    calories(T, W, Result)
  ).

calories(K, W) :- calories(K, 0, W).
weight(K, W) :- weight(K, 0, W).
weight([], 0).
calories([], 0).

knapsackDecide(L, C, Opt, Sol) :-
  powerset(Sol, L),
  weight(Sol, W),
  W =< C,
  calories(Sol, K),
  K >= Opt.

foldl([H | T], XInit, Result) :-
  f(H, XInit, W),
  (
    T = [] -> Result = W;
    foldl(T, W, Result)
  ).
