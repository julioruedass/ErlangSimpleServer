-module(repeticiones).
-export([do_loop/0]).

do_loop() ->
    loop(1).

loop(20) ->
    ok;

loop(Count) ->
    % do something
    io:format("mensaje ok ~w ~n", [Count]),
    timer:sleep(2000),
    loop(Count+1).