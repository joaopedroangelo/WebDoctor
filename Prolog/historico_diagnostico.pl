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
      write('Diagnósticos registrados:'), nl,
      agrupar_diagnosticos(Doencas, Agrupados),
      exibir_diagnosticos_agrupados(Agrupados)
  ;
      write('Paciente não encontrado!'), nl
  ), nl.

% Agrupa doenças repetidas e soma as acurácias
agrupar_diagnosticos(Lista, Agrupado) :-
  maplist(arg(1), Lista, Doencas),
  list_to_set(Doencas, Unicas),
  findall((D, Total), (
    member(D, Unicas),
    findall(G, member((D, G), Lista), Grupos),
    sum_list(Grupos, Total)
  ), Agrupado).

% Exibe a lista formatada
exibir_diagnosticos_agrupados([]).
exibir_diagnosticos_agrupados([(Doenca, Grau)|T]) :-
  format('- ~w (total de acurácia: ~d)~n', [Doenca, Grau]),
  exibir_diagnosticos_agrupados(T).