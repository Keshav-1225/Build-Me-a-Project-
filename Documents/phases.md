# Build Me A Project — Development Phases

## Overview

The project will be developed in five major phases. The development order follows the application's navigation and role structure:

```text
Phase 1 → Master Pages → Phase 2 → Public Pages → Phase 3 → Admin Pages → Phase 4 → Client Pages → Phase 5 → Seller Pages
```

The goal is to first establish the common layouts and then build each section of the application independently.

---

# Phase 1: Create Master Pages

## Objective

Create the common layouts required by the application before implementing individual pages.

## Master Pages

- Public Master Page
- Client Master Page
- Seller Master Page
- Admin Master Page

## Tasks

### Public Master Page

Create the common layout for pages accessible without authentication.

Include:
- Navbar
- Logo
- Public navigation links
- Login/Register actions
- Footer
- Common CSS references

### Client Master Page

Create the layout for authenticated clients.

Include:
- Navbar
- Client navigation
- Dashboard
- Purchases
- Requests
- Messages
- Notifications
- Profile
- Become a Seller
- Logout
- Footer

### Seller Master Page

Create the layout for authenticated sellers.

Include:
- Seller navigation
- Dashboard
- My Projects
- Sales
- Earnings
- Project Requests
- My Pitches
- Messages
- Notifications
- Settings
- Logout

### Admin Master Page

Create the administrator layout.

Include:
- Admin navigation/sidebar
- Dashboard
- Users
- Projects
- Reports
- Announcements
- Logout

## Phase Completion Criteria

- [ ] All four master pages are created.
- [ ] Common navigation is implemented.
- [ ] Common footer is implemented.
- [ ] Tailwind CSS is connected.
- [ ] Master pages render correctly.
- [ ] Navigation links point to the appropriate sections.
- [ ] Role-specific layouts are visually distinct where necessary.

---

# Phase 2: Create All Public Pages

## Objective

Build all pages that can be accessed without authentication.

## Pages

### Home

Create the landing page containing:
- Hero section
- Project search
- Featured projects
- Popular categories
- Call-to-action sections
- Footer

### Explore Projects

Create the public project marketplace.

Include:
- Project cards
- Search
- Basic filters
- Category filtering
- Price filtering
- Project sorting

### Project Details

Display:
- Project title
- Description
- Technology stack
- Screenshots
- Seller information
- Rating
- Price
- Buy action

### Login

Create the login page with:
- Username/email
- Password
- Login button
- Register link
- Validation messages

### Register

Create the registration page with:
- Name
- Email
- Username
- Contact number
- Password
- Confirm password
- Register button

## Phase Completion Criteria

- [ ] All public pages are created.
- [ ] All pages use the Public Master Page where appropriate.
- [ ] Navigation works.
- [ ] Forms are visually complete.
- [ ] Basic server-side validation is implemented.
- [ ] Public project data can be displayed from the database where required.

---

# Phase 3: Create All Admin Pages

## Objective

Build the administration section used to manage the platform.

All admin pages must require authentication and **Admin authorization**.

## Pages

### Admin Dashboard

Display basic statistics:
- Total users
- Total projects
- Total orders
- Total reports
- Recent activity

### Manage Users

Include:
- User list
- Search
- View user
- Update user status
- Ban user
- Delete user

This page will demonstrate CRUD operations on users.

### Manage Projects

Include:
- Project list
- Search
- View project
- Hide project
- Delete project

### Reports

Include:
- Report list
- Reporter
- Reported user/project
- Reason
- Date
- Status
- Resolve action

### Announcements

Include:
- Announcement list
- Create announcement
- Edit announcement
- Delete announcement
- Select audience

## Phase Completion Criteria

- [ ] Admin authorization is implemented.
- [ ] Admin dashboard is complete.
- [ ] User management is complete.
- [ ] Project management is complete.
- [ ] Reports page is complete.
- [ ] Announcements page is complete.
- [ ] CRUD operations work for appropriate entities.
- [ ] Normal users cannot access admin pages.

---

# Phase 4: Create All Client Pages

## Objective

Build the authenticated user/client section.

All client pages require authentication.

## Pages

### Client Dashboard

Display:
- Recent purchases
- Active requests
- Notifications
- Basic account information
- Quick actions

### Purchases

Display:
- Purchased projects
- Order details
- Purchase date
- Amount
- Order status

### Project Requests

Allow clients to:
- Create request
- View requests
- Edit requests
- Delete requests
- View received pitches

This section will demonstrate CRUD operations on project requests.

### Messages

Include:
- Conversations
- Message history
- Send message

### Notifications

Allow clients to:
- View notifications
- Mark as read
- Delete notifications
- Mark all as read
- Delete all

### Profile

Allow users to:
- View profile
- Edit profile
- Update basic account information

### Become a Seller

Allow a client to apply for/activate seller access.

After successful completion, the user can access seller functionality.

## Phase Completion Criteria

- [ ] Authentication checks are implemented.
- [ ] Client dashboard is complete.
- [ ] Purchases page is complete.
- [ ] Project requests are fully functional.
- [ ] Messages page is complete.
- [ ] Notifications are complete.
- [ ] Profile management is complete.
- [ ] Become a Seller flow is complete.
- [ ] CRUD operations work for project requests.
- [ ] Clients cannot access admin-only pages.

---

# Phase 5: Create All Seller Pages

## Objective

Build the seller section for users who can publish and sell projects.

All seller pages require authentication and seller authorization.

## Pages

### Seller Dashboard

Display:
- Total projects
- Total sales
- Earnings
- Active requests
- Recent activity

### My Projects

Display all projects created by the seller.

Actions:
- View
- Edit
- Delete
- Add Project

### Add Project

Allow sellers to create a project containing:
- Title
- Description
- Category
- Technology stack
- Price
- Screenshots
- Setup instructions
- Execution steps

This is a primary **Create** operation.

### Edit Project

Allow sellers to modify their existing project.

This is a primary **Update** operation.

### Delete Project

Allow sellers to remove their own projects.

This is a primary **Delete** operation.

### Sales

Display:
- Sold projects
- Orders
- Buyers
- Sale dates
- Amounts

### Earnings

Display basic:
- Total earnings
- Project-wise earnings
- Recent earnings

### Project Requests

Allow sellers to:
- Browse client requests
- View request details
- Submit a pitch

### My Pitches

Display:
- Submitted pitches
- Proposed price
- Client request
- Pitch status

### Messages

Allow sellers to:
- View conversations
- Read messages
- Send messages

### Notifications

Allow sellers to:
- View notifications
- Mark as read
- Delete notifications

### Settings

Allow sellers to manage basic account/settings information.

## Phase Completion Criteria

- [ ] Seller authorization is implemented.
- [ ] Seller dashboard is complete.
- [ ] My Projects is complete.
- [ ] Add Project works.
- [ ] View Project works.
- [ ] Edit Project works.
- [ ] Delete Project works.
- [ ] Sales page is complete.
- [ ] Earnings page is complete.
- [ ] Project Requests page is complete.
- [ ] My Pitches page is complete.
- [ ] Messages page is complete.
- [ ] Notifications page is complete.
- [ ] Settings page is complete.
- [ ] Project CRUD operations are fully functional.
- [ ] Sellers can only modify their own projects.

---

# Overall Phase Completion

The project will be considered structurally complete when all five phases are finished:

```text
┌──────────────────────────┐
│ Phase 1                  │
│ Master Pages             │
└────────────┬─────────────┘
             ↓
┌──────────────────────────┐
│ Phase 2                  │
│ Public Pages             │
└────────────┬─────────────┘
             ↓
┌──────────────────────────┐
│ Phase 3                  │
│ Admin Pages              │
└────────────┬─────────────┘
             ↓
┌──────────────────────────┐
│ Phase 4                  │
│ Client Pages             │
└────────────┬─────────────┘
             ↓
┌──────────────────────────┐
│ Phase 5                  │
│ Seller Pages             │
└──────────────────────────┘
```

After these phases, the application should have its complete frontend/page structure. Backend integration, database CRUD implementation, authentication, authorization, validation, and final testing can then be completed or refined across the pages.
