
namespace Opdracht;
public class ConnectionString
{
    public string connectionString = new MySqlConnectionStringBuilder
    {
        Server = "localhost",
        Port = 3307,
        Database = "hoteldertuin",
        UserID = "root",
        Password = ""
    }.ToString();
}
