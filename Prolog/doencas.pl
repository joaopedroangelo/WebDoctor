ler_csv_doencas(Arquivo) :-
    open(Arquivo, read, Stream),
    read_line_to_string(Stream, _),  % Pular cabeçalho
    ler_linhas_csv(Stream),
    close(Stream).

ler_linhas_csv(Stream) :-
    read_line_to_string(Stream, Linha),
    (   Linha \= end_of_file
    ->  split_string(Linha, ",", "", [DoencaStr, SintomaStr]),
        atom_string(Doenca, DoencaStr),
        atom_string(Sintoma, SintomaStr),
        assertz(sintoma(Doenca, Sintoma)),
        ler_linhas_csv(Stream)
    ;   true).