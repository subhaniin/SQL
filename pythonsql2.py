import mysql.connector

# Connect to MySQL using correct host and port
conn = mysql.connector.connect(
    host="localhost",  # Use "localhost" or "127.0.0.1" instead of "subhani_host"
    user="root",       # Your MySQL username
    password="Sql@3690",  # Replace with your MySQL password
    database="ecom",   # Your database name
    port=3306          # MySQL default port
)

cursor = conn.cursor()
cursor.execute("SHOW TABLES")  # Test connection by listing tables

for table in cursor.fetchall():
    print(table)

cursor.close()
conn.close()
# discussed how to execute queries and fetch results using the cursor object.