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
    <main className="bg-gray-100 py-8">
      
      {/* Header Section */}
      <section className="category-header bg-blue-600 text-white py-8">
        <div className="container mx-auto text-center">
          <h1 className="text-4xl font-bold">Electronics</h1>
          <p className="text-lg mt-2">Discover the best deals on electronics from top brands</p>
          {/* Button to navigate to ElectronicsProducts */}
          <Link to="/electronics-products">
            

          <button
            style={{
              marginTop: '1.5rem',
              padding: '0.75rem 1.5rem',
              color: 'white',
              fontSize: '1rem',
              fontWeight: '500',
              backgroundImage: 'linear-gradient(to right, #3b82f6, #6366f1)',
              borderRadius: '0.5rem',
              boxShadow: '0 4px 6px rgba(0, 0, 0, 0.1)',
              transition: 'transform 200ms ease-in-out, box-shadow 200ms ease-in-out',
              cursor: 'pointer',
              outline: 'none',
              display: 'inline-block',
            }}
            onMouseOver={(e) => {
              e.currentTarget.style.transform = 'scale(1.05)';
              e.currentTarget.style.boxShadow = '0 6px 8px rgba(0, 0, 0, 0.15)';
            }}
            onMouseOut={(e) => {
              e.currentTarget.style.transform = 'scale(1)';
              e.currentTarget.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1)';
            }}
            onMouseDown={(e) => {
              e.currentTarget.style.transform = 'scale(0.98)';
              e.currentTarget.style.boxShadow = 'inset 0 4px 6px rgba(0, 0, 0, 0.15)';
            }}
            onMouseUp={(e) => {
              e.currentTarget.style.transform = 'scale(1)';
              e.currentTarget.style.boxShadow = '0 6px 8px rgba(0, 0, 0, 0.15)';
            }}
          >
            View All Electronics Products
          </button>
          </Link>
        </div>
      </section>

      {/* Brand Cards Section */}
      <section className="container mx-auto px-6 py-12">
        <div className="brand-grid grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
          {brands.map((brand, index) => (
            <div key={index} className="brand-card bg-white rounded-lg shadow-lg overflow-hidden transform transition duration-200 hover:scale-105 focus:scale-105 focus:ring-2 focus:ring-blue-500 cursor-pointer p-4">
              {brand.name === 'Apple' ? ( // Check if the brand is Apple
                <Link to={brand.link}> {/* Wrap in Link component */}
                  <img src={brand.image} alt={brand.name} className="h-24 w-auto mx-auto mb-4" />
                  <h3 className="text-xl font-semibold text-center">{brand.name}</h3>
                  <p className="discount text-blue-500 text-center font-medium mt-2">{brand.discount}</p>
                  <div className="brand-details text-gray-600 mt-4">
                    {brand.details.map((detail, detailIndex) => (
                      <p key={detailIndex} className="text-sm text-center">{detail}</p>
                    ))}
                  </div>
                </Link>
              ) : (
                <div>
                  <img src={brand.image} alt={brand.name} className="h-24 w-auto mx-auto mb-4" />
                  <h3 className="text-xl font-semibold text-center">{brand.name}</h3>
                  <p className="discount text-blue-500 text-center font-medium mt-2">{brand.discount}</p>
                  <div className="brand-details text-gray-600 mt-4">
                    {brand.details.map((detail, detailIndex) => (
                      <p key={detailIndex} className="text-sm text-center">{detail}</p>
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
