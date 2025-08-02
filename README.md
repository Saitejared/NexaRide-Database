# 🚍 NexaRide Bus Booking MySQL Database

NexaRide is a comprehensive **bus ticket booking system** built with a well-structured **MySQL database schema**. It supports everything from user registrations to complex booking flows including one-way, two-way, and tourism journeys — all backed by payment and ticket management.

---

## 📘 About This Project

This project demonstrates practical and industry-ready database design skills using:

- **Entity-Relationship Modeling**  
- **Normalization & Referential Integrity**  
- **ENUM usage for better data categorization**  
- **Sample SQL data & queries**

---

## 🧱 Key Entities & Relationships

| Entity     | Description |
|------------|-------------|
| `Users`    | Stores user information |
| `Bookings` | Represents a booking (linked to users, passengers, and payments) |
| `Passengers` | Each booking can include multiple passengers |
| `Payments` | Linked one-to-one with each booking |
| `Tickets`  | Generated for each passenger |

🔗 **Relationship Summary**:
- `Users` → `Bookings`: One-to-Many  
- `Bookings` → `Passengers`: One-to-Many  
- `Bookings` → `Payments`: One-to-One  
- `Passengers` → `Tickets`: One-to-One  
- `Bookings` → `Tickets`: One-to-Many

---

## ✨ Features

- 👤 **User Management**  
  Register and manage multiple user accounts.

- 🎫 **Flexible Booking Types**  
  One-way, two-way, and tourism bookings with clear `booking_type` classification.

- 🧍 **Passenger Details**  
  Add one or more passengers per booking — each with unique identity fields.

- 💳 **Secure Payment Integration**  
  Tracks payment mode, amount, and success status per booking.

- 🧾 **Ticket Issuance**  
  Automatically generates tickets per passenger including seat number and timestamp.

- 📊 **ER Diagram**  
  An ER diagram is included to visually represent the entire database structure.  
  

---

## 🛠 Tools and Technologies

| Tool | Purpose |
|------|---------|
| **MySQL 8.x** | Database engine |
| **MySQL Workbench / ERDPlus** | Design and ER diagram |
| **GitHub** | Hosting and version control |
| Java | For integration with backend systems |
