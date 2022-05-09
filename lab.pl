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
search_two(X, [X, _, X|_]).
search_two(X, [_|T]) :- search_two(X, T).

% 1.4
% search_anytwo ( Elem , List )
% looks for any Elem that occurs two times , anywhere
search_anytwo(X, [X|T]) :- search(X, T).
search_anytwo(X, [H|T]) :- search_anytwo(X, T).

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
max([H|T], M) :- max([H|T], M, H).
max([], Temp, Temp).
max([H|T], M, Temp) :- Temp > H, max(T, M, Temp).
max([H|T], M, Temp) :- H >= Temp, max(T, M, H).

% max without temp
max2([E], E).
max2([H|T], Temp) :- max2(T, Temp), Temp > H.
max2([H|T], H) :- max2(T, Temp), H > Temp.

% 2.6
% max_min( List , Max , Min )
% Max is the biggest element in List
% Min is the smallest element in List
% Suppose the list has at least one element
max_min([H|T], Max, Min) :- max_min([H|T], Max, Min, H, H).
max_min([], TMax, TMin, TMax, TMin).
max_min([H|T], Max, Min, TMax, TMin) :- TMax > H, TMin =< H, max_min(T, Max, Min, TMax, TMin).
max_min([H|T], Max, Min, TMax, TMin) :- TMax > H, H < TMin, max_min(T, Max, Min, TMax, H).
max_min([H|T], Max, Min, TMax, TMin) :- H >= TMax, max_min(T, Max, Min, H, TMin).

% max_min without temps
