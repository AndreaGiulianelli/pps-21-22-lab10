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

%2.1
% size ( List , Size )
% Size will contain the number of elements in List

