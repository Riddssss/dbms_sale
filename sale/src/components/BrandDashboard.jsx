import { useState, useEffect } from 'react'

export default function BrandDashboard({ user }) {
  const [products, setProducts] = useState([])
  const [newProduct, setNewProduct] = useState({ name: '', price: '', category: '' })

  useEffect(() => {
    // Fetch products for this brand
    const fetchProducts = async () => {
      try {
        const response = await fetch(`/api/brand/${user.id}/products`);
        
        if (!response.ok) {
          throw new Error(`Error: ${response.status} - ${response.statusText}`);
        }
  
        const data = await response.json();
        setProducts(data);
      } catch (error) {
        console.error("Failed to fetch products:", error);
      }
    };
  
    fetchProducts();
  }, [user.id]);
  
  const handleAddProduct = async (e) => {
    e.preventDefault();
    
    try {
      const response = await fetch(`/api/brand/${user.id}/products`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(newProduct),
      });
  
      if (!response.ok) {
        throw new Error(`Error: ${response.status} - ${response.statusText}`);
      }
  
      const addedProduct = await response.json();
      setProducts([...products, addedProduct]);
      setNewProduct({ name: '', price: '', category: '' });
    } catch (error) {
      console.error("Failed to add product:", error);
    }
  };

  return (
    <div>
      <h1>Brand Dashboard</h1>
      <form onSubmit={handleAddProduct}>
        <input
          type="text"
          placeholder="Product Name"
          value={newProduct.name}
          onChange={(e) => setNewProduct({ ...newProduct, name: e.target.value })}
        />
        <input
          type="text"
          placeholder="Price"
          value={newProduct.price}
          onChange={(e) => setNewProduct({ ...newProduct, price: e.target.value })}
        />
        <input
          type="text"
          placeholder="Category"
          value={newProduct.category}
          onChange={(e) => setNewProduct({ ...newProduct, category: e.target.value })}
        />
        <button type="submit">Add Product</button>
      </form>
      <ul>
        {products.map(product => (
          <li key={product.id}>{product.name} - ${product.price}</li>
        ))}
      </ul>
    </div>
  );
}
