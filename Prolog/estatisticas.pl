% estatisticas.pl
:- module(estatisticas, [menu_estatisticas/0]).
:- consult('Ger_Pacientes.pl').

%% menu_estatisticas is det
%
%  Mostra estatísticas globais dos diagnósticos.
menu_estatisticas :-
  nl,
  write('===== ESTATÍSTICAS DO SISTEMA ====='), nl,
  findall(Doenca, (
    patient(_, _, _, _, Doencas),
    member((Doenca, Grau), Doencas),
    Grau > 0
  ), TodasDoencas),
  sort(TodasDoencas, DoencasUnicas),
  contar_ocorrencias(DoencasUnicas, TodasDoencas),
  nl.

contar_ocorrencias([], _).
contar_ocorrencias([D|Resto], Lista) :-
  include(==(D), Lista, Filtros),
  length(Filtros, Total),
  format('- ~w: ~d ocorrências~n', [D, Total]),
  contar_ocorrencias(Resto, Lista).
