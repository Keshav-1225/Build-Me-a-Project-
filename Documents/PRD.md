# Product Requirements Document (PRD)

## 1. Product Overview

### Product Name
**Build Me A Project**

### Product Type
Academic Web Application / Project Marketplace Prototype

### Product Summary

**Build Me A Project** is a web-based platform where users can discover, purchase, sell, and request software projects.

The platform connects two primary types of users:

1. **Buyers / Clients** — Users who need a software project and either want to purchase an existing project or post a request for a custom project.
2. **Sellers / Developers** — Users who have developed projects and want to publish them for free or sell them to other users.

An **Administrator** manages users, projects, reports, and announcements.

The application is intentionally designed as a **basic functional prototype for an academic project**. Its objective is to demonstrate web application development, database connectivity, authentication, authorization, and CRUD operations rather than implement a production-ready commercial marketplace.

---

# 2. Problem Statement

Students and developers often create projects for learning, college assignments, portfolios, and experimentation. However, there is no simple centralized platform in this project where users can:

- Find existing software projects.
- Search projects based on technology or category.
- Purchase an existing project.
- Request a custom project.
- Allow developers to respond to project requests.
- Publish their own projects for other users.
- Manage their projects and sales.
- Report inappropriate projects or users.

**Build Me A Project** aims to provide a simple platform that brings these activities together.

---

# 3. Product Goals

The primary goals of the prototype are:

- Create a functional project marketplace.
- Allow users to register and authenticate.
- Allow users to browse and search projects.
- Allow users to purchase projects.
- Allow users to become sellers.
- Allow sellers to add, edit, and delete projects.
- Allow users to post project requirements.
- Allow sellers to submit proposals for requests.
- Allow users to interact through basic messages.
- Allow administrators to manage users and projects.
- Demonstrate complete **CRUD operations** using a database.
- Demonstrate the use of **VB.NET as the backend programming language**.
- Demonstrate role-based access between normal users and administrators.

---

# 4. Target Audience

## 4.1 Primary Audience — Students

Students looking for:

- College projects.
- Mini-projects.
- Final-year project ideas.
- Reference implementations.
- Projects using specific technologies.

Example:

> A student needs a Python + AI/ML project and wants to find an existing project instead of developing one completely from scratch.

---

## 4.2 Developers / Sellers

Students, freelancers, and beginner developers who:

- Have already created projects.
- Want to showcase their work.
- Want to sell their projects.
- Want to find clients requiring custom projects.

Example:

> A developer has created a React e-commerce project and wants to list it on Build Me A Project for ₹499.

---

## 4.3 Clients / Buyers

Users who need a custom software project and want developers to build it according to their requirements.

Example:

> A client requires a web application using React and Node.js and has a budget of ₹5,000. They can create a project request and receive proposals from developers.

---

## 4.4 Administrator

The administrator is responsible for basic platform management, including:

- Managing users.
- Managing projects.
- Reviewing reports.
- Hiding inappropriate projects.
- Banning users.
- Sending announcements.

---

# 5. User Roles

The system contains two primary application roles.

### User

A registered user can:

- Browse projects.
- Purchase projects.
- Post project requests.
- Show interest in requests.
- Submit proposals after becoming a seller.
- Send messages.
- Manage notifications.
- Manage their profile.

A user can also become a seller through the **Become a Seller** functionality.

### Admin

An administrator can:

- View dashboard statistics.
- Manage users.
- Manage projects.
- View and resolve reports.
- Hide/remove projects.
- Ban users.
- Send announcements.

---


# 7. Core Features

## 7.1 Home Page

The home page is the main public landing page.

It will contain:

- Build Me A Project branding.
- Navigation bar.
- Search projects.
- Explore Projects.
- Post a Request.
- Popular Categories.
- Featured Projects.
- Call-to-action section.
- Footer.

### Popular Categories

The prototype will support categories such as:

- Web Development
- App Development
- Python
- AI/ML
- Java
- Other technologies

---

# 8. Authentication

## Registration

Users can create an account using:

- Name
- Email
- Username
- Contact Number
- Password
- Confirm Password

The backend validates the submitted information before storing the user.

## Login

Users can log in using:

- Email/Username
- Password

After successful authentication, the application creates a session.

### Authorization

The system distinguishes between:

- Normal users
- Administrators

Unauthorized users should not be able to access protected dashboard functionality.

---

# 9. Project Marketplace

The marketplace is the central feature of the application.

## Explore Projects

Users can browse available projects.

Each project card may display:

- Project image/screenshots
- Project title
- Short description
- Technology stack
- Rating
- Price
- Free/Paid status

---

## Search and Filtering

Users can search projects and apply basic filters:

- Category
- Technology
- Rating
- Price range
- Free/Paid
- Sorting

The prototype should keep filtering simple and database-driven.

---

# 10. Project Details

A project details page provides complete information about a selected project.

Information includes:

- Project title
- Description
- Technology stack
- Screenshots/gallery
- Setup instructions
- Execution steps
- Seller information
- Rating
- Price

The user can select:

**Buy Now**

for a paid project.

---

# 11. Seller Functionality

Registered users can choose to become sellers.

## Become a Seller

The user submits the required seller information.

After becoming a seller, additional seller functionality becomes available.

---

## Seller Dashboard

The seller dashboard contains:

- Dashboard
- My Projects
- Add Project
- Sales
- Earnings
- Project Requests
- My Pitches
- Messages
- Notifications
- Settings

The dashboard provides basic statistics such as:

- Number of projects
- Sales
- Earnings
- Project requests

---

# 12. Project Management

Sellers can manage their own projects.

## Create

A seller can add a project containing information such as:

- Title
- Description
- Technology stack
- Category
- Price
- Screenshots
- Setup instructions
- Execution steps

---

## Read

The seller can view their projects from **My Projects**.

---

## Update

The seller can edit an existing project.

---

## Delete

The seller can delete an existing project.

---

## CRUD Requirement

**CRUD operations are a mandatory requirement of this project.**

CRUD stands for:

| Operation | Example |
|---|---|
| Create | Add a new project |
| Read | View projects |
| Update | Edit project details |
| Delete | Delete a project |

CRUD should also be demonstrated for other appropriate entities such as users, requests, notifications, and reports.

---

# 13. Project Requests

Users who cannot find a suitable project can create a project request.

A request can contain:

- Topic/title
- Description
- Required technology stack
- Budget
- Additional requirements

The request is then displayed in the **Project Requests** section.

---

# 14. Seller Pitches

Sellers can view available project requests and submit a pitch.

A pitch contains:

- Proposed price
- Estimated completion time
- Proposal/message
- Seller information
- Seller rating

The client can:

- View pitches.
- Accept a pitch.
- Reject a pitch.

For the prototype, accepting a pitch does not need to initiate a complex automated contract or payment system.

---

# 15. Orders and Purchases

Users can purchase listed projects.

The order page displays:

- Selected project
- Price
- Coupon
- Subtotal
- Discount
- Total

The user can:

- Apply a coupon.
- Proceed with the transaction.
- Cancel the transaction.

### Prototype Payment Scope

The project will use a **simulated payment flow** rather than implementing a production payment gateway.

After a successful simulated transaction, an order confirmation page displays:

- Project title
- Amount
- Order details
- Purchase information

This keeps the project within the scope of a basic academic prototype.

---

# 16. User Dashboard

A registered user has access to:

- Dashboard
- Purchases
- Requests
- Messages
- Notifications
- Profile

The dashboard provides a central location for managing user activities.

---

# 17. Messaging

The prototype will include a basic messaging system.

Users can:

- View conversations.
- Select a conversation.
- Send messages.
- Read received messages.

### Prototype Limitation

Messaging will be database-based.

Real-time communication using WebSockets, Socket.IO, SignalR, etc. is **not required**.

---

# 18. Notifications

Users can view notifications such as:

- Project purchase confirmation.
- Project updates.
- Messages.
- System announcements.

Users can:

- Open notifications.
- Mark notifications as read.
- Delete notifications.
- Mark all notifications as read.
- Delete all notifications.

---

# 19. Admin Dashboard

The administrator receives a separate dashboard.

The dashboard displays basic statistics:

- Number of users.
- Number of projects.
- Number of orders.
- Number of reports.
- Recent activity.

---

# 20. Admin User Management

The administrator can view registered users.

Information includes:

- User ID
- Name
- Email
- Status
- Role

Admin actions include:

- Ban user.
- Delete user.
- View user information.

These operations provide another important demonstration of CRUD functionality.

---

# 21. Admin Project Management

The administrator can view all projects.

The admin can:

- Search projects.
- View project status.
- Hide projects.
- Remove projects.

Example statuses:

- Visible
- Hidden

---

# 22. Reports

Users can report inappropriate:

- Projects
- Users
- Messages

The administrator can view reports containing:

- Reporter
- Reported user
- Project/message
- Reason
- Date
- Status

Admin actions include:

- View report.
- Resolve report.
- Hide project.
- Ban user.

---

# 23. Admin Announcements

The administrator can send basic announcements.

The admin can select an audience:

- All users
- Buyers
- Sellers
- Selected users

An announcement contains:

- Title
- Message
- Audience

The announcement appears in users' notifications.

---

# 24. Main Application Pages

Based on the provided wireframe, the prototype will contain the following major pages.

### Public Pages

- Home
- Explore Projects
- Project Details
- Login
- Register
- Seller Profile
- Project Requests

### User Pages

- User Dashboard
- Purchases
- Requests
- Messages
- Notifications
- Profile
- Become a Seller

### Seller Pages

- Seller Dashboard
- My Projects
- Add Project
- Edit Project
- Sales
- Earnings
- Project Requests
- My Pitches
- Messages
- Notifications
- Settings

### Admin Pages

- Admin Dashboard
- Manage Users
- Manage Projects
- Reports
- Notifications/Announcements

---

# 25. Database CRUD Requirements

CRUD functionality is a **mandatory project requirement**.

The application should demonstrate database operations using VB.NET and ADO.NET.

### Example: Projects

**Create**

Seller creates a new project.

**Read**

Users view projects from the marketplace.

**Update**

Seller modifies project information.

**Delete**

Seller removes their project.

### Other CRUD Examples

**Users**

- Create — Registration
- Read — Admin views users
- Update — User/profile/status changes
- Delete — Admin deletes user

**Project Requests**

- Create — User posts request
- Read — Sellers view requests
- Update — User edits request
- Delete — User deletes request

**Notifications**

- Create — System/admin creates notification
- Read — User views notification
- Update — Mark as read
- Delete — User deletes notification

---

# 26. Backend Architecture

The basic application flow will be:

```text
User
  ↓
ASP.NET Web Forms UI
  ↓
VB.NET Code-Behind
  ↓
ADO.NET
  ↓
MS Access 2007 Database
```

Example:

```text
Add Project Form
       ↓
ASP.NET Web Forms
       ↓
VB.NET validation
       ↓
SQL INSERT
       ↓
MS Access Database
       ↓
Project appears in My Projects
```

Similarly:

```text
Edit Project
       ↓
VB.NET
       ↓
SQL UPDATE
       ↓
MS Access
```

and:

```text
Delete Project
       ↓
VB.NET
       ↓
SQL DELETE
       ↓
MS Access
```

---

# 27. Authentication and Authorization

The prototype will implement basic:

### Authentication

Determines:

> "Who is the user?"

Implemented using:

- Login form
- Registration form
- Session management

### Authorization

Determines:

> "What is the user allowed to access?"

Examples:

- Normal users cannot access the Admin Dashboard.
- Sellers can manage their own projects.
- Users cannot edit another seller's project.
- Only administrators can ban users or hide projects.

---

# 28. Non-Functional Requirements

Because this is a basic academic prototype, the non-functional requirements will remain limited.

### Usability

- Simple navigation.
- Responsive interface.
- Clear forms.
- Consistent design.

### Performance

The application should provide reasonable response times for a small database and academic demonstration environment.

### Security

The prototype should implement basic:

- Password validation.
- Session management.
- Role-based authorization.
- Server-side input validation.

### Maintainability

The application should keep:

- UI
- VB.NET code
- Database operations

reasonably organized so that the project can be understood and demonstrated easily.

---

# 29. Features Explicitly Out of Scope

To keep the project a **basic prototype**, the following advanced functionality is not required:

- AI-powered project recommendations.
- AI project generation.
- Real-time chat.
- Video calls.
- Advanced search algorithms.
- Machine-learning recommendation systems.
- Production payment gateway integration.
- Cloud deployment.
- AWS/Azure infrastructure.
- Microservices.
- REST API architecture.
- Complex payment escrow.
- Automated project delivery infrastructure.
- Advanced seller verification.
- Social login integration.
- Advanced analytics.
- Multi-language support.
- Enterprise-level security.
- Blockchain or cryptocurrency payments.

These features may be considered for a future version but are not part of the current academic prototype.

---

# 30. Minimum Viable Product (MVP)

The minimum working version must include:

1. User registration.
2. User login/logout.
3. User/Admin authorization.
4. Home page.
5. Project marketplace.
6. Project search/filtering.
7. Project details.
8. Become a Seller.
9. Add Project.
10. View Projects.
11. Edit Project.
12. Delete Project.
13. Project Requests.
14. Seller Pitches.
15. Basic purchase/order flow.
16. User dashboard.
17. Seller dashboard.
18. Admin dashboard.
19. Admin user management.
20. Admin project management.
21. Reports.
22. Notifications.
23. Basic messaging.
24. **CRUD operations using the database.**
25. **VB.NET backend implementation.**

---

# 31. Success Criteria

The prototype will be considered successful when:

- A new user can register and log in.
- The system can distinguish between users and administrators.
- A user can become a seller.
- A seller can create a project.
- Projects are stored in MS Access.
- Projects can be displayed from the database.
- A seller can edit their project.
- A seller can delete their project.
- Users can search and view projects.
- Users can create project requests.
- Sellers can submit pitches.
- Users can view purchases/orders.
- Admins can manage users.
- Admins can manage projects.
- Admins can handle reports.
- Notifications can be created and managed.
- CRUD operations are demonstrably implemented.
- Core backend functionality is written in **VB.NET**.

---

# 32. Final Technical Scope

| Component | Technology |
|---|---|
| Frontend | ASP.NET Web Forms |
| UI | HTML5, CSS3, Tailwind CSS |
| Client-side scripting | JavaScript |
| Backend | ASP.NET Web Forms |
| Backend Language | **VB.NET** |
| Database | **Microsoft Access 2007 (.accdb)** |
| Database Connectivity | ADO.NET |
| Authentication | ASP.NET Session-based authentication |
| Authorization | Role-based authorization |
| Architecture | Basic Web Forms application |
| Deployment | Local/college demonstration environment |

---

# 33. Product Vision

**Build Me A Project** aims to provide a simple platform where students, developers, and clients can connect around software projects.

The first version focuses on demonstrating the fundamental functionality of a marketplace rather than building a large-scale commercial platform.

The project's primary technical objectives are:

> **Build a functional ASP.NET Web Forms application using VB.NET, connect it to an MS Access database, implement authentication and authorization, and demonstrate complete CRUD operations through a practical project marketplace.**

The prototype should prioritize **functionality, database operations, VB.NET backend implementation, and clear user flows** over advanced technologies or unnecessary complexity.