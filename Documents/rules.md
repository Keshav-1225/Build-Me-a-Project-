# Build Me A Project — Development Rules

These rules are mandatory for the entire **Build Me A Project** project.

The project is an academic prototype built with ASP.NET Web Forms, VB.NET, Tailwind CSS, and Microsoft Access. Do not introduce technologies or implementation patterns that conflict with these rules.

---

# 1. No Responsive Design

The website **must not be made responsive**.

Do not add unnecessary Tailwind CSS classes or CSS rules solely to support:

- Mobile layouts
- Tablet layouts
- Different screen sizes
- Responsive grids
- Responsive typography
- Responsive navigation

Avoid unnecessary responsive prefixes such as:

```text
sm:
md:
lg:
xl:
2xl:
```

unless a specific project requirement explicitly needs one.

The UI should be designed for the intended desktop/college demonstration environment.

### Example

Do not unnecessarily write:

```html
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4">
```

Prefer:

```html
<div class="grid grid-cols-4">
```

The objective is to keep the frontend simple and consistent with the wireframe.

---

# 2. Microsoft Access Only

The project must use **Microsoft Access 2007** as its database.

Database file:

```text
.accdb
```

Do not use:

- MySQL
- PostgreSQL
- MongoDB
- SQLite
- SQL Server
- Firebase
- Supabase
- Any other database system

The database should remain a local Microsoft Access database for this prototype.

---

# 3. Use OleDb for Database Access

All database-related operations must use **ADO.NET OleDb**.

Use:

```vb
System.Data.OleDb
```

Typical components include:

```vb
OleDbConnection
OleDbCommand
OleDbDataReader
OleDbDataAdapter
```

Database operations must follow the basic flow:

```text
ASP.NET Web Forms
        ↓
VB.NET
        ↓
OleDb
        ↓
Microsoft Access
```

SQL operations such as:

```sql
SELECT
INSERT
UPDATE
DELETE
```

must be executed through OleDb.

Do not introduce other database drivers, ORMs, or database access libraries.

---

# 4. VB.NET Is Mandatory

The project backend must be written in **VB.NET**.

Use VB.NET for:

- Code-behind files
- Authentication
- Authorization
- Form processing
- Validation
- Business logic
- CRUD operations
- Database communication
- Session management
- Server-side functionality

ASP.NET Web Forms code-behind files should use:

```text
.aspx
.aspx.vb
```

Example:

```text
AddProject.aspx
AddProject.aspx.vb
```

The `.aspx.vb` file must contain the server-side implementation for the page.

---

# 5. C# Is Strictly Prohibited

**Do not use C# at any point in this project.**

This applies to:

- Code-behind
- Classes
- Utility files
- Database code
- Authentication code
- Configuration examples
- Server-side scripts
- Tutorials or generated snippets intended for this project

Do not create:

```text
.aspx.cs
.cs
```

files.

The project must remain entirely VB.NET on the backend.

If an ASP.NET example is normally provided in C#, it must be converted to VB.NET before being used in this project.

---

# 6. Keep the Project Basic

This is a **college-level prototype**, not a production application.

Do not introduce unnecessary advanced technologies or architecture.

Avoid adding:

- React
- Node.js
- Express
- MongoDB
- REST APIs
- WebSockets
- SignalR
- Microservices
- Docker
- Cloud infrastructure
- AI/ML systems
- Advanced caching
- Complex design patterns
- External authentication providers

unless the project requirements are explicitly changed later.

The priority is:

```text
Working Features
      ↓
CRUD Operations
      ↓
VB.NET Backend
      ↓
MS Access Database
      ↓
Clean UI
```

---

# 7. Follow the Wireframe

The wireframe is the primary reference for the application's UI and page structure.

When implementing a page:

1. Follow the wireframe layout.
2. Keep the same general hierarchy.
3. Use the defined navigation structure.
4. Do not add unnecessary sections.
5. Do not introduce features that are outside the PRD.
6. Keep the implementation simple.

Small implementation adjustments are allowed when required by ASP.NET Web Forms, but the overall design should remain consistent with the wireframe.

---

# 8. Tailwind CSS Usage

Tailwind CSS should be used for styling where appropriate.

Keep Tailwind classes focused on the actual design.

Do not add classes only because they are commonly used in modern responsive websites.

Avoid unnecessary:

```text
sm:
md:
lg:
xl:
2xl:
```

The project should prioritize readable and manageable HTML.

Custom CSS should be added to:

```text
Assets/CSS/input.css
```

Generated Tailwind CSS should be placed in:

```text
Assets/CSS/output.css
```

Do not manually edit `output.css`.

---

# 9. Backend Responsibility

Backend logic should remain on the server.

Use VB.NET for:

- Database operations
- Validation that affects data integrity
- Authentication
- Authorization
- CRUD operations
- Business rules

JavaScript should only be used when client-side behavior is genuinely useful.

Do not move core business logic into JavaScript.

---

# 10. Security Rules

Even though this is a basic prototype, protected functionality must be checked server-side.

Examples:

- Users cannot access Admin pages.
- Clients cannot access Seller-only pages unless they have seller access.
- Sellers cannot edit another seller's project.
- Users cannot delete another user's request.
- Logged-out users cannot access authenticated pages.

Hiding a navigation link is **not** sufficient authorization.

---

# 11. CRUD Is Mandatory

CRUD operations are one of the primary technical requirements.

The project must demonstrate:

```text
CREATE
READ
UPDATE
DELETE
```

At minimum, CRUD should be clearly implemented for important entities such as:

- Projects
- Project Requests
- Users where appropriate
- Notifications where appropriate
- Reports where appropriate

CRUD operations must be performed through:

```text
VB.NET
   ↓
OleDb
   ↓
Microsoft Access
```

---

# 12. File Organization

Follow the project structure defined in `architecture.md`.

Major folders:

```text
Assets/
Masters/
Pages/
Scripts/
App_Data/
```

Pages should remain organized by access level:

```text
Pages/
├── Public/
├── Client/
├── Seller/
└── Admin/
```

Do not place all ASPX pages in the project root unless ASP.NET requires a specific file there.

---

# 13. Technology Lock

The following technology stack is locked for the current version of the project:

| Layer | Technology |
|---|---|
| Frontend | ASP.NET Web Forms |
| Markup | HTML5 |
| Styling | Tailwind CSS / CSS3 |
| Client-side scripting | JavaScript where required |
| Backend | **VB.NET** |
| Web Framework | ASP.NET Web Forms |
| Database | **Microsoft Access 2007** |
| Database Driver | **OleDb / ADO.NET** |

Any technology not listed above should be considered out of scope unless the project requirements are explicitly updated.

---

# 14. Rule Priority

When implementing a feature, follow this priority:

```text
1. Project Requirements / PRD
        ↓
2. Wireframe
        ↓
3. architecture.md
        ↓
4. phases.md
        ↓
5. rules.md
```

If a proposed implementation conflicts with a mandatory technical rule, the mandatory rule takes priority unless the project requirements are explicitly changed.

---

# 15. Quick Reference

Before implementing anything, verify:

- [ ] Is this ASP.NET Web Forms?
- [ ] Is the backend written in VB.NET?
- [ ] Am I using Microsoft Access?
- [ ] Am I using OleDb for database operations?
- [ ] Am I avoiding C# completely?
- [ ] Am I avoiding responsive Tailwind classes?
- [ ] Does the implementation follow the wireframe?
- [ ] Is the feature within the basic prototype scope?
- [ ] Does the feature require CRUD?
- [ ] Is authorization checked server-side where required?

## Non-Negotiable Rules

> **Microsoft Access only.**

> **OleDb for all database operations.**

> **VB.NET for the backend.**

> **No C# anywhere in the project.**

> **Do not make the website responsive.**

> **Keep the project a basic prototype.**
