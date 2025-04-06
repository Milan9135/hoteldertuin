using System.Data;
using System.Xml.Linq;

namespace Opdracht;

public class UserService
{
    private readonly ProtectedLocalStorage _protectedLocalStorage;

    // To store the current user data
    public static User? CurrentUser { get; private set; }

    // Constructor to inject ProtectedLocalStorage
    public UserService(ProtectedLocalStorage protectedLocalStorage)
    {
        _protectedLocalStorage = protectedLocalStorage;
        LoadUserAsync();
    }

    // Load user data from ProtectedLocalStorage
    public async Task LoadUserAsync()
    {
        var user = await User.LoadFromLocalStorage(_protectedLocalStorage);
        CurrentUser = user; // Set the CurrentUser in UserService
    }

    // Set the user in the ProtectedLocalStorage and the service
    public async Task LoginAsync(User user)
    {
        await user.SaveToLocalStorage(_protectedLocalStorage);
        CurrentUser = user;
    }

    // Clear the user data from ProtectedLocalStorage
    public async Task LogoutAsync()
    {
        await User.DeleteFromLocalStorage(_protectedLocalStorage);
        CurrentUser = null;
    }
    public bool CheckIfEmailExists(string connectionString, string email)
    {
        string query = "SELECT COUNT(*) FROM users WHERE Email = @Email";

        using MySqlConnection connection = new(connectionString);
        using MySqlCommand command = new(query, connection);

        command.Parameters.AddWithValue("@Email", email);

        connection.Open();
        int count = Convert.ToInt32(command.ExecuteScalar()); // Get the number of matches
        connection.Close();

        return count > 0; // Returns true if email exists
    }


}
