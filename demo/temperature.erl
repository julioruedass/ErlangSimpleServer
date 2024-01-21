%% This module is in file Temperature.erl
-module(temperature).
-export([format_temps/1]).

%% Only this function is exported
format_temps([])->   
    ok;

format_temps([City | Rest]) ->
    %%Listar=[],
    %%Listar= lists:append(format_temps_2([City | Rest])),
    io:format("Listado ~w ~n", [format_temps_2([City | Rest])]),
    Tamano =length([City | Rest]),
    Tamano.
    %%Listar= lists:append(format_temps_2([City | Rest])),
    %%Tamano =length(Listar),
    

format_temps_2([City | Rest]) ->
    io:format("se encontro un elemento ~n", []),
    print_temp(convert_to_celsius(City)),
    format_temps(Rest),[1].

convert_to_celsius({Name, {c, Temp}}) ->  % No conversion needed
    {Name, {c, Temp}};
convert_to_celsius({Name, {f, Temp}}) ->  % Do the conversion
    {Name, {c, (Temp - 32) * 5 / 9}}.

print_temp({Name, {c, Temp}}) ->
    io:format("~-15w ~w c~n", [Name, Temp]).