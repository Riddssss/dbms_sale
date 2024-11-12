import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import nikeImage from './assets/nike.webp';
import appleImage from './assets/Apple-Logo.png';
import samsungImage from './assets/sam.png';
import adidasImage from './assets/Adidas_Logo.svg';
import sonyImage from './assets/Sony-logo.png';
import electronicsImage from './assets/elec.jpg';
import clothesImage from './assets/clothes.png';
import sportsImage from './assets/football.jpg';
import foodImage from './assets/339242693.jpg';

const brands = [
  { name: 'Nike', discount: '50% OFF', image: nikeImage },
  { name: 'Apple', discount: '30% OFF', image: appleImage },
  { name: 'Samsung', discount: '40% OFF', image: samsungImage },
  { name: 'Adidas', discount: '45% OFF', image: adidasImage },
  { name: 'Sony', discount: '35% OFF', image: sonyImage },
];


const categories = [
  { name: 'Electronics', image: electronicsImage, link: '/electronics' },
  { name: 'Clothes', image: clothesImage, link: '/clothes' },
  { name: 'Sports', image: sportsImage, link: '/sports' },
  { name: 'Food', image: foodImage, link: '/food' },
];
const Home = () => {
  const [currentIndex, setCurrentIndex] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentIndex((prevIndex) => (prevIndex + 1) % brands.length);
    }, 5000);
    return () => clearInterval(interval);
  }, []);

  const showSlide = (index) => {
    setCurrentIndex(index);
  };

  return (
    <>
      <section className="hero container">
        <h1>Welcome to Saler</h1>
        <p>Discover the Best Ongoing Sales from Top Brands</p>
      </section>

      <section className="carousel container">
        <div className="carousel-inner" style={{ transform: `translateX(-${currentIndex * 100}%)` }}>
          {brands.map((brand, index) => (
            <div key={index} className="carousel-item">
              <div className="brand-card">
                <img src={brand.image} alt={brand.name} />
                <h3>{brand.name}</h3>
                <p>{brand.discount}</p>
              </div>
            </div>
          ))}
        </div>
        <button className="carousel-btn carousel-btn-prev" onClick={() => showSlide((currentIndex - 1 + brands.length) % brands.length)}>&lt;</button>
        <button className="carousel-btn carousel-btn-next" onClick={() => showSlide((currentIndex + 1) % brands.length)}>&gt;</button>
      </section>

      <section className="categories">
        <div className="container">
          <h2>Shop by Category</h2>
          <div className="category-grid">
            {categories.map((category, index) => (
              <Link key={index} to={category.link} className="category">
                <img src={category.image} alt={category.name} />
                <h3>{category.name}</h3>
              </Link>
            ))}
          </div>
        </div>
      </section>
    </>
  );
};

export default Home;
