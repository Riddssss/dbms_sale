'use client'

import { useState } from 'react'
import { useNavigate } from 'react-router-dom'

export default function LoginPortal({ setUser }) {
  const [isUser, setIsUser] = useState(true)
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const navigate = useNavigate()

  const handleSubmit = async (e) => {
    e.preventDefault()
    
    try {
      // Simulating an API call
      const userData = { id: 1, email, type: isUser ? 'user' : 'brand' }
      // Here you would replace with an actual API call
      // const response = await fetch('/api/login', { method: 'POST', body: JSON.stringify({ email, password }) });
      // const data = await response.json();
      // setUser(data); // Assuming data contains the user information
      setUser(userData)
      navigate(isUser ? '/user-dashboard' : '/brand-dashboard')
    } catch (error) {
      console.error("Login failed:", error);
      alert("Login failed. Please try again.");
    }
  }

  return (
    <div className="flex items-center justify-center min-h-screen bg-gradient-to-r from-blue-400 to-purple-500">
      <div className="w-full max-w-md bg-white rounded-lg shadow-lg p-6">
        <h2 className="text-2xl font-bold text-center">Login to your account</h2>
        <p className="text-center text-gray-600">Enter your email below to login to your account</p>
        <form onSubmit={handleSubmit} className="space-y-4 mt-4">
          <div className="space-y-2">
            <label htmlFor="email" className="block text-sm font-medium text-gray-700">Email</label>
            <input
              id="email"
              type="email"
              placeholder="m@example.com"
              required
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="mt-1 block w-full border border-gray-300 rounded-md p-2 focus:border-blue-500 focus:ring focus:ring-blue-200"
            />
          </div>
          <div className="space-y-2">
            <label htmlFor="password" className="block text-sm font-medium text-gray-700">Password</label>
            <input
              id="password"
              type="password"
              required
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="mt-1 block w-full border border-gray-300 rounded-md p-2 focus:border-blue-500 focus:ring focus:ring-blue-200"
            />
          </div>
          <button type="submit" className="w-full bg-blue-500 text-white py-2 rounded-md hover:bg-blue-600 transition">
            Login
          </button>
        </form>
        <div className="flex flex-col items-center w-full mt-4">
          <button 
            className="w-full border border-gray-300 bg-transparent text-gray-700 py-2 rounded-md hover:bg-gray-100 transition"
            onClick={() => setIsUser(!isUser)}
          >
            Switch to {isUser ? 'Brand' : 'User'} Login
          </button>
          <p className="text-sm text-gray-600 mt-2">
            Don't have an account? <a href="https://localhost:3000" className="underline text-blue-500">Sign up</a>
          </p>
        </div>
      </div>
    </div>
  )
}
