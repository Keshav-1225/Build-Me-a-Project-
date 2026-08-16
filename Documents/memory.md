# Build Me A Project — Working Memory

## Purpose

This file is the hand-off context for future coding agents. Read it with `PRD.md`, `rules.md`, `architecture.md`, `phases.md`, `theme.md`, and `routes.md` before changing the application.

## Product and scope

Build Me A Project is a basic college marketplace where users discover and purchase software projects, post custom project requests, and can become sellers. Sellers publish projects and submit pitches; administrators manage users, projects, reports, and announcements. This is an academic prototype, not a production marketplace.

The wireframe source is `C:\Users\admin\OneDrive\Desktop\buildmeaproject.excalidraw`. It defines the main desktop page hierarchy, forms, dashboards, cards, notifications, orders, and role-specific sidebars. Follow its intent without copying its placeholder content verbatim.

## Non-negotiable technical constraints

- ASP.NET Web Forms on .NET Framework 4.7.2.
- All server code is VB.NET. Do not add C# files or C# snippets.
- Microsoft Access 2007 `.accdb` is the only database; use `System.Data.OleDb` / ADO.NET only.
- Use session-based authentication and enforce authorization in VB.NET code-behind. Never rely on hidden navigation alone.
- Keep the implementation basic: no React, Node/Express backend, ORM, cloud/database replacement, microservices, SignalR/WebSockets, Docker, or production payment system.
- Do not introduce responsive design or Tailwind breakpoint prefixes. The UI is fixed desktop-width for a college demonstration.
- Use Tailwind and add custom CSS only to `Assets/CSS/input.css`; do not manually edit `Assets/CSS/output.css`.

The PRD says "REST API architecture" is out of scope. `routes.md` therefore documents REST-style **page navigation**, not API endpoints.

## Current repository state (2026-08-16)

- Root project: `BuildMeAProject.vbproj`; VB.NET Web Forms project, target framework 4.7.2.
- Tailwind source is `Assets/CSS/input.css`; compiled stylesheet path is `Assets/CSS/output.css`.
- Existing asset files: `Assets/Images/logo.gif` and `Assets/Images/search.gif`.
- Friendly URLs are enabled in `App_Start/RouteConfig.vb` with permanent redirects.
- `Web.sitemap` currently maps only the implemented public/request/pitch pages.
- `App_Data` contains no committed Access database schema/data file at this time.
- Existing ASPX pages are static UI prototypes and most have no code-behind yet. Several page paths do not yet match their eventual role grouping; do not move them casually without updating markup, project entries, sitemap, and links.

### Implemented pages

| Area | Existing file | Notes |
|---|---|---|
| Home | `Default.aspx` | Public landing UI |
| Public | `Pages/public/Projects.aspx` | Explore page UI |
| Public | `Pages/public/ProjectDetails.aspx` | Detail page UI |
| Public | `Pages/public/Login.aspx`, `Register.aspx` | Visual forms only |
| Public | `Pages/public/About.aspx`, `Contact.aspx` | Template content, should be replaced later |
| Requests | `Pages/client/Requests.aspx`, `PostRequest.aspx` | Currently public-facing UI but stored in client folder |
| Seller pitch | `Pages/seller/SellerPitch.aspx` | Currently uses public master; seller authorization is pending |

### Master pages (Phase 1)

| Master | Role / layout | Status |
|---|---|---|
| `Masters/Site.Master` | Public header, public links, footer | Exists; public links include home, projects, requests, categories, login, register |
| `Masters/Client.Master` | Authenticated client header/navigation/footer | Created; links target planned client pages |
| `Masters/Seller.Master` | Seller dark sidebar/layout/footer | Created; links target planned seller pages |
| `Masters/Admin.Master` | Admin dark sidebar/layout/footer | Created; links target planned admin pages |

These layouts provide navigation only. Authentication and role checks must be added to their pages in a later phase; a master page should not become the only authorization mechanism.

## Phase progress

- Phase 1 — Master Pages: structurally complete. All four master pages exist, Tailwind is linked, each has navigation and a footer, and role-specific layouts are distinct. Visual rendering should be checked in IIS Express when available.
- Phase 2 — Public Pages: partially scaffolded. Home, projects, details, login, and register have UI, but validation, database display, and full link/functionality checks are unfinished.
- Phase 3 — Admin Pages: not started.
- Phase 4 — Client Pages: only request-related UI is scaffolded; not functionally implemented.
- Phase 5 — Seller Pages: only pitch UI is scaffolded; not functionally implemented.

## Page and role model

Public users may browse home, projects, project detail, public requests, login, and register. Authenticated clients use dashboard, purchases, requests, messages, notifications, profile, and become-seller. Sellers receive all seller-dashboard/project/sales/earnings/pitch/settings functions. Admins manage dashboard, users, projects, orders, reports, and announcements.

The expected route map and page-to-page connections are in `Documents/routes.md`. Use it as the source of truth when adding navigation or new pages.

## Data model to implement

Primary entities required by the architecture/PRD: `Users`, `Projects`, `Categories`, `Orders`, `ProjectRequests`, `Pitches`, `Messages`, `Notifications`, and `Reports`. Use MS Access primary keys and foreign keys where supported.

The important demonstrable CRUD areas are:

- Projects: seller creates, lists/reads, edits, and deletes only their own projects.
- Project requests: client creates, views, edits, and deletes only their own requests.
- Users: registration creates users; admin reads, updates status/role, and deletes where appropriate.
- Notifications and reports: read/update/delete or resolve actions as applicable.

All OleDb queries must be parameterized. With OleDb, parameters are positional: add them in the exact order of the `?` placeholders, regardless of parameter names.

## Authentication and authorization contract

Suggested session values (from architecture): `Session("UserId")`, `Session("Username")`, and `Session("Role")`.

- Unauthenticated access to client/seller/admin pages redirects to login.
- Admin pages require role `Admin`.
- Seller pages require role `Seller`.
- Owner checks are required for project, request, profile, message, and related edit/delete operations.
- Login should redirect client, seller, and admin users to their respective dashboards.
- Logout must clear the session and redirect to login.

## UI/theme contract

Use fixed desktop widths (the current masters use `min-w-[1180px]` and `w-[1160px]`). Use `font-sans`, slate surfaces/text, `blue-600` primary actions, `rounded-xl` controls, `rounded-2xl` cards, `shadow-sm`, and `ring-1 ring-slate-200`. Gradients are decorative project-preview imagery only. See `theme.md` for the exact token system.

Do not add responsiveness despite one contradictory PRD line: `rules.md` is mandatory and explicitly forbids it.

## Recommended next work

1. Run and visually inspect the four master pages with representative child pages.
2. Complete Phase 2: attach the public master where appropriate, replace template About/Contact content if needed, add VB.NET validation, and create database-backed public project data.
3. Design and create the Access schema plus a small seed data set.
4. Implement login, registration, session handling, and reusable server-side authorization helpers before adding protected page features.
5. Build Phases 3–5 in order, creating an ASPX page and its `.aspx.vb` code-behind for every route that becomes active.

## Known implementation caveats

- Some existing content pages contain plain HTML `<form>` tags inside a master page that already has `<form runat="server">`; ASP.NET Web Forms does not allow nested forms at runtime. Convert these to server controls or non-form containers when wiring functionality.
- Existing Login UI includes Google/GitHub buttons, but external/social login is out of scope. Keep the buttons visual only or remove them when implementing the form.
- Existing sample project copy references technologies such as React, Node.js, and AI/ML. These may describe listed marketplace projects; they must not change this application's locked implementation stack.
- Add new pages/master pages to `BuildMeAProject.vbproj` content/compile entries, as this is a Web Application Project rather than a website project.
