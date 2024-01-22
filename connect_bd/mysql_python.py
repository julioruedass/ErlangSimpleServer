import pyodbc

def connect_to_database():
    # Replace 'MSSQLTestDSN' with your actual DSN
    dsn = 'MSSQLTestDSN'

    try:
        # Establish connection using the DSN
        connection = pyodbc.connect('DSN=' + dsn)
        
        # Check if the connection is successful
        if connection:
            print("Connection successful!")

            # Perform any database operations here if needed

            # Close the connection when done
            connection.close()
            print("Connection closed.")
        
    except pyodbc.Error as e:
        print("Connection failed. Error: {}".format(e))

if __name__ == "__main__":
    connect_to_database()