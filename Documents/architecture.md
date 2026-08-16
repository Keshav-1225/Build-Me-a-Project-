# Build Me A Project — Application Architecture

## 1. Overview

**Build Me A Project** is a basic academic project marketplace built using ASP.NET Web Forms and VB.NET.

The application allows users to:

- Browse available software projects.
- Search and filter projects.
- Purchase existing projects.
- Post project requirements.
- Become sellers.
- Upload and manage their own projects.
- Submit pitches for client requests.
- Manage purchases, messages, and notifications.

An administrator manages users, projects, reports, and announcements.

The application is intentionally kept as a **basic prototype**. The architecture focuses on clear separation of public pages, client pages, seller pages, and admin pages while demonstrating authentication, authorization, database connectivity, and CRUD operations.

---

# 2. Application Flow

## 2.1 High-Level Application Flow

```text
                    ┌──────────────────────┐
                    │      User/Visitor    │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │      Public Pages    │
                    │ Home / Explore /     │
                    │ Login / Register     │
                    └──────────┬───────────┘
                               │
                 ┌─────────────┴─────────────┐
                 │                           │
             Not Logged In               Login
                 │                           │
                 ▼                           ▼
          Browse Public Pages       Authentication
                                             │
                                             ▼
                                   ┌─────────────────┐
                                   │ Role Validation │
                                   └────────┬────────┘
                                            │
                         ┌──────────────────┼──────────────────┐
                         │                  │                  │
                         ▼                  ▼                  ▼
                    Client/User         Seller             Admin
                       Pages             Pages              Pages
                         │                  │                  │
                         └──────────────────┼──────────────────┘
                                            │
                                            ▼
                                   ┌─────────────────┐
                                   │   VB.NET Code   │
                                   │     Behind      │
                                   └────────┬────────┘
                                            │
                                            ▼
                                   ┌─────────────────┐
                                   │     ADO.NET     │
                                   └────────┬────────┘
                                            │
                                            ▼
                                   ┌─────────────────┐
                                   │  MS Access DB   │
                                   │     .accdb      │
                                   └─────────────────┘
```

---

## 2.2 Visitor Flow

A visitor who is not authenticated can access public pages.

```text
Visitor
   │
   ├── Home
   ├── Explore Projects
   ├── Project Details
   ├── Login
   └── Register
```

Public users can browse publicly available project information but must authenticate before accessing protected functionality such as purchases, requests, seller features, or dashboards.

---

## 2.3 Client/User Flow

```text
Register
   │
   ▼
Login
   │
   ▼
Client Dashboard
   │
   ├── Explore Projects
   │      │
   │      └── Project Details
   │             │
   │             └── Purchase
   │
   ├── Project Requests
   │      │
   │      ├── Create Request
   │      ├── View Request
   │      ├── Edit Request
   │      └── Delete Request
   │
   ├── Messages
   ├── Notifications
   ├── Purchases
   ├── Profile
   │
   └── Become a Seller
```

---

## 2.4 Seller Flow

A registered client can become a seller.

```text
Client
   │
   ▼
Become a Seller
   │
   ▼
Seller Access
   │
   ▼
Seller Dashboard
   │
   ├── My Projects
   │      │
   │      ├── Add Project
   │      ├── View Project
   │      ├── Edit Project
   │      └── Delete Project
   │
   ├── Sales
   ├── Earnings
   ├── Project Requests
   │      │
   │      └── Submit Pitch
   │
   ├── My Pitches
   ├── Messages
   ├── Notifications
   └── Settings
```

---

## 2.5 Admin Flow

```text
Admin Login
    │
    ▼
Admin Dashboard
    │
    ├── Manage Users
    │      ├── View Users
    │      ├── Update User
    │      ├── Ban User
    │      └── Delete User
    │
    ├── Manage Projects
    │      ├── View Projects
    │      ├── Hide Project
    │      └── Delete Project
    │
    ├── Reports
    │      ├── View Report
    │      └── Resolve Report
    │
    └── Announcements
           └── Create Announcement
```

---

# 3. Application Architecture

The application follows a simple **ASP.NET Web Forms architecture**.

```text
┌──────────────────────────────────────────────┐
│                 Presentation                 │
│          ASP.NET Web Forms / HTML            │
│          CSS / Tailwind / JavaScript         │
└───────────────────────┬──────────────────────┘
                        │
                        ▼
┌──────────────────────────────────────────────┐
│              Application Logic               │
│                 VB.NET                      │
│              Code-Behind                    │
│                                              │
│ Authentication / Authorization               │
│ Validation / Business Logic                  │
│ CRUD Operations                              │
└───────────────────────┬──────────────────────┘
                        │
                        ▼
┌──────────────────────────────────────────────┐
│               Data Access                    │
│                  ADO.NET                     │
│             SQL / OleDbConnection            │
│             OleDbCommand / Reader            │
└───────────────────────┬──────────────────────┘
                        │
                        ▼
┌──────────────────────────────────────────────┐
│                  Database                    │
│              MS Access 2007                 │
│                  .accdb                      │
└──────────────────────────────────────────────┘
```

## 3.1 Presentation Layer

The presentation layer contains ASPX pages and master pages.

Responsibilities:

- Display UI.
- Receive user input.
- Display database results.
- Provide navigation.
- Display validation messages.
- Submit forms to the backend.

Technology:

- ASP.NET Web Forms
- HTML5
- CSS3
- Tailwind CSS
- JavaScript
- ASP.NET server controls

---

## 3.2 Backend/Application Layer

The backend is implemented using **VB.NET** code-behind files.

Responsibilities:

- Process form submissions.
- Validate input.
- Check authentication.
- Check authorization.
- Execute business rules.
- Perform CRUD operations.
- Communicate with the database.
- Manage sessions.

VB.NET is a mandatory part of the backend implementation.

---

## 3.3 Data Access Layer

ADO.NET is used to communicate with Microsoft Access.

Typical flow:

```text
ASPX Page
   ↓
VB.NET Code-Behind
   ↓
ADO.NET
   ↓
OleDbConnection
   ↓
OleDbCommand
   ↓
MS Access
```

Example CRUD mapping:

```text
CREATE  → INSERT
READ    → SELECT
UPDATE  → UPDATE
DELETE  → DELETE
```

---

# 4. Authentication and Authorization Architecture

Authentication determines whether a user is logged in.

Authorization determines what the authenticated user is allowed to access.

## Authentication Flow

```text
Login Form
    ↓
VB.NET
    ↓
Validate Credentials
    ↓
Database Lookup
    ↓
Valid?
 ┌──┴──┐
No    Yes
│      │
▼      ▼
Error  Create Session
       │
       ▼
   Role Check
```

The application uses session-based authentication.

Example session values:

```text
Session("UserId")
Session("Username")
Session("Role")
```

## Authorization

The user's role controls access to protected page areas.

```text
Role
 │
 ├── Client → /Pages/Client/
 │
 ├── Seller → /Pages/Seller/
 │
 └── Admin  → /Pages/Admin/
```

A user must not be able to access another role's protected pages simply by entering the URL manually.

---

# 5. File and Folder Structure

The project follows a simple folder structure designed for ASP.NET Web Forms.

```text
BuildMeAProject/
│
├── Assets/
│   │
│   ├── CSS/
│   │   ├── input.css
│   │   └── output.css
│   │
│   └── Images/
│       ├── logo/
│       ├── icons/
│       └── other-images/
│
├── Masters/
│   ├── Site.Master
│   ├── Site.Master.vb
│   └── [Other Master Files]
│
├── Pages/
│   │
│   ├── Public/
│   │   ├── Home.aspx
│   │   ├── Home.aspx.vb
│   │   ├── ExploreProjects.aspx
│   │   ├── ExploreProjects.aspx.vb
│   │   ├── ProjectDetails.aspx
│   │   ├── ProjectDetails.aspx.vb
│   │   ├── Login.aspx
│   │   ├── Login.aspx.vb
│   │   ├── Register.aspx
│   │   └── Register.aspx.vb
│   │
│   ├── Admin/
│   │   ├── Dashboard.aspx
│   │   ├── Dashboard.aspx.vb
│   │   ├── Users.aspx
│   │   ├── Users.aspx.vb
│   │   ├── Projects.aspx
│   │   ├── Projects.aspx.vb
│   │   ├── Reports.aspx
│   │   ├── Reports.aspx.vb
│   │   ├── Announcements.aspx
│   │   └── Announcements.aspx.vb
│   │
│   ├── Client/
│   │   ├── Dashboard.aspx
│   │   ├── Dashboard.aspx.vb
│   │   ├── Purchases.aspx
│   │   ├── Purchases.aspx.vb
│   │   ├── Requests.aspx
│   │   ├── Requests.aspx.vb
│   │   ├── Messages.aspx
│   │   ├── Messages.aspx.vb
│   │   ├── Notifications.aspx
│   │   ├── Notifications.aspx.vb
│   │   ├── Profile.aspx
│   │   ├── Profile.aspx.vb
│   │   ├── BecomeSeller.aspx
│   │   └── BecomeSeller.aspx.vb
│   │
│   └── Seller/
│       ├── Dashboard.aspx
│       ├── Dashboard.aspx.vb
│       ├── MyProjects.aspx
│       ├── MyProjects.aspx.vb
│       ├── AddProject.aspx
│       ├── AddProject.aspx.vb
│       ├── EditProject.aspx
│       ├── EditProject.aspx.vb
│       ├── Sales.aspx
│       ├── Sales.aspx.vb
│       ├── Earnings.aspx
│       ├── Earnings.aspx.vb
│       ├── Requests.aspx
│       ├── Requests.aspx.vb
│       ├── MyPitches.aspx
│       ├── MyPitches.aspx.vb
│       ├── Messages.aspx
│       ├── Messages.aspx.vb
│       ├── Notifications.aspx
│       ├── Notifications.aspx.vb
│       ├── Settings.aspx
│       └── Settings.aspx.vb
│
├── Scripts/
│   └── [JavaScript files]
│
├── App_Data/
│   └── BuildMeAProject.accdb
│
├── Web.config
├── Site.sitemap
└── [ASP.NET project files]
```

---

# 6. Folder Responsibilities

## Assets/

Contains static frontend assets.

### Assets/CSS/

Contains Tailwind CSS source and generated CSS.

#### `input.css`

Tailwind CSS source file.

Used to define:

- Tailwind directives.
- Custom CSS when required.
- Project-specific styles.

#### `output.css`

Generated Tailwind CSS file used by the application.

The generated file should generally not be edited manually.

---

## Assets/Images/

Contains images used throughout the application.

Examples:

```text
Assets/Images/
├── logo/
├── icons/
├── projects/
└── other/
```

This includes:

- Build Me A Project logo.
- UI icons.
- Project thumbnails.
- Other static images.

---

## Masters/

Contains ASP.NET Web Forms Master Pages.

Master pages provide common layouts for multiple pages.

Examples:

- Main public layout.
- Authenticated user layout.
- Seller layout.
- Admin layout.

A Master Page can contain:

- Navbar.
- Sidebar.
- Footer.
- Common CSS/JS references.
- Common navigation.

---

## Pages/Public/

Contains pages that do not require authentication.

Examples:

- Home
- Explore Projects
- Project Details
- Login
- Register

Public pages should not require a logged-in session.

---

## Pages/Client/

Contains pages intended for authenticated normal users/clients.

Examples:

- Client Dashboard
- Purchases
- Project Requests
- Messages
- Notifications
- Profile
- Become a Seller

These pages require authentication.

---

## Pages/Seller/

Contains pages intended for users who have seller access.

Examples:

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

These pages require authentication and seller authorization.

---

## Pages/Admin/

Contains administrator-only pages.

Examples:

- Admin Dashboard
- User Management
- Project Management
- Reports
- Announcements

These pages require authentication and admin authorization.

---

## Scripts/

Contains JavaScript files used by the application.

JavaScript should only be used where client-side behavior is useful.

Examples:

- UI interactions.
- Form interactions.
- Search/filter behavior.
- Modal dialogs.
- Small frontend utilities.

Business logic should remain in the VB.NET backend.

---

# 7. Page-to-Master Relationship

A simplified layout relationship is:

```text
                    Site.Master
                        │
        ┌───────────────┼────────────────┐
        │               │                │
        ▼               ▼                ▼
     Public           Client           Seller/Admin
      Pages            Pages              Pages
        │               │                  │
        ▼               ▼                  ▼
   Public UI       User UI           Dashboard UI
```

If separate Master Pages are required, the structure can instead be:

```text
Masters/
├── Site.Master
├── Client.Master
├── Seller.Master
└── Admin.Master
```

The exact number of Master Pages can be kept minimal for the prototype.

---

# 8. CRUD Architecture

CRUD is a mandatory requirement of the application.

## Example — Project CRUD

```text
              Project Management
                      │
       ┌──────────────┼──────────────┐
       │              │              │
       ▼              ▼              ▼
     Create          Read          Update
       │              │              │
       └──────────────┼──────────────┘
                      │
                    Delete
```

### Create

```text
AddProject.aspx
      ↓
AddProject.aspx.vb
      ↓
INSERT SQL
      ↓
Access Database
```

### Read

```text
MyProjects.aspx
      ↓
MyProjects.aspx.vb
      ↓
SELECT SQL
      ↓
Access Database
      ↓
Display Projects
```

### Update

```text
EditProject.aspx
      ↓
EditProject.aspx.vb
      ↓
UPDATE SQL
      ↓
Access Database
```

### Delete

```text
MyProjects.aspx
      ↓
Delete Action
      ↓
VB.NET
      ↓
DELETE SQL
      ↓
Access Database
```

---

# 9. Database Entities

The initial database contains the following major entities:

```text
Users
Projects
Categories
Orders
ProjectRequests
Pitches
Messages
Notifications
Reports
```

Relationships will be implemented using appropriate primary and foreign keys supported by the chosen Access database design.

---

# 10. Technology Stack

## Frontend

The frontend will be implemented using:

- **ASP.NET Web Forms**
- HTML5
- CSS3
- **Tailwind CSS**
- Basic JavaScript where required
- ASP.NET Web Forms server controls

The frontend is responsible for:

- User interface.
- Forms.
- Navigation.
- Project cards.
- Dashboards.
- Tables.
- Search/filter interfaces.
- Authentication pages.
- User interactions.

---

## Backend

The backend will use:

- **ASP.NET Web Forms**
- **VB.NET**
- ADO.NET for database operations
- Server-side validation
- Session-based authentication
- Role-based authorization

**VB.NET is a mandatory component of this project.**

The backend will handle:

- Business logic.
- Authentication.
- Authorization.
- CRUD operations.
- Database communication.
- Form processing.
- Project management.
- Orders.
- Requests.
- Proposals.
- Notifications.

---

## Database

### Database Management System

**Microsoft Access 2007**

Database file:

`.accdb`

The database will contain the application's primary entities such as:

- Users
- Projects
- Categories
- Orders
- Project Requests
- Pitches/Proposals
- Messages
- Notifications
- Reports

---

# 11. Development Principles

The project should follow these principles:

### Keep the prototype simple

Do not introduce advanced architecture unless it is required.

### VB.NET is the backend

Core server-side operations must be implemented using VB.NET.

### Database operations must be demonstrable

CRUD operations should be easy to identify and demonstrate during the project presentation.

### Authorization must be enforced server-side

Hiding a navigation link is not sufficient. Protected pages must also verify the user's role on the server.

### Keep frontend and backend responsibilities clear

```text
Frontend
→ UI and user interaction

VB.NET
→ Processing and business logic

ADO.NET
→ Database communication

MS Access
→ Data storage
```

### Avoid unnecessary technologies

The prototype does not require:

- React
- Node.js
- Express
- MongoDB
- REST APIs
- WebSockets
- Microservices
- Cloud infrastructure

These technologies may be used in a future recreation of the project, but they are outside the scope of the current ASP.NET Web Forms prototype.

---

# 12. Future Recreation

After completion and submission of the academic prototype, the same product concept can be recreated using a modern JavaScript stack.

Possible future stack:

```text
React
   ↓
Express / Node.js
   ↓
MongoDB / Mongoose
```

The current architecture should therefore keep the application's business requirements and database entities clearly defined so that they can be migrated later.

The current implementation, however, remains:

```text
ASP.NET Web Forms
        +
VB.NET
        +
ADO.NET
        +
MS Access 2007
```

---

# 13. Architecture Summary

```text
                    BUILD ME A PROJECT
                           │
              ┌────────────┴────────────┐
              │                         │
         Public Users              Authenticated
                                        │
                         ┌──────────────┼──────────────┐
                         │              │              │
                       Client         Seller         Admin
                         │              │              │
                         └──────────────┼──────────────┘
                                        │
                              ASP.NET Web Forms
                                        │
                                  VB.NET Backend
                                        │
                                     ADO.NET
                                        │
                                  MS Access 2007
                                        │
                                    .accdb DB
```

The architecture is intentionally simple and suitable for a **college-level prototype** while satisfying the two primary technical requirements:

1. **CRUD operations**
2. **VB.NET backend implementation**
