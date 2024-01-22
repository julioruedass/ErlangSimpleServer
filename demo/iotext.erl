-module(iotext). 
-export([readtxt/0]). 
-export([listdoc/0]).
-export([writeline/0]).
-export([writenewline/0]).
-export([newdir/0]).
-export([docsize/0]).
-export([docrename/0]).


readtxt() -> 
   {ok, File} = file:open("Newfile.txt",[read]),
   Txt = file:read(File,1024 * 1024), 
   io:fwrite("~p~n",[Txt]).

listdoc() -> 
   io:fwrite("~p~n",[file:list_dir(".")]).

writeline() -> 
   {ok, Fd} = file:open("Newfile.txt", [write]), 
   file:write(Fd,"New Line by Erlang").

writenewline() -> 
   {ok, Fd} = file:open("Newfile.txt", [append]), 
   file:write(Fd,"  \n New Line by Erlang").

newdir() ->
   io:fwrite("~p~n",[file:make_dir("newdirerlang")]).

docsize() -> 
   io:fwrite("~w~n",[filelib:file_size("Newfile.txt")]).

docrename() ->
   io:fwrite("~p~n",[file:rename("Newfile.txt","Newfile.txt")]).