using MySql.Data.MySqlClient;

namespace Opdracht;

public class User(string Name = "default", string Email = "default",
    string PhoneNumber = "default", string Password = "default", RoleEnum Role = RoleEnum.Customer)
{
    public int? User_ID { get; set; }
    public string Name { get; set; } = Name;
    public string Email { get; set; } = Email;
    public string PhoneNumber { get; set; } = PhoneNumber;
    public string Password { get; set; } = Password;
    public RoleEnum Role { get; set; } = Role;

    public override string ToString()
    {
        return $"ID: {User_ID}, Name: {Name}, Email: {Email}, PhoneNumber: {PhoneNumber}, Role: {Role}";
    }

    public User? SelectUser(string connectionString, string email)
    {
        string selectQuery = "SELECT * FROM users WHERE Email = @Email";

        using MySqlConnection connection = new(connectionString);
        using MySqlCommand command = new(selectQuery, connection);

        command.Parameters.AddWithValue("@Email", email);

        connection.Open();
        using MySqlDataReader reader = command.ExecuteReader();

        if (reader.Read())
        {
            return new User(
                Name = Convert.ToString(reader["Name"])!,
                Email = Convert.ToString(reader["Email"])!,
                PhoneNumber = Convert.ToString(reader["PhoneNumber"])!,
                Password = Convert.ToString(reader["Password"])!,
                Role = Enum.Parse<RoleEnum>(Convert.ToString(reader["Role"])!)
            )
            {
                User_ID = Convert.ToInt32(reader["User_ID"]),
            };
        }

        return null;
    }


    public bool UpdateUser(string connectionString)
    {
        string UpdateQuery = "UPDATE Users SET Name = @Name, Email = @Email, PhoneNumber = @PhoneNumber, Password = @Password, Role = @Role" +
            " WHERE User_ID = @User_ID";

        using MySqlConnection connection = new(connectionString);
        using MySqlCommand command = new(UpdateQuery, connection);

        command.Parameters.AddWithValue("@Name", Name);
        command.Parameters.AddWithValue("@Email", Email);
        command.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
        command.Parameters.AddWithValue("@Password", Password);
        command.Parameters.AddWithValue("@Role", Role);
        command.Parameters.AddWithValue("@User_ID", User_ID);

        try
        {
            connection.Open();
            int rowsAffected = command.ExecuteNonQuery();
            connection.Close();

            return rowsAffected > 0; // Return true if update was successful
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error updating user: {ex.Message}");
            return false;
        }
    }

    public bool UploadUser(string connectionString)
    {
        string insertQuery = "INSERT INTO Users (Name, Email, PhoneNumber, Password, Role)" +
            "VALUES (@Name, @Email, @PhoneNumber, @Password, @Role)";

        using MySqlConnection connection = new(connectionString);
        using MySqlCommand command = new(insertQuery, connection);

        command.Parameters.AddWithValue("@Name", Name);
        command.Parameters.AddWithValue("@Email", Email);
        command.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
        command.Parameters.AddWithValue("@Password", Password);
        command.Parameters.AddWithValue("@Role", Role.ToString());

        try
        {
            connection.Open();
            int rowsAffected = command.ExecuteNonQuery();
            connection.Close();

            return rowsAffected > 0; // Return true if update was successful
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error uploading user: {ex.Message}");
            return false;
        }
    }

    public async Task SaveToLocalStorage(ProtectedLocalStorage BrowserStorage)
    {
        await BrowserStorage.SetAsync("name", this);
    }
    public static async Task<User?> LoadFromLocalStorage(ProtectedLocalStorage BrowserStorage)
    {
        var result = await BrowserStorage.GetAsync<User>("name");
        return result.Success ? result.Value : null;
    }
    public static async Task DeleteFromLocalStorage(ProtectedLocalStorage BrowserStorage)
    {
        await BrowserStorage.DeleteAsync("name");
    }
}
