# Part 1
Code:
```
%  search(Elem, List)
search(X, [X|_])
search(X, [_|Xs]) :- search(X, Xs)
```

Query:
```

```