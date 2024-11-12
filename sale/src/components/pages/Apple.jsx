import React from 'react';

import ip13Image from '../assets/ip13.webp';
import mbairImage from '../assets/mbair.png';
import ipadImage from '../assets/ipad.jpeg';
import awachImage from '../assets/awach.jpeg';
import airpodsImage from '../assets/airpods.webp';
import imacImage from '../assets/imac.jpg';
import macMiniImage from '../assets/apple-mac-mini-500x500.webp';
import ipadProImage from '../assets/ipadpro.jpg';

const appleProducts = [
  { name: 'iPhone 13 Pro', image: ip13Image, price: 999, originalPrice: 1099, discount: '9% OFF', description: 'A15 Bionic chip, Pro camera system, 5G capable' },
  { name: 'MacBook Air (M1)', image: mbairImage, price: 899, originalPrice: 999, discount: '10% OFF', description: 'Apple M1 chip, 13-inch Retina display, Up to 18 hours battery life' },
  { name: 'iPad Air', image: ipadImage, price: 549, originalPrice: 599, discount: '8% OFF', description: '10.9-inch Liquid Retina display, A14 Bionic chip, Touch ID' },
  { name: 'Apple Watch Series 7', image: awachImage, price: 349, originalPrice: 399, discount: '12% OFF', description: 'Always-On Retina display, ECG app, Blood Oxygen app' },
  { name: 'AirPods Pro', image: airpodsImage, price: 199, originalPrice: 249, discount: '20% OFF', description: 'Active Noise Cancellation, Transparency mode, Adaptive EQ' },
  { name: 'iMac 24-inch', image: imacImage, price: 1249, originalPrice: 1299, discount: '4% OFF', description: '4.5K Retina display, Apple M1 chip, 1080p FaceTime HD camera' },
  { name: 'Mac mini', image: macMiniImage, price: 649, originalPrice: 699, discount: '7% OFF', description: 'Apple M1 chip, 8-core CPU, 8-core GPU, 16-core Neural Engine' },
  { name: 'iPad Pro', image: ipadProImage, price: 749, originalPrice: 799, discount: '6% OFF', description: 'M1 chip, Liquid Retina XDR display, 5G capable' },
];
const Apple = () => {
  return (
    <main>
      <section className="brand-header">
        <div className="container">
          <h1>Apple Sales</h1>
          <p>Discover amazing deals on Apple products</p>
        </div>
      </section>

      <section className="container">
        <div className="product-grid">
          {appleProducts.map((product, index) => (
            <div key={index} className="product-card">
              <img src={product.image} alt={product.name} />
              <h3>{product.name}</h3>
              <p className="price">
                ${product.price}{' '}
                <span className="original-price">${product.originalPrice}</span>{' '}
                <span className="discount">{product.discount}</span>
              </p>
              <p className="description">{product.description}</p>
    
            </div>
          ))}
        </div>
      </section>
    </main>
  );
};

export default Apple;
