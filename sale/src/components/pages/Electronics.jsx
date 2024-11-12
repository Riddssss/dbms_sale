import React from 'react';
import { Link } from 'react-router-dom'; // Import the Link component

// Import images from the assets folder
import appleImage from '../assets/Apple-Logo.png';
import samsungImage from '../assets/sam.png';
import sonyImage from '../assets/Sony-logo.png';
import lgImage from '../assets/LG_logo_(2014).svg.png';

const brands = [
  { name: 'Apple', image: appleImage, discount: 'Up to 30% OFF', details: ['Free shipping on orders over $100', 'Limited time offer on latest iPhone models'], link: "/Apple" },
  { name: 'Samsung', image: samsungImage, discount: 'Up to 40% OFF', details: ['Free Galaxy Buds with select phones', 'Special discounts on QLED TVs'] },
  { name: 'Sony', image: sonyImage, discount: 'Up to 35% OFF', details: ['Extra 10% OFF for students', 'Bundle deals on PlayStation consoles'] },
  { name: 'LG', image: lgImage, discount: 'Up to 25% OFF', details: ['Free installation on select TVs', 'Cashback offers on refrigerators'] },
];

export default function Electronics() {
  return (
    <main>
      <section className="category-header">
        <div className="container">
          <h1>Electronics</h1>
          <p>Discover the best deals on electronics from top brands</p>
        </div>
      </section>

      <section className="container">
        <div className="brand-grid">
          {brands.map((brand, index) => (
            <div key={index} className="brand-card" tabIndex={0}>
              {brand.name === 'Apple' ? ( // Check if the brand is Apple
                <Link to={brand.link}> {/* Wrap in Link component */}
                  <img src={brand.image} alt={brand.name} />
                  <h3>{brand.name}</h3>
                  <p className="discount">{brand.discount}</p>
                  <div className="brand-details">
                    {brand.details.map((detail, detailIndex) => (
                      <p key={detailIndex}>{detail}</p>
                    ))}
                  </div>
                </Link>
              ) : (
                <div>
                  <img src={brand.image} alt={brand.name} />
                  <h3>{brand.name}</h3>
                  <p className="discount">{brand.discount}</p>
                  <div className="brand-details">
                    {brand.details.map((detail, detailIndex) => (
                      <p key={detailIndex}>{detail}</p>
                    ))}
                  </div>
                </div>
              )}
            </div>
          ))}
        </div>
      </section>
    </main>
  );
}
