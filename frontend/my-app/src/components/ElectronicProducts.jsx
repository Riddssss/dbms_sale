import { useState, useEffect } from 'react';
import axios from 'axios';
import { PlusCircle, Trash2 } from 'lucide-react';

// Separate component for adding a new product
const ProductForm = ({ onAddProduct, newProduct, handleInputChange, errorMessage }) => (
  <div className="form-container">
    <h2>Add a New Product</h2>
    <form onSubmit={onAddProduct} className="form">
      {errorMessage && <div className="error-message">{errorMessage}</div>}
      <div className="input-group">
        <label htmlFor="product_name">Product Name</label>
        <input
          id="product_name"
          name="product_name"
          type="text"
          placeholder="Enter product name"
          value={newProduct.product_name}
          onChange={handleInputChange}
          required
        />
      </div>
      <div className="input-group">
        <label htmlFor="product_id">Product ID</label>
        <input
          id="product_id"
          name="product_id"
          type="number"
          placeholder="Enter product Id"
          value={newProduct.product_id}
          onChange={handleInputChange}
          required
        />
      </div>

      <div className="input-group">
        <label htmlFor="brand">Brand</label>
        <input
          id="brand"
          name="brand"
          type="text"
          placeholder="Enter brand name"
          value={newProduct.brand}
          onChange={handleInputChange}
          required
        />
      </div>

      <div className="input-group">
        <label htmlFor="price">Price</label>
        <input
          id="price"
          name="price"
          type="number"
          placeholder="Enter price"
          value={newProduct.price}
          onChange={handleInputChange}
          required
        />
      </div>

      <div className="input-group">
        <label htmlFor="availability">Availability</label>
        <input
          id="availability"
          name="availability"
          type="text"
          placeholder="Enter availability"
          value={newProduct.availability}
          onChange={handleInputChange}
          required
        />
      </div>
      <button type="submit" className="add-button">
        <PlusCircle className="icon" /> Add Product
      </button>
    </form>
  </div>
);

export default function ElectronicProducts() {
  const [products, setProducts] = useState([]);
  const [newProduct, setNewProduct] = useState({
    product_name: '',
    product_id: '',
    brand: '',
    price: 0,
    availability: ''
  });
  const [selectedBrand, setSelectedBrand] = useState('apple');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  useEffect(() => {
    fetchProducts();
  }, [selectedBrand]);

  const fetchProducts = async () => {
    setLoading(true);
    setError('');
    try {
      const response = await axios.get(`http://localhost:8081/api/products/${selectedBrand}`);
      setProducts(response.data);
    } catch (error) {
      console.error('Error fetching products:', error.response || error.message);
      setError('Failed to fetch products. Please try again later.');
    } finally {
      setLoading(false);
    }
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewProduct((prevState) => ({ ...prevState, [name]: value }));
  };

  const validateForm = () => {
    if (
      !newProduct.product_name ||
      !newProduct.product_id ||
      !newProduct.brand ||
      !newProduct.price ||
      !newProduct.availability
    ) {
      setError('All fields are required.');
      return false;
    }

    if (isNaN(newProduct.price) || newProduct.price <= 0) {
      setError('Price must be a positive number.');
      return false;
    }

    if (isNaN(newProduct.product_id) || newProduct.product_id <= 0) {
      setError('Product ID must be a positive integer.');
      return false;
    }

    return true;
  };

  const addProduct = async (e) => {
    e.preventDefault();
    setError('');
  
    if (!validateForm()) return;
  
    try {
      const newProductData = {
        ...newProduct,
        price: parseFloat(newProduct.price),
        product_id: parseInt(newProduct.product_id),
        // Capitalize brand name to match database
        brand: newProduct.brand.charAt(0).toUpperCase() + newProduct.brand.slice(1).toLowerCase()
      };
  
      const response = await axios.post('http://localhost:8081/api/products', newProductData);
  
      if (response.status === 201) {
        // Reset form
        setNewProduct({
          product_name: '',
          product_id: '',
          brand: '',
          price: 0,
          availability: ''
        });
        // Refresh the product list
        fetchProducts();
      }
    } catch (error) {
      console.error('Error adding product:', error);
      setError(error.response?.data?.error || 'Failed to add product. Please try again.');
    }
  };

  const deleteProduct = async (id) => {
    setError('');
    try {
      await axios.delete(`http://localhost:8081/api/products/${id}`);
      setProducts(products.filter((product) => product.product_id !== id));
    } catch (error) {
      console.error('Error deleting product:', error.response || error.message);
      setError('Failed to delete product. Please try again.');
    }
  };

  return (
    <div className="container">
      <h1 className="heading">Electronic Products Management</h1>

      {/* Display Error if any */}
      {error && <div className="error-message">{error}</div>}

      {/* Product Form Component */}
      <ProductForm
        onAddProduct={addProduct}
        newProduct={newProduct}
        handleInputChange={handleInputChange}
        errorMessage={error}
      />

      {/* Brand Selector and Product List */}
      <div className="product-list-container">
        <h2>Product List</h2>
        <div className="brand-selector">
          <label htmlFor="brand-select">Select Brand</label>
          <select onChange={(e) => setSelectedBrand(e.target.value)} value={selectedBrand}>
            <option value="apple">Apple</option>
            <option value="samsung">Samsung</option>
            <option value="sony">Sony</option>
          </select>
        </div>

        {/* Loading State */}
        {loading ? (
          <p>Loading products...</p>
        ) : (
          <table className="product-table">
            <thead>
              <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Availability</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {products.map((product) => (
                <tr key={product.product_id}>
                  <td>{product.product_name}</td>
                  <td>${product.price}</td>
                  <td>{product.availability}</td>
                  <td className="action-cell">
                    <button onClick={() => deleteProduct(product.product_id)} className="delete-button">
                      <Trash2 className="icon" />
                      Delete
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
}
