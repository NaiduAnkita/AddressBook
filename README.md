
# Address Book Web Application (JSP-Servlet)

Welcome to the **Address Book Web Application** repository! This project demonstrates a seamless implementation of a dynamic web application built using **JSP (JavaServer Pages)**, **Servlets**, and **JDBC** to manage user contacts. The application provides an intuitive and secure interface for users to organize their contact details, showcasing modern web development concepts, clean code practices, and seamless backend integration.

---

## 🚀 Project Overview

The Address Book application allows users to:

- **Register** and **log in** securely to access their contact list.
- **Add**, **view**, **edit**, and **delete** contacts, including details like name, phone number, email, relation, date of birth, and address.
- Categorize contacts by **relation** (Relatives, Family, Friends, Colleagues, Neighbors) for better organization.
- Assign **address type** (Home, Work, etc.) and mark important contacts as favorites.
- Automatically track and display **birthdays**.
- Utilize **session management** to ensure only logged-in users can access or modify their contacts.
- Interface with a **relational database** via **JDBC** to store and manage user data persistently.

The design is responsive and user-friendly, built with **Bootstrap** to ensure a modern, mobile-friendly experience across all devices.

---

## 💡 Skills and Concepts Implemented

This project highlights the use of several important technologies and concepts:

### 1. **JSP & Servlets (Java EE)**
   - **JSP (JavaServer Pages)**: Used for generating dynamic HTML pages that create a seamless user experience by embedding Java code into HTML.
   - **Servlets**: Responsible for handling HTTP requests and processing business logic for user actions, such as logging in and managing contacts.

### 2. **Database Integration with JDBC**
   - The application is integrated with a **MySQL database** using **JDBC** to store user and contact data persistently.
   - **Prepared Statements** ensure secure interactions with the database to prevent SQL injection and maintain performance.

### 3. **User Authentication and Session Management**
   - User authentication is implemented, with secure login and registration functionality.
   - **HttpSession** is used for session management, ensuring that only authenticated users can access or modify their contacts.

### 4. **Responsive Web Design**
   - The frontend is designed using **Bootstrap**, ensuring the application is responsive and user-friendly across a variety of devices, including mobile and desktop.

### 5. **Clean Code & MVC Architecture**
   - The project follows **clean code** principles, with modular, maintainable code.
   - The **MVC (Model-View-Controller)** architecture is used to separate business logic, data, and user interface for improved code maintainability.

---

## 🧑‍💻 Key Features

- **User Authentication**: Secure registration and login to manage personal contact lists.
- **Contact Management**: Add, view, edit, and delete contacts with details like name, phone number, email, relation, date of birth, and address.
- **Grouping & Categorization**: Organize contacts into groups such as Relatives, Family, Friends, Colleagues, and Neighbors
- **Favorites & Birthdays**: Mark important contacts as favorites and track upcoming birthdays automatically.
- **Session-Based Access**: Ensures users can only view or modify their own contacts.
- **Error Handling & Validation**: Real-time form validation and user feedback for actions like successful login, missing fields, or invalid input.
- **Responsive Design**: Mobile-first, user-friendly interface built using **Bootstrap**.

---

## 🔧 Getting Started

To get started with this project, follow these steps:

1. **Clone the repository**

2. **Import into Eclipse**:
   - Open Eclipse IDE and import the project as a **Dynamic Web Project**.

3. **Configure Database**:
   - Set up a MySQL database on your local machine.
   - Configure the `DbConnect` class to connect to your database (update the database credentials accordingly).

4. **Run the project**:
   - Deploy the project on a servlet container like **Apache Tomcat**.
   - Access the app at `http://localhost:8080/your-project-name`.

---

## 💼 Technologies Used

- **JSP (JavaServer Pages)**
- **Servlets** (Java EE)
- **JDBC** (Java Database Connectivity)
- **MySQL** (Database)
- **Bootstrap** (Frontend design)
- **HTML5, CSS3, JavaScript** (Frontend development)

---

## ✨ Future Enhancements

While this is a fully functional application, there are several potential enhancements to consider for the future:

- **Search Functionality**: Add a feature to search contacts by name, phone number, or email.
- **User Profile Management**: Enable users to update their profile information such as email, password, or profile picture.
- **Secure Password Storage**: Implement password hashing (e.g., bcrypt) to prevent storing plain-text passwords and enhance user data security.
- **Two-Factor Authentication (2FA)**: Add an extra verification step via email or SMS for improved account protection.
- **Import/Export Contacts**: Enable CSV/Excel import and export for easy contact migration.


---

This README is focused on explaining the project, its features, and technical details in a professional manner, providing a clear understanding of the work done and how others can interact with the project.
