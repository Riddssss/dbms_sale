import React, { useEffect, useState } from "react";
import { Route, Routes } from "react-router-dom";
import Header from "./Header";
import Footer from "./Footer";
import Home from "./Home";
import Electronics from "./pages/Electronics";
import Apple from "./pages/Apple";

const App = () => {
  const [users, setUsers] = useState([]);
  const [error, setError] = useState(null); // State to hold any errors

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:8081/user'); // Ensure the URL is correct
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        setUsers(data); // Store the data in state
        console.log(data); // Log the fetched data
      } catch (error) {
        console.error("Failed to fetch:", error);
        setError(error.message); // Set the error message in state
      }
    };

    fetchData();
  }, []); // Empty dependency array means this runs once on mount

  return (
    <div className="app">
      <Header />
      <main>
        {error && <div className="error">Error: {error}</div>} {/* Display any errors */}
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/electronics" element={<Electronics />} />
          <Route path="/apple" element={<Apple />} />
        </Routes>
      </main>
      <Footer />
    </div>
  );
};

export default App;
