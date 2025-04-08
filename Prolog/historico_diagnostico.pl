:- dynamic historico_diagnostico/4.
% historico_diagnostico(ID_Paciente, DataHora, Sintomas, Diagnosticos).

registrar_historico(ID, Sintomas, Diagnosticos) :-
    get_time(Timestamp),
    format_time(atom(DataHora), '%Y-%m-%d %H:%M', Timestamp, posix),
    assertz(historico_diagnostico(ID, DataHora, Sintomas, Diagnosticos)).
