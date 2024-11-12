import React from "react";
import { Link } from "react-router-dom";

const Footer = () => {
  return (
    <footer>
      <div className="container">
        <div className="footer-content">
          <div className="footer-section">
            <h3>Saler</h3>
            <p>Discover the best ongoing sales from top brands.</p>
          </div>
          <div className="footer-section">
            <h3>Quick Links</h3>
            <ul>
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
                <Link to="/">About Us</Link>
              </li>
            </ul>
          </div>
          <div className="footer-section">
            <h3>Contact Us</h3>
            <p>Email: info@saler.com</p>
            <p>Phone: (123) 456-7890</p>
          </div>
        </div>
        <div className="footer-bottom">
          <p>&copy; 2024 Saler. All rights reserved.</p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
