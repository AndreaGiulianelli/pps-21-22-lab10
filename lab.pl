%=====1======
% search(Elem, List)
search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).

% search2(Elem, List)
search2(X, [X, X|_]).
search2(X, [_|Xs]) :- search2(X, Xs).

% 1.3
% search_two(Elem, List)
% looks for two occurrences of Elem with any element in between
% fully relational 
%   -> search_two(X, [a, d, a, c, d, c, f, g])
%   -> search_two(c, [a, _ , _, c, d, _, f, g])
%   -> search_two(X, [a, _ , _, c, d, _, f, g])
search_two(X, [X, _, X|_]).
search_two(X, [_|T]) :- search_two(X, T).

% 1.4
% search_anytwo ( Elem , List )
% looks for any Elem that occurs two times , anywhere
search_anytwo(X, [X|T]) :- search(X, T).
search_anytwo(X, [H|T]) :- search_anytwo(X, T).

%=====2======
% 2.1
% size ( List , Size )
% Size will contain the number of elements in List
% It allow fully relational behaviour
%   -> size([a, b, c], S)
%   -> size(X, 3)
size([], 0).
size([_|Xs], N) :- size(Xs, N2), N is N2 + 1.

% 2.2
% size ( List , Size )
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero))..
% fully relational
%  -> size_peano(X, s(s(zero)))
%  -> size_peano([a, b, c], N)
size_peano([], zero).
size_peano([_|T], s(N)) :- size_peano(T, N).

% 2.3
% sum(List, Sum)
sum([], 0).
sum([H|T], N) :- sum(T, N2), N is H + N2.

% 2.4
% average ( List , Average )
% it uses average ( List , Count , Sum , Average )
average([H|T], A) :- average([H|T], 0, 0, A). % in this way solve the problem of 0/0 in an empty list
average([], C, S, A) :- A is S/C.
average([X|Xs], C, S, A) :- 
	C2 is C + 1,
	S2 is S + X,
	average(Xs, C2, S2, A).

% 2.5
% max with temp
% max ( List , Max )
% Max is the biggest element in List
% Suppose the list has at least one element
% Version with temps, below version without
max([H|T], M) :- max([H|T], M, H).
max([], Temp, Temp).
max([H|T], M, Temp) :- Temp > H, max(T, M, Temp).
max([H|T], M, Temp) :- H >= Temp, max(T, M, H).

% max without temp
max2([E], E).
max2([H|T], Temp) :- max2(T, Temp), Temp >= H.
max2([H|T], H) :- max2(T, Temp), H > Temp.

% 2.6
% max_min( List , Max , Min )
% Max is the biggest element in List
% Min is the smallest element in List
% Suppose the list has at least one element
% Version with temps, below version without
max_min([H|T], Max, Min) :- max_min([H|T], Max, Min, H, H).
max_min([], TMax, TMin, TMax, TMin).
max_min([H|T], Max, Min, TMax, TMin) :- TMax > H, TMin =< H, max_min(T, Max, Min, TMax, TMin).
max_min([H|T], Max, Min, TMax, TMin) :- TMax > H, H < TMin, max_min(T, Max, Min, TMax, H).
max_min([H|T], Max, Min, TMax, TMin) :- H >= TMax, max_min(T, Max, Min, H, TMin).

% max_min without temps
max_min2([E], E, E).
max_min2([H|T], TempMax, TempMin) :- max_min2(T, TempMax, TempMin), TempMax >= H, TempMin =< H.
max_min2([H|T], TempMax, H) :- max_min2(T, TempMax, TempMin), TempMax > H, H < TempMin.
max_min2([H|T], H, TempMin) :- max_min2(T, TempMax, TempMin), H > TempMax.


%=====3======
% 3.1
% same ( List1 , List2 )
% are the two lists exactly the same ?
% fully relational
%	-> same([1,2], X)
%	-> same(X, [1,2])
same([],[]).
same([X|Xs],[X|Ys]) :- same(Xs, Ys).

% 3.2
% all_bigger (List1, List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10, 20, 30, 40], [9, 19, 29, 39]).
% List must have the same size
all_bigger([X], [Y]) :- X > Y.
all_bigger([X|Tx], [Y|Ty]) :- X > Y, all_bigger(Tx, Ty).

%3.3
% sublist(List1, List2)
% List1 should contain elements all also in List2
% example: sublist([1, 2], [5, 3, 2, 1]).
sublist([], L).
sublist([H|T], L) :- search(H, L), sublist(T, L).


%=====4======
% 4.1
% seq(N, List)
% example: seq(5, [0, 0, 0, 0, 0]).
% It's not fully relational because the math operators are not relational.
seq(0, []).
seq(N, [0|T]) :- N2 is N - 1, seq(N2, T).

% 4.2
% seqR(N, List)
% example: seqR(4, [4, 3, 2, 1, 0]).
seqR(0, [0]).
seqR(N, [N|T]) :- N2 is N - 1, seqR(N2, T).

% 4.3
% seqR2(N, List)
% example: seqR2(4, [0, 1, 2, 3, 4]).
seqR2(0, [0]).
seqR2(N, L) :- N >= 0, last(P, N, L), N2 is N - 1, seqR2(N2, P).

last([], N, [N]).
last([H|T], N, [H|T1]) :- last(T, N, T1).


%=====5======
% 5
% last_list
% last_list(N, List)
% last element of the List
% fully relational
%	-> last_list(N, [1, 2, 3, 4, 5])
%	-> last_list(5, L)
last_list(N, [N]).
last_list(N, [H|T]) :- last_list(N, T).

% filter
% filter(List, Value, Res)
% Select all the elements of the list that are >= Value
% example: filter([10, 5, 20, 0, 40], 10, L)
filter([], Value, []).
filter([H|T], Value, [H|T1]) :- H >= Value, filter(T, Value, T1).
filter([H|T], Value, L) :- H < Value, filter(T, Value, L).

% drop
% drop(List, N, Res)
% Select all elements except first N ones.
% example: drop([1,2,3,4], 2, [3,4]).
drop(L, 0, L).
drop([H|T], N, L) :- N > 0, N2 is N - 1, drop(T, N2, L).