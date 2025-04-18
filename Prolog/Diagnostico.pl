:- use_module(library(lists)).
:- discontiguous process_option_diagnostico/1.

%% carregar_dependencias is det 
carregar_dependencias :-
    consult('Ger_Pacientes.pl'),
    consult('doencas.pl'),
    consult('historico_diagnostico.pl'),
    consult('estatisticas.pl'),
    load_data.

%% menu_diagnostico is nondet
menu_diagnostico :-
    carregar_dependencias,
    write('Diagnóstico Médico Interativo'), nl,
    write('ATENÇÃO: O resultado deste protótipo é apenas informativo e não substitui uma consulta médica!'), nl, nl,
    write('1. Iniciar diagnóstico'), nl,
    write('2. Ver lista de sintomas computáveis'), nl,
    write('3. Histórico de um Paciente'), nl,
    write('4. Estatísticas do Sistema'), nl,
    write('5. Sair'), nl, nl,
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
  write('Sintomas computáveis: '), nl,
  findall(Sintoma, sintoma(_, Sintoma), Sintomas),
  list_to_set(Sintomas, SintomasUnicos),
  write(SintomasUnicos), nl,
  menu_diagnostico.

process_option_diagnostico(3) :-
  menu_historico_paciente,
  menu_diagnostico.

process_option_diagnostico(4) :-
  menu_estatisticas,
  menu_diagnostico.

process_option_diagnostico(5) :- menu.

process_option_diagnostico(_) :-
    write('Opção inválida! Tente novamente.'), nl,
    menu_diagnostico.

%% coletar_sintomas(+Id, -Sintomas) is nondet
%
% Coleta os sintomas do usuário interativamente até que haja pelo menos 5 sintomas. Se o usuário digitar "fim", termina a coleta e inicia o diagnóstico.
coletar_sintomas(Id, Sintomas) :-
    length(Sintomas, NumSintomas),
    (NumSintomas >= 5 -> add_sintoma(Id, Sintomas)
    ;
    write('Insira um sintoma ou digite "fim" para terminar: '), nl,
    read(Sintoma),
    (Sintoma == fim -> add_sintoma(Id, Sintomas)
      ;
      coletar_sintomas(Id, [Sintoma|Sintomas]))).

%% contar_sintomas_iguais(+T, +L2, -Contador) is nondet
%
% Conta quantos elementos da lista T estão presentes na lista L2.
contar_elementos_iguais([], _, 0).
contar_elementos_iguais([H|T], L2, Contador) :-
    member(H, L2),
    contar_elementos_iguais(T, L2, Contador1),
    Contador is Contador1 + 1.
contar_elementos_iguais([_|T], L2, Contador) :-
    contar_elementos_iguais(T, L2, Contador).

%% iniciar_diagnostico(+Id) is nondet
%
% Inicia o diagnóstico do paciente com o ID fornecido.
diagnostico(Id, DiagnosticoOrdenado) :-
    patient(Id, _, _, SintomasPaciente, _),
    findall(Doenca, sintoma(Doenca, _), Doencas),
    list_to_set(Doencas, DoencasUnicas),
    encontrar_diagnostico(SintomasPaciente, DoencasUnicas, Diagnostico),
    sort(2, @>=, Diagnostico, DiagnosticoOrdenado).

encontrar_diagnostico(_, [], []).
encontrar_diagnostico(SintomasPaciente, [Doenca|Resto], [(Doenca, Contador)|DiagnosticoResto]) :-
    findall(Sintoma, (sintoma(Doenca, Sintoma), member(Sintoma, SintomasPaciente)), SintomasComuns),
    length(SintomasComuns, Contador),
    encontrar_diagnostico(SintomasPaciente, Resto, DiagnosticoResto).

iniciar_diagnostico(Id) :-
    write('Iniciando diagnóstico...'), nl,
    write('O diagnóstico deve ser interpretado da seguinte forma: A partir dos sintomas que forem informados,'), nl,
    write('será exibida uma lista de doenças. A primeira doença da lista, é a mais provável. Ao lado de cada'), nl,
    write('doença, será exibido um valor de acurácia de 1 a 10, quanto mais próximo de 10, mais confiável é'), nl,
    write('o resultado.'), nl,
    write('LEMBRANDO QUE O RESULTADO DESTE PROTÓTIPO É APENAS INFORMATIVO E NÃO SUBSTITUI UMA CONSULTA MÉDICA!'), nl, nl,
    write('Digite os sintomas que está sentindo: '), nl,
    coletar_sintomas(Id, _),
    diagnostico(Id, DiagnosticoOrdenado),
    add_doenca(Id, DiagnosticoOrdenado),      % Adiciona a doença ao registro do paciente
    write('Diagnóstico: '), nl,
    write(DiagnosticoOrdenado), nl,
    menu_diagnostico.