-module(server).
-export([server/1]).
% port =5678

server(Port) ->
    {ok, LSock} = gen_tcp:listen(Port, [{active, false},{packet,2}]),
    {ok, Sock} = gen_tcp:accept(LSock),
    {ok, Bin} = do_recv(Sock, []),
    ok = gen_tcp:close(Sock),
    ok = gen_tcp:close(LSock),
    Bin.

do_recv(Sock, Bs) ->
    case gen_tcp:recv(Sock, 0) of
        {ok, B} ->
            io:format("mensaje ok ~n", []),
            do_recv(Sock, [Bs, B]);
        {error, closed} ->
            io:format("mensaje error ~n", []),
            {ok, list_to_binary(Bs)}
    end.