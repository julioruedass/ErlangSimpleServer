-module(mysqlcon). 
-export([start/0]). 

start() ->
   odbc:start(), 
   {ok, Ref} = odbc:connect("DSN = MSSQLTest;", []), 
   io:fwrite("~p",[Ref]).

