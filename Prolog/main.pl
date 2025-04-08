menu:-
  write('Bem-vindo ao Sistema de Diagnóstico Médico Interativo!'), nl,
  write('Escolha uma opção:'), nl,
  write('1 - Diagnóstico de Doenças Interativo'), nl,
  write('2 - Gerenciamento de Pacientes'), nl,
  write('3 - Estatísticas do Sistema'), nl,
  write('4 - Histórico de Diagnósticos de um Paciente'), nl,
  write('5 - Sair'), nl, nl,
  read(Opcao),
  opcao_menu(Opcao).

opcao_menu(1):-
  menu_diagnostico.

opcao_menu(2):-
  menu_ger_pacientes.

opcao_menu(3) :-
  estatistica_mais_comum, menu.

opcao_menu(4) :- 
    write('ID do paciente: '), read(ID),
    listar_historico(ID), menu.

opcao_menu(5):-
  nl, write('Saindo...'), nl, nl,
  halt.

listar_historico(ID) :-
    historico_diagnostico(ID, Data, Sintomas, Diagnosticos),
    format('~nData: ~w~nSintomas: ~w~nDiagnostico: ~w~n~n', [Data, Sintomas, Diagnosticos]),
    fail.
listar_historico(_).


start:-
  consult('Ger_Pacientes.pl'),
  consult('Diagnostico.pl'),
  consult('Tests.pl'),
  load_data,
  menu.

start_tests:-
  write('Leia as notas no arquivo Tests.pl'), nl,
  consult('Ger_Pacientes.pl'),
  consult('Diagnostico.pl'),
  consult('Tests.pl'),
  run_tests.
