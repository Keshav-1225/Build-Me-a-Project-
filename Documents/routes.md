# Build Me A Project — Navigation Routes

## Route conventions

This is an ASP.NET Web Forms application, not a REST API. The routes below use REST-style, resource-oriented **page URLs** where it makes navigation clearer. The application continues to use the physical `.aspx` page paths shown in the current project; ASP.NET Friendly URLs can expose the equivalent extensionless URL.

Parameters use resource identifiers, for example `id`, `projectId`, and `requestId`. Access checks belong in each page's VB.NET code-behind; a navigation link alone is never authorization.

| User-facing route | Current Web Forms page / planned page | Purpose |
|---|---|---|
| `/` | `~/Default.aspx` | Home page |
| `/projects` | `~/Pages/public/Projects.aspx` | Browse/search projects |
| `/projects/{id}` | `~/Pages/public/ProjectDetails.aspx?id={id}` | View one project |
| `/requests` | `~/Pages/client/Requests.aspx` | Browse project requests |
| `/requests/new` | `~/Pages/client/PostRequest.aspx` | Create a project request |
| `/login` | `~/Pages/public/Login.aspx` | Sign in |
| `/register` | `~/Pages/public/Register.aspx` | Create an account |

## Public routes

Public users can browse these pages without a session. Actions that create, purchase, or modify data must redirect to sign-in when the visitor is unauthenticated.

| Route | Navigation connections |
|---|---|
| `/` | Projects, categories, project requests, login, register |
| `/projects` | Project detail, category filters, requests |
| `/projects/{id}` | Back to projects; buy now → `/orders/new?projectId={id}` after sign-in; seller profile |
| `/requests` | Request detail; sign-in/register; seller pitch after seller authorization |
| `/requests/{id}` | Seller pitches; client edit/delete if owner |
| `/login` | Register; redirect after successful role-aware login |
| `/register` | Login; client dashboard after registration |
| `/about` | Informational page |
| `/contact` | Informational page |

## Client routes

All client routes require an authenticated session. A seller may also use client routes. A client cannot access admin routes, and seller-only actions require the Seller role.

| Route | Physical/planned page | Connected from / to |
|---|---|---|
| `/client/dashboard` | `Pages/client/Dashboard.aspx` | Purchases, requests, messages, notifications, profile, become seller |
| `/client/purchases` | `Pages/client/Purchases.aspx` | Purchase details and dashboard |
| `/client/purchases/{id}` | `Pages/client/PurchaseDetails.aspx?id={id}` | Back to purchases |
| `/client/requests` | `Pages/client/Requests.aspx` | New request, request detail |
| `/client/requests/new` | `Pages/client/PostRequest.aspx` | Back to requests after create/cancel |
| `/client/requests/{id}` | `Pages/client/RequestDetails.aspx?id={id}` | Edit, delete, pitches |
| `/client/requests/{id}/edit` | `Pages/client/EditRequest.aspx?id={id}` | Back to request detail |
| `/client/requests/{id}/pitches` | `Pages/client/RequestPitches.aspx?id={id}` | Accept/reject a pitch; back to request detail |
| `/client/messages` | `Pages/client/Messages.aspx` | Conversation |
| `/client/messages/{id}` | `Pages/client/Messages.aspx?conversationId={id}` | Back to messages |
| `/client/notifications` | `Pages/client/Notifications.aspx` | Open notification destination |
| `/client/profile` | `Pages/client/Profile.aspx` | Edit profile |
| `/client/become-seller` | `Pages/client/BecomeSeller.aspx` | Seller dashboard after activation |
| `/orders/new?projectId={id}` | `Pages/client/Order.aspx?projectId={id}` | Checkout → confirmation or cancel → project detail |
| `/orders/{id}/confirmation` | `Pages/client/OrderConfirmation.aspx?id={id}` | Purchases and project detail |

## Seller routes

Seller routes require both an authenticated session and `Session("Role") = "Seller"` (or an equivalent role check). A seller can only edit or delete projects and pitches that they own.

| Route | Physical/planned page | Connected from / to |
|---|---|---|
| `/seller/dashboard` | `Pages/seller/Dashboard.aspx` | All seller navigation |
| `/seller/projects` | `Pages/seller/MyProjects.aspx` | Add, view, edit, delete owned project |
| `/seller/projects/new` | `Pages/seller/AddProject.aspx` | Back to my projects after create/cancel |
| `/seller/projects/{id}/edit` | `Pages/seller/EditProject.aspx?id={id}` | Back to my projects |
| `/seller/sales` | `Pages/seller/Sales.aspx` | Sales detail and earnings |
| `/seller/earnings` | `Pages/seller/Earnings.aspx` | Sales |
| `/seller/requests` | `Pages/seller/Requests.aspx` | Request detail and pitch form |
| `/seller/requests/{id}/pitch` | `Pages/seller/SellerPitch.aspx?requestId={id}` | Back to seller requests; submitted pitch → my pitches |
| `/seller/pitches` | `Pages/seller/MyPitches.aspx` | Pitch detail |
| `/seller/messages` | `Pages/seller/Messages.aspx` | Conversation |
| `/seller/notifications` | `Pages/seller/Notifications.aspx` | Notification destination |
| `/seller/settings` | `Pages/seller/Settings.aspx` | Seller dashboard |

## Admin routes

Admin routes require an authenticated session and `Session("Role") = "Admin"`. Every admin action must validate the target record and confirm the administrator's authorization server-side.

| Route | Physical/planned page | Connected from / to |
|---|---|---|
| `/admin/dashboard` | `Pages/admin/Dashboard.aspx` | Users, projects, orders, reports, announcements |
| `/admin/users` | `Pages/admin/Users.aspx` | User detail; ban/unban/delete actions |
| `/admin/users/{id}` | `Pages/admin/UserDetails.aspx?id={id}` | Back to users |
| `/admin/projects` | `Pages/admin/Projects.aspx` | Project detail; hide/remove actions |
| `/admin/projects/{id}` | `Pages/admin/ProjectDetails.aspx?id={id}` | Back to projects |
| `/admin/orders` | `Pages/admin/Orders.aspx` | Order detail |
| `/admin/reports` | `Pages/admin/Reports.aspx` | Report detail; resolve / moderation actions |
| `/admin/reports/{id}` | `Pages/admin/ReportDetails.aspx?id={id}` | Back to reports |
| `/admin/announcements` | `Pages/admin/Announcements.aspx` | New/edit/delete announcement |
| `/admin/announcements/new` | `Pages/admin/AnnouncementForm.aspx` | Back to announcements after save/cancel |

## Role-aware entry and exit flow

```text
Public page → Login → role check
                       ├─ Client → /client/dashboard
                       ├─ Seller → /seller/dashboard
                       └─ Admin  → /admin/dashboard

Client → /client/become-seller → Seller role granted → /seller/dashboard
Any authenticated role → Logout → /login
```

## Implementation status

Only the public master page and a small set of public/request/pitch pages currently exist. The route entries marked “planned” document the target navigation and must be backed by an ASPX page plus VB.NET authorization before they are linked as active features.
