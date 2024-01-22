-module(mysql_erlang).
-export([connect_to_database/0]).

connect_to_database() ->
    % Replace 'MSSQLTestDSN' with your actual DSN
    DSN = "MSSQLTestDSN",
    
    % ODBC connection string
    ConnectionString = "DSN=" ++ DSN,
    odbc:start(),
    % Try to establish a connection
    case odbc:connect(ConnectionString, []) of
        {ok, Connection} ->
            io:format("Connection successful!~n"),
            
            % Perform any database operations here if needed
            
            % Close the connection when done
            odbc:disconnect(Connection),
            io:format("Connection closed.~n");
            
        {error, Reason} ->
            io:format("Connection failed. Error: ~p~n", [Reason])
    end.

% Run the function when the module is compiled
%-include_lib("stdlib/include/logger.hrl").
%start() ->
%    logger:start(),
%    ok = logger:config_logger_console(),
%    logger:info("Connecting to the database..."),
%    connect_to_database(),
%    logger:info("Finished.").