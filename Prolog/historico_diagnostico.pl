% historico.pl
:- module(historico, [menu_historico_paciente/0]).
% consult('Ger_Pacientes.pl').  % já carregado em main.pl

%% menu_historico_paciente is det
%
%  Exibe o histórico de doenças de um paciente especificado por ID.
menu_historico_paciente :-
  nl,
  write('===== HISTÓRICO DE DOENÇAS DO PACIENTE ====='), nl,
  write('Digite o ID do paciente: '), nl,
  read(Id),
  ( paciente_existe(Id) ->
      patient(Id, Nome, _, _, Doencas),
      write('Paciente: '), write(Nome), nl,
      write('Histórico de diagnósticos: '), nl,
      print_doencas(Doencas)
  ;
      write('Paciente não encontrado!'), nl
  ), nl.

print_doencas([]) :-
  write('Nenhum diagnóstico registrado.'), nl.
print_doencas([(Doenca, Grau)|T]) :-
  format('- ~w (acurácia: ~d)~n', [Doenca, Grau]),
  print_doencas(T).
