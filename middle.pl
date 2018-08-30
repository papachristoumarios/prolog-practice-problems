% Middle Problem
%
% ?- middle([], M).
% M = [].
% ?- middle([1], M).
% M = [1].
% ?- middle([1,2], M).
% M = [1, 2].
% ?- middle([1,2,3], M).
% M = [1, [2], 3].
% ?- middle([1,2,3,4], M).
% M = [1, [2, 3], 4].
% ?- middle([1,2,3,4,5], M).
% M = [1, [2, [3], 4], 5].
% ?- middle([1,2,3,4,5,6], M).
% M = [1, [2, [3, 4], 5], 6].
% ?- middle([1,2,3,4,5,6,7], M).
% M = [1, [2, [3, [4], 5], 6], 7].

middle([], []).
middle([X], [X]).
middle([X, Y], [X, Y]).

middle([H | R], [H, M, L]) :-
  append(I, [L], R),
  I = [_ | _],
  middle(I, M).
