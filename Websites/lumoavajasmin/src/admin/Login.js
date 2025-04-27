import { useState } from "react";

export default function Login({ setIsAuthenticated }) {
  const [credentials, setCredentials] = useState({ username: "", password: "" });
  const [error, setError] = useState("");

  const handleChange = (e) => {
    setCredentials({ ...credentials, [e.target.name]: e.target.value });
  };

  const [isLoading, setIsLoading] = useState(false);

const handleSubmit = async (e) => {
  e.preventDefault();
  setIsLoading(true);
  
  try {
    const response = await fetch("http://localhost:8000/login.php", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(credentials),
    });

    const result = await response.json();
    if (result.status === "success") {
      setIsAuthenticated(true);
    } else {
      setError(result.message);
    }
  } catch (error) {
    setError("An error occurred: " + error.message);
  } finally {
    setIsLoading(false);
  }
};

return (
  <div>
    <h2>SL-Health Login</h2>
    {error && <p>{error}</p>}
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        name="username"
        placeholder="Username"
        onChange={handleChange}
        required
      />
      <input
        type="password"
        name="password"
        placeholder="Password"
        onChange={handleChange}
        required
      />
      <button type="submit" disabled={isLoading}>
        {isLoading ? "Logging in..." : "Login"}
      </button>
    </form>
  </div>
);
}