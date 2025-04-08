:- use_module(library(csv)).
:- use_module(library(lists)).

%% carregar_dependencias is det 
carregar_dependencias :-
    consult('Ger_Pacientes.pl'),
    consult('doencas.pl'),
    consult('historico_diagnostico.pl'),
    consult('estatisticas.pl'),
    load_data.

%% menu_diagnostico is nondet
menu_diagnostico :-
    consult('main.pl'),
    carregar_dependencias,
    write('Diagnóstico Médico Interativo'), nl,
    write('ATENÇÃO: O resultado deste protótipo é apenas informativo e não substitui uma consulta médica!'), nl, nl,
    write('1. Iniciar diagnóstico'), nl,
    write('2. Ver lista de sintomas computáveis'), nl,
    write('3. Voltar'), nl, nl,
    read(Option),
    process_option_diagnostico(Option).

%% process_option_diagnostico(+Option) is nondet
process_option_diagnostico(1) :-
    write('Digite o ID do paciente: '), nl, nl,
    read(Id),
    (paciente_existe(Id) ->
        iniciar_diagnostico(Id)
    ;
        write('Paciente não encontrado! Faça o cadastro primeiro.'), nl
    ), nl,
    menu_diagnostico.

process_option_diagnostico(2) :-
    write('Sintomas computáveis:'), nl,
    findall(S, sintoma_csv(_, S), Lista),
    list_to_set(Lista, SintomasUnicos),
    forall(member(S, SintomasUnicos), (write('- '), write(S), nl)),
    menu_diagnostico.

process_option_diagnostico(3) :- menu.

%% Lê sintomas a partir do doencas.csv
sintoma_csv(Doenca, Sintoma) :-
    csv_read_file('doencas.csv', Linhas, [functor(doenca), separator(0';)]),
    member(doenca(Doenca, Sintoma), Linhas).

%% coletar_sintomas(+Id, -Sintomas) is nondet
coletar_sintomas(Id, Sintomas) :-
    coletar_loop(Id, [], Sintomas).

coletar_loop(Id, Acc, SintomasFinais) :-
    length(Acc, Num),
    (Num >= 5 ->
        reverse(Acc, SintomasFinais),
        add_sintoma(Id, SintomasFinais)
    ;
        write('Insira um sintoma ou digite "fim": '), nl,
        read(S),
        (S == fim ->
            reverse(Acc, SintomasFinais),
            add_sintoma(Id, SintomasFinais)
        ;
            coletar_loop(Id, [S|Acc], SintomasFinais)
        )
    ).

%% iniciar_diagnostico(+Id) is nondet
iniciar_diagnostico(Id) :-
    write('Iniciando diagnóstico...'), nl,
    write('Digite os sintomas que está sentindo:'), nl,
    coletar_sintomas(Id, _),
    diagnostico(Id, DiagnosticoOrdenado),
    add_doenca(Id, DiagnosticoOrdenado),
    write('Diagnóstico: '), nl,
    write(DiagnosticoOrdenado), nl.

%% diagnostico(+Id, -DiagnosticoOrdenado)
diagnostico(Id, DiagnosticoOrdenado) :-
    patient(Id, _, _, SintomasPaciente, _),
    findall(Doenca, sintoma_csv(Doenca, _), Doencas),
    list_to_set(Doencas, DoencasUnicas),
    encontrar_diagnostico(SintomasPaciente, DoencasUnicas, Diagnostico),
    sort(2, @>=, Diagnostico, DiagnosticoOrdenado).

%% encontrar_diagnostico(+SintomasPaciente, +Doencas, -Diagnostico)
encontrar_diagnostico(_, [], []).
encontrar_diagnostico(SintomasPaciente, [Doenca|Resto], [(Doenca, Score)|DiagResto]) :-
    findall(S, (sintoma_csv(Doenca, S), member(S, SintomasPaciente)), Comuns),
    length(Comuns, Score),
    encontrar_diagnostico(SintomasPaciente, Resto, DiagResto).
