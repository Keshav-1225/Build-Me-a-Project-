# Build Me A Project — Theme & Typography

This document defines the visual language used throughout the **Build Me A Project** prototype. Styling is implemented with Tailwind CSS utilities. The UI is designed for a fixed desktop demonstration environment; responsive variants are not part of this theme.

## Design Direction

The interface is clean, approachable, and marketplace-focused. It pairs cool slate neutrals with a clear blue action colour, generous rounded corners, and restrained shadows. Bright gradients are reserved for project previews so that content, prices, and calls to action remain easy to scan.

## Typography

### Font family

Use Tailwind's `font-sans` utility for all interface text. No custom web font is configured. This uses Tailwind's default system sans-serif stack:

```text
ui-sans-serif, system-ui, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"
```

The system stack keeps text fast, clear, and familiar across the desktop browsers used for the prototype.

### Type scale

| Use | Tailwind utilities | Size / line height | Weight | Notes |
|---|---|---:|---:|---|
| Hero heading | `text-6xl font-extrabold tracking-tight` | 60px / 60px | 800 | Home page primary statement. |
| Page heading | `text-4xl font-bold tracking-tight` | 36px / 40px | 700 | Primary heading on list and detail pages. |
| Section heading | `text-3xl font-bold tracking-tight` | 30px / 36px | 700 | Major section and form headings. |
| Subsection heading | `text-2xl font-bold` | 24px / 32px | 700 | Detail-page subsections. |
| Card heading | `text-xl font-bold` | 20px / 28px | 700 | Request cards and panels. |
| Brand / large metadata | `text-lg font-bold` or `text-lg font-semibold` | 18px / 28px | 700 / 600 | Logo wordmark, introductory copy, and prominent ratings. |
| Body | default or `text-sm` | 16px / 24px or 14px / 20px | 400 | Use `leading-7` or `leading-8` for longer copy where present. |
| UI labels and buttons | `text-sm font-semibold` | 14px / 20px | 600 | Buttons, links, form labels, category labels. |
| Supporting metadata | `text-xs font-medium` | 12px / 16px | 500 | Tags, secondary card metadata, dividers. |

### Text hierarchy

- **Primary headings and key values:** `text-slate-950` (near-black) for the strongest contrast.
- **Default body text:** `text-slate-900` from the page body.
- **Supporting copy:** `text-slate-600`; use `text-slate-500` for quieter timestamps and counts.
- **Form labels:** `text-slate-700` with `font-semibold`.
- **Eyebrows and active links:** `text-blue-600`, generally `text-sm font-semibold`. Eyebrows may be uppercase in the markup when a more editorial feel is required.
- **Text on dark surfaces:** `text-white` for headings and actions; `text-slate-300` or `text-slate-400` for supporting text.
- **Rating text:** `text-amber-500`.

## Colour System

The project uses Tailwind's standard palette. The following tokens are the approved, currently used theme colours.

### Core surfaces and neutral palette

| Role | Tailwind token | Hex | Use |
|---|---|---|---|
| App background | `slate-50` | `#f8fafc` | Body background. |
| Surface | `white` | `#ffffff` | Header, footer, cards, inputs, and light buttons. |
| Strong surface / inverse | `slate-950` | `#020617` | Main dark calls to action and dark side panels. |
| Primary text | `slate-950` | `#020617` | Headings, key prices, and strong emphasis. |
| Base text | `slate-900` | `#0f172a` | Default body colour. |
| Secondary text | `slate-600` | `#475569` | Descriptions and navigation. |
| Tertiary text | `slate-500` | `#64748b` | Metadata. |
| Muted inverse text | `slate-300` / `slate-400` | `#cbd5e1` / `#94a3b8` | Supporting text on dark surfaces. |
| Subtle border / ring | `slate-200` | `#e2e8f0` | Card outlines and section dividers. |
| Input / stronger border | `slate-300` | `#cbd5e1` | Inputs and outlined buttons. |
| Soft divider | `slate-100` | `#f1f5f9` | Internal card and form dividers. |

### Brand, semantic, and accent colours

| Role | Tailwind token | Hex | Use |
|---|---|---|---|
| Brand / primary action | `blue-600` | `#2563eb` | Primary buttons, links, eyebrow labels, active hover accents. |
| Primary hover | `blue-700` | `#1d4ed8` | Hover state for filled primary buttons. |
| Link hover | `blue-800` | `#1e40af` | Hover state for text links. |
| Focus indicator | `blue-500` | `#3b82f6` | Input borders and focus rings. |
| Soft primary surface | `blue-50` | `#eff6ff` | Hover surface and technology tags. |
| Inverse accent | `blue-300` | `#93c5fd` | Eyebrow text on dark sections. |
| Positive status | `emerald-50` / `emerald-700` | `#ecfdf5` / `#047857` | Budget/status pills. |
| Rating | `amber-500` | `#f59e0b` | Star ratings only. |

### Project-preview gradients

Use vivid gradients only as decorative project thumbnails, never as the main page background or body text.

| Theme | Tailwind gradient |
|---|---|
| AI / study | `from-violet-500 via-blue-500 to-cyan-400` |
| Creator / open source | `from-emerald-500 via-teal-500 to-cyan-500` |
| Finance / new release | `from-orange-400 via-rose-500 to-fuchsia-600` |
| Work management | `from-slate-700 via-slate-600 to-sky-700` |
| Recipe / lifestyle | `from-pink-500 via-rose-400 to-orange-300` |
| Learning | `from-indigo-600 via-purple-600 to-pink-500` |

Apply gradients with `bg-gradient-to-br` and maintain white overlay text (`text-white`).

## Components and Interaction States

### Buttons

- **Primary:** `rounded-xl bg-blue-600 ... text-sm font-semibold text-white`; hover with `hover:bg-blue-700`.
- **Dark primary:** `rounded-xl bg-slate-950 ... text-white`; hover with `hover:bg-slate-800`.
- **Secondary / outlined:** `rounded-xl border border-slate-300 bg-white ... text-slate-700`; hover with `hover:border-blue-600 hover:text-blue-600`.
- **Light action on a dark surface:** `bg-white text-slate-950`; hover with `hover:bg-blue-50`.
- Use `transition` on interactive elements. Search submission controls also use `focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2`.

### Links and navigation

- Standard interactive text links use `font-semibold text-blue-600`, with `hover:text-blue-800` when a stronger hover distinction is needed.
- Main navigation starts as `text-slate-600 font-medium` and changes to `text-blue-600` on hover.
- Underlines are reserved for inline inverse links or explicit email links, not standard navigation.

### Cards, panels, and forms

- **Cards/panels:** `bg-white`, `rounded-2xl`, `shadow-sm`, and `ring-1 ring-slate-200`.
- **Featured request panel:** `bg-slate-950 text-white` with muted supporting copy.
- **Form controls:** `rounded-xl border border-slate-300`, a white or transparent background, and `focus:border-blue-500`. Placeholder text uses `placeholder:text-slate-400` where specified.
- **Category and status pills:** use `rounded-full`; category controls are white with a `slate-200` ring and switch to a `blue-600` fill on hover. Positive-budget pills use the emerald semantic pair.

### Shape, elevation, and spacing

- Prefer `rounded-xl` for buttons, fields, and small controls; use `rounded-2xl` for cards and form containers; use `rounded-3xl` for large feature sections.
- Use subtle elevation (`shadow-sm`) for standard surfaces. The search box and hovering project cards may use a stronger shadow (`shadow-lg`) to show priority or interaction.
- Keep dense interface copy at `text-sm`; give longer reading copy `leading-7` or `leading-8` for comfortable scanning.

## Usage Rules

1. Use the slate and blue system for the core interface; do not introduce unrelated brand colours for ordinary UI controls.
2. Reserve bright gradients for project imagery and reserve amber/emerald for their semantic purposes.
3. Maintain strong contrast: dark text on white/light surfaces, white text on `slate-950` and gradient surfaces.
4. Use the existing system sans-serif stack consistently; do not introduce a second display font without updating this document.
5. The application is desktop-first and fixed-width. Do not add responsive typography or Tailwind breakpoint variants unless a later requirement explicitly calls for them.
6. Add custom CSS only in `Assets/CSS/input.css`; never edit the generated `Assets/CSS/output.css` manually.
