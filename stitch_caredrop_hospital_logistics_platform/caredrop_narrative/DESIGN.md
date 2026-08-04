---
name: CareDrop Narrative
colors:
  surface: '#131313'
  surface-dim: '#131313'
  surface-bright: '#393939'
  surface-container-lowest: '#0e0e0e'
  surface-container-low: '#1c1b1b'
  surface-container: '#201f1f'
  surface-container-high: '#2a2a2a'
  surface-container-highest: '#353534'
  on-surface: '#e5e2e1'
  on-surface-variant: '#d3c4b1'
  inverse-surface: '#e5e2e1'
  inverse-on-surface: '#313030'
  outline: '#9c8f7e'
  outline-variant: '#4f4537'
  surface-tint: '#f5bd60'
  primary: '#f7bf62'
  on-primary: '#432c00'
  primary-container: '#d9a44a'
  on-primary-container: '#583b00'
  inverse-primary: '#7f5700'
  secondary: '#5de6ff'
  on-secondary: '#00363e'
  secondary-container: '#00cbe6'
  on-secondary-container: '#00515d'
  tertiary: '#51e0a5'
  on-tertiary: '#003824'
  tertiary-container: '#29c48b'
  on-tertiary-container: '#004b32'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#ffdead'
  primary-fixed-dim: '#f5bd60'
  on-primary-fixed: '#281900'
  on-primary-fixed-variant: '#604100'
  secondary-fixed: '#a2eeff'
  secondary-fixed-dim: '#2fd9f4'
  on-secondary-fixed: '#001f25'
  on-secondary-fixed-variant: '#004e5a'
  tertiary-fixed: '#6ffbbe'
  tertiary-fixed-dim: '#4edea3'
  on-tertiary-fixed: '#002113'
  on-tertiary-fixed-variant: '#005236'
  background: '#131313'
  on-background: '#e5e2e1'
  surface-variant: '#353534'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  title-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.05em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  gutter: 16px
  margin-mobile: 16px
  margin-desktop: 32px
  container-max: 1280px
---

## Brand & Style

The design system is a sophisticated, dark-mode-first framework tailored for high-stakes hospital logistics. It rejects the stereotypical "clinical" aesthetic of white surfaces and blue accents in favor of a calm, premium, and human-centric environment. 

The style is **Corporate Modern** with **Tactile** influences. It utilizes deep charcoal foundations to reduce eye strain for healthcare workers operating in varying lighting conditions. The primary emotional response is one of "commanding calm"—the UI should feel like a reliable partner that handles complex coordination with quiet efficiency. High-quality whitespace, soft-touch surfaces, and intentional amber accents create a sense of warmth and reliability without resorting to loud, distracting visuals.

## Colors

This design system uses a curated palette optimized for deep-dark environments. The **Background** (#121212) serves as the anchor, providing a non-distracting canvas. 

- **Primary Accent (Amber):** Used for critical calls to action, active navigation states, and trust-based badges. It represents human warmth and high-value logistics.
- **Surface Tiers:** Surfaces are layered using #1E1E1E (Tier 1) and #2C2C2C (Tier 2/Active) to create intuitive visual hierarchies.
- **Semantic Logic:**
    - **Live Tracking (Cyan):** Used specifically for active movements and real-time data flow.
    - **Success (Green):** Indicates completed deliveries or validated tasks.
    - **Destructive (Red/Rose):** Reserved for cancellations or high-priority warnings.
- **Content:** Text is primarily off-white (#F5F5F5) to maintain high contrast while avoiding the harshness of pure white on black.

## Typography

The typography system relies on **Inter** for its exceptional legibility at small sizes and its clean, professional character. 

- **Hierarchy:** Headlines use heavy weights (700) and tighter letter spacing to establish a clear, authoritative "Command Center" feel. 
- **Body Text:** Designed for rapid scanning. Line heights are generous (1.5x) to ensure logistical data is easily digestible under pressure.
- **Labels:** Meta-data, timestamps, and IDs use semi-bold, slightly tracked-out uppercase styles to differentiate technical data from human narrative.

## Layout & Spacing

This design system uses a **Fluid Grid** model built on an 8px rhythm. 

- **Structure:** A 12-column grid is used for desktop environments, reflowing to a 4-column grid on mobile devices.
- **Margins & Gutters:** Mobile layouts utilize 16px margins to maximize screen real estate for data, while desktop layouts expand to 32px to provide a more "spacious" and calm experience.
- **Safe Zones:** High-touch areas (like action buttons in the logistics flow) must maintain a minimum 48px hit area regardless of visual size to accommodate users in fast-paced or gloved environments.

## Elevation & Depth

Hierarchy is established through **Tonal Layering** supplemented by **Ambient Shadows**. 

- **Surface Levels:** As elements increase in functional priority (e.g., a modal appearing over a list), they become lighter in color. The base is #121212; elevated cards are #1E1E1E.
- **Shadows:** Shadows are extremely subtle, using a deep #000000 at 40% opacity with a large blur radius (16px to 24px). This creates a "soft lift" rather than a hard edge, contributing to the "care" aspect of the brand.
- **Glints:** On active primary elements (like the Amber buttons), a 1px inner border at 10% white opacity is used on the top edge to simulate a subtle physical light source.

## Shapes

The shape language is defined by significant **Roundedness**. This choice softens the "technical" nature of logistics software, making the platform feel more approachable and modern.

- **Standard Elements:** Buttons and small input fields use a 0.5rem (8px) radius.
- **Containers:** Dashboard cards and large panels use `rounded-xl` (1.5rem / 24px) to create a distinct, friendly containerized look. 
- **Icons:** Always use rounded caps and joins to match the outer radius of the UI components.

## Components

- **Buttons:** Primary buttons are filled with CareDrop Gold (#D9A44A) with dark text. Secondary buttons use a subtle "Ghost" style with an Amber outline. All buttons have a minimum height of 48px for accessibility.
- **Cards:** Cards are the primary organizational unit. They use a #1E1E1E background and a 1px border of #2C2C2C to maintain definition without relying on harsh shadows.
- **Inputs:** Text fields use a solid dark background (#181818) with a 2px bottom-border highlight when focused (using the Primary Accent color).
- **Chips/Badges:** Status indicators (Live, Pending, Success) use "Subtle Fill" logic—a low-opacity version of the semantic color with a high-opacity text label for maximum readability.
- **Progress Tracking:** A custom "Live Path" component uses a Cyan (#22D3EE) glowing pulse to indicate active hospital logistics movements.
- **Lists:** List items are separated by subtle 1px dividers (#2C2C2C) and feature "Large Touch Targets" where the entire row is interactive for dispatching or updating status.