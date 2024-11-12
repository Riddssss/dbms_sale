'use client'

import { useState, useEffect } from 'react'

export default function UserDashboard({ user }) {
  const [userData, setUserData] = useState(null)
  const [isEditing, setIsEditing] = useState(false)
  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [phone, setPhone] = useState('')
  const [dob, setDob] = useState('')
  const [location, setLocation] = useState('')

  useEffect(() => {
    const fetchUserData = async () => {
      try {
        const response = await fetch(`/api/user/${user.id}`)
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json()
        setUserData(data)
        setName(data.name)
        setEmail(data.email)
        setPhone(data.phone_number)
        setDob(data.dob)
        setLocation(data.location)
      } catch (error) {
        console.error("Failed to fetch user data:", error);
      }
    }
    fetchUserData()
  }, [user.id])

  const handleSubmit = async (e) => {
    e.preventDefault()
    try {
      await fetch(`/api/user/${user.id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name, email, phone_number: phone, dob, location }),
      })
      setIsEditing(false)
    } catch (error) {
      console.error("Failed to update user data:", error);
    }
  }

  const handleDelete = async () => {
    try {
      await fetch(`/api/user/${user.id}`, { method: 'DELETE' })
      // Redirect to login page or handle logout
    } catch (error) {
      console.error("Failed to delete account:", error);
    }
  }

  if (!userData) return <div>Loading...</div>

  return (
    <div className="container mx-auto mt-10">
      <h1 className="text-2xl font-bold mb-5">User Dashboard</h1>
      {isEditing ? (
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label htmlFor="name" className="block">Name</label>
            <input
              id="name"
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
            />
          </div>
          <div>
            <label htmlFor="email" className="block">Email</label>
            <input
              id="email"
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
            />
          </div>
          <div>
            <label htmlFor="phone" className="block">Phone</label>
            <input
              id="phone"
              type="tel"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
            />
          </div>
          <div>
            <label htmlFor="dob" className="block">Date of Birth</label>
            <input
              id="dob"
              type="date"
              value={dob}
              onChange={(e) => setDob(e.target.value)}
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
            />
          </div>
          <div>
            <label htmlFor="location" className="block">Location</label>
            <input
              id="location"
              type="text"
              value={location}
              onChange={(e) => setLocation(e.target.value)}
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
            />
          </div>
          <button type="submit" className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
            Save Changes
          </button>
        </form>
      ) : (
        <div>
          <p><strong>Name:</strong> {userData.name}</p>
          <p><strong>Email:</strong> {userData.email}</p>
          <p><strong>Phone:</strong> {userData.phone_number}</p>
          <p><strong>Date of Birth:</strong> {userData.dob}</p>
          <p><strong>Location:</strong> {userData.location}</p>
          <button
            onClick={() => setIsEditing(true)}
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mt-4"
          >
            Edit Profile
          </button>
        </div>
      )}
      <button
        onClick={handleDelete}
        className="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-4"
      >
        Delete Account
      </button>
    </div>
  )
}
