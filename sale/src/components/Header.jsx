import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";

const Header = () => {
  const [darkMode, setDarkMode] = useState(false);

  useEffect(() => {
    const storedDarkMode = localStorage.getItem("darkMode") === "enabled";
    setDarkMode(storedDarkMode);
    if (storedDarkMode) {
      document.body.classList.add("dark-mode");
    }
  }, []);

  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
    document.body.classList.toggle("dark-mode");
    localStorage.setItem("darkMode", !darkMode ? "enabled" : "disabled");
  };

  return (
    <header>
      <nav className="container">
        <Link to="/" className="logo">
          Saler
        </Link>
        <ul className="nav-links">
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/electronics">Electronics</Link>
          </li>
          <li>
            <Link to="/">Brands</Link>
          </li>
          <li>
            <Link to="/">About</Link>
          </li>
        </ul>
        <button className="toggle-dark-mode" onClick={toggleDarkMode}>
          Toggle Dark Mode
        </button>
      </nav>
    </header>
  );
};

export default Header;
