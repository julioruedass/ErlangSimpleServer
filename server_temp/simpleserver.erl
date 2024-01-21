-module(simpleserver).
-export([
  main/1,
  run_server/0,
  start/0,
  stop/0
]).

main(_) ->
  start(),
  stop(),
  receive
    stop -> ok
  end.

run_server() ->
  ok = inets:start(),
  {ok, _} = inets:start(httpd, [
    {port, 9090},
    {server_name, "hello_erlang"},
    {server_root, "/tmp"},
    {document_root, "/tmp"},
    {bind_address, "localhost"}
  ]).

start() -> run_server().  
stop()  -> halt().
