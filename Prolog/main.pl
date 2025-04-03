menu:-
  nl,
  write('       _/_/_/  _/_/_/    _/      _/  _/_/_/ '), nl,
  write('    _/        _/    _/  _/_/  _/_/    _/    '), nl,
  write('     _/_/    _/    _/  _/  _/  _/    _/     '), nl,
  write('        _/  _/    _/  _/      _/    _/      '), nl,
  write(' _/_/_/    _/_/_/    _/      _/  _/_/_/     '), nl, nl,
  write('Bem-vindo ao Sistema de Diagnóstico Médico Interativo!'), nl,
  write('Escolha uma opção:'), nl,
  write('1 - Diagnóstico de Doenças Interativo'), nl,
  write('2 - Gerenciamento de Pacientes'), nl,
  write('3 - Sair'), nl, nl,
  read(Opcao),
  opcao_menu(Opcao).

opcao_menu(1):-
  menu_diagnostico.

opcao_menu(2):-
  menu_ger_pacientes.

opcao_menu(3):-
  nl, write('Saindo...'), nl, nl,
  halt.

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
