-module(client_p).
-export([client/1]).
% port =5678
%%gen_tcp:connect("www.erlang.org", 80, [binary, {packet, 0}]).
%%gen_tcp:connect("localhost", 5678,   [binary, {packet, 0}]).
%%gen_tcp:close(Sock)
-export([do_loop/1]).

do_loop(Port) ->
    loop(1,Port).

loop(10,Port) ->
    io:fwrite("Termino ejecuccion ~n"),
    ok;

loop(Count,Port) ->
    % do something
    timer:sleep(2000),
    try  
        client(Port) of
        _ -> ok
    catch   
        _ -> error
    end,
        io:format("- mensaje ~w ~n", [Count]),
    loop(Count+1,Port).

    client(Port)->     
        SomeHostInNet = "localhost", % to make it runnable on one machine
        case gen_tcp:connect(SomeHostInNet, Port, [{active, false},{packet,2}]) of
            {ok,Sock } ->    
                io:fwrite("Se conecto "),
                ok =gen_tcp:send(Sock, "Cliente send for 5678"),
                %%A = gen_tcp:recv(Sock,0),
                ok = gen_tcp:close(Sock),
                Sock;
            {error,econnrefused} ->
                io:fwrite("No conecto "),
                {error,econnrefused}
        end.