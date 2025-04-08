estatistica_mais_comum :-
    findall(D, historico_diagnostico(_, _, _, Diagnosticos), Ds),
    flatten(Ds, Flat),
    maplist(arg(1), Flat, Doencas),
    msort(Doencas, Ordenadas),
    sort(Doencas, Unicas),
    contar_freq(Unicas, Ordenadas, Contagem),
    keysort(Contagem, Ordenada),
    reverse(Ordenada, [(MaisComum-_Freq)|_]),
    format('Doença mais comum: ~w~n', [MaisComum]).

contar_freq([], _, []).
contar_freq([H|T], Lista, [(H-N)|Resto]) :-
    include(==(H), Lista, Filt),
    length(Filt, N),
    contar_freq(T, Lista, Resto).