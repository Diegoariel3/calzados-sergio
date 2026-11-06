---
name: Calzado Sergio
description: Product-first sport and everyday footwear storefront with practical inventory administration.
colors:
  ink: "#071b2b"
  teal: "#167d8d"
  ice: "#b9e4e8"
  paper: "#eeeeee"
  canvas: "#f8f9f8"
  white: "#ffffff"
  muted: "#4b6470"
  line: "#c9d3d5"
  field-border: "#b3c4c9"
  admin-canvas: "#f1f4f3"
  error: "#9a3333"
typography:
  display:
    fontFamily: "Barlow Condensed, sans-serif"
    fontSize: "clamp(140px, 25vw, 380px)"
    fontWeight: 800
    lineHeight: 0.85
    letterSpacing: "-0.025em"
  headline:
    fontFamily: "DM Sans, sans-serif"
    fontSize: "clamp(44px, 5.5vw, 80px)"
    fontWeight: 700
    lineHeight: 0.98
    letterSpacing: "-0.045em"
  body:
    fontFamily: "DM Sans, sans-serif"
    fontSize: "14px"
    lineHeight: 1.65
  product-title:
    fontFamily: "DM Sans, sans-serif"
    fontSize: "14px"
    fontWeight: 600
rounded:
  square: "0"
  pill: "40px"
  hero-pill: "50px"
  circle: "50%"
spacing:
  small: "8px"
  medium: "16px"
  gutter: "22px"
  panel: "24px"
  form-panel: "26px"
components:
  button-primary:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.white}"
    rounded: "{rounded.square}"
    padding: "14px 22px"
  button-primary-hover:
    backgroundColor: "{colors.teal}"
    textColor: "{colors.white}"
  button-secondary:
    backgroundColor: "{colors.white}"
    textColor: "{colors.ink}"
    rounded: "{rounded.square}"
    padding: "10px 15px"
  button-light:
    backgroundColor: "{colors.ice}"
    textColor: "{colors.ink}"
    padding: "14px 22px"
  category-chip:
    textColor: "{colors.ink}"
    rounded: "{rounded.pill}"
    padding: "9px 16px"
  category-chip-selected:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.white}"
  field:
    backgroundColor: "{colors.white}"
    textColor: "{colors.ink}"
    rounded: "{rounded.square}"
    padding: "12px"
  product-image:
    backgroundColor: "{colors.paper}"
    width: "100%"
  badge:
    backgroundColor: "{colors.ice}"
    textColor: "{colors.ink}"
    padding: "6px 9px"
---

# Design System: Calzado Sergio

## Overview

**Creative North Star: "Amble editorial product stage"**

The user-pinned Amble reference becomes a product-first editorial stage: oversized condensed lettering, a central footwear cutout, generous light space and a restrained navy/teal palette. The identity is energetic and direct; everyday copy and controls stay in DM Sans.

The storefront combines Persuade and Operate: expressive product discovery leads into explicit filters, variants and an order flow. Administration is Operate: compact tables, inventory rows and publication controls prioritize reading and editing.

**Key Characteristics:**

- Oversized product-stage typography with isolated product imagery.
- Flat paper surfaces, navy structure and teal interaction accents.
- Square actions and fields, rounded category pills and color swatches.
- Responsive catalogue and compact task-focused administration.

## Colors

Navy anchors the shop, teal signals interaction, ice provides a cool accent, and paper grounds product photography. The first four tokens are the user's pinned palette; supporting colors come from the implementation.

- **Ink:** primary text, hero lettering, primary actions, collection band, footer and admin navigation.
- **Teal:** primary-button hover, emphasis, active admin navigation, focus rings and input carets.
- **Ice:** marquee, light actions, badges, text on dark surfaces and selection backgrounds.
- **Paper:** hero and product-photo planes.
- **Canvas / white:** page background and transactional surfaces respectively.
- **Muted / line / field-border:** secondary text, structural dividers and editable field outlines.
- **Admin canvas:** quiet background separating the white table and form surfaces.
- **Error:** order or loading errors; messages remain textual rather than color-only.

## Typography

Barlow Condensed and DM Sans are self-hosted with `font-display: swap`. The condensed display face is reserved for the hero's MOVETE. word; DM Sans carries navigation, headings, product metadata, forms and administration.

The display token is the desktop hero size; at 700px and below it becomes 27vw. Section headlines use the headline token and become 51px on mobile. Product titles are 14px/600, reducing to 12px on mobile. Base copy is 14px, while purpose-specific metadata and labels generally use 10–13px. Admin headings are 43px, reducing to 31px on mobile. Feature counters and admin statistics use tabular numerals.

## Layout

Desktop navigation and hero use 3% horizontal insets; sections and collection use 4%. Store sections have 88px vertical padding. The product grid has four equal columns with a 22px gutter; below 1100px the gutter becomes 15px. At 700px and below it becomes two columns with 28px row and 12px column gaps; sections use 55px vertical padding and 5% insets.

The hero stage is 550px tall, 650px from 1600px, 440px below 1100px and 330px on mobile. The final footwear cutout rule uses 68% width and 93% height, growing to 110% width and 90% height on mobile; clothing uses its own narrower silhouette. The selection arrows are manual controls.

Administration uses a 220px sticky sidebar and flexible content column, narrowing the sidebar to 185px below 1100px. At 700px navigation becomes a wrapping horizontal header. Form editing has a flexible main column plus a 290px sticky publication column, collapsing at 1100px. Wide tables retain horizontal overflow.

The product detail is a two-column 1050px dialog capped at 92vh; on mobile it becomes a full-height single-column surface. The cart is a right-side drawer, up to 530px wide.

## Elevation & Depth

The interface is flat by default: background shifts and 1px borders establish hierarchy. Product cards have no enclosing shadow or raised container. The hero cutout alone carries `drop-shadow(8px 25px 16px #071b2b20)` to separate it from the oversized word. Circular hero swatches use `0 0 0 1px #9bb0b4`. Dialogs and drawers sit over a `#071b2b80` scrim; the sticky navigation uses z-index 20 and overlays use 50.

Motion consists of a 0.8s product-entry translation/rotation with `cubic-bezier(.16,1,.3,1)`, a 0.35s product-image hover transform and 0.2s color/background transitions. `prefers-reduced-motion: reduce` disables animation, transitions and smooth scrolling.

## Shapes

Primary actions, secondary actions, inputs, image planes, dialogs and form sections remain square. Category filters use 40px pills; the hero selector uses 50px pills. Color swatches and compact product arrows are circular. Borders are thin structural rules, not decorative frames around every product.

## Components

- **Buttons:** square ink/white primary actions, 48px minimum height and 14px 22px padding; hover becomes teal/white. Secondary actions are white with a line border, 40px minimum height and 10px 15px padding, becoming ice on hover. Light collection actions use ice/ink. Disabled buttons reduce opacity to 0.4 and use a not-allowed cursor.
- **Category chips:** 12px labels, 9px 16px padding and a line border. Selection uses ink fill and white text. Mobile chips use 10px labels and 8px 12px padding.
- **Product cards:** square paper image planes, contain-fit images and metadata beneath. Photos scale to 1.06 and rotate -3deg on hover. A quiet sample/sale tag sits top-left; a circular arrow sits bottom-right. Category, name, price, colors and available size count remain visible.
- **Inputs:** square white fields with 12px padding and field-border outlines in checkout and administration. Catalogue search is a borderless inline field. Native selects and checkboxes retain accessible semantics; checkboxes use teal accent.
- **Navigation:** light sticky shop header with compact DM Sans links and bag action. The ink admin sidebar uses ice text and a teal active item. Mobile shop links occupy a separate full-width row.
- **Badges and messages:** ice publication badges and admin notices; sample messages explicitly distinguish demonstration inventory. Error copy uses the error token.
- **Detail choices:** outlined color/size buttons become ink/white when chosen. Disabled sizes are struck through. Detail and cart surfaces use native controls, Escape dismissal, keyboard containment and body scroll locking.
- **Admin tables and forms:** white surfaces, pale header rows, line-separated data, contained thumbnails and compact text. Variant rows keep color, swatch, size, SKU and stock aligned; publication actions sit together.

All interactive controls use a 3px teal `:focus-visible` outline with 4px offset. Preserve meaningful button labels, field labels, dialog semantics and textual status messages.

## Do's and Don'ts

### Do

- Do preserve the user-pinned Amble product-stage direction and navy/teal/ice/paper palette.
- Do use Barlow Condensed 800 for MOVETE. and DM Sans for the remaining interface.
- Do retain visible teal keyboard focus, explicit field labels and reduced-motion behavior.
- Do keep example inventory visibly marked as Muestra and prices clearly identified as samples.
- Do use tabular numerals for feature counters and admin inventory totals.

### Don't

- Don't turn administrative tables into promotional cards.
- Don't apply product-stage display typography to forms, body copy or tables.
- Don't invent store policies, commercial promises, phone numbers or real inventory.
- Don't replace square primary controls with universally rounded cards and buttons.

## Hero and brand ribbon update
The featured stage prioritizes apparel and uses an isolated white sample t-shirt with alpha transparency. The ice brand ribbon reads distinct brands from published, non-demo catalogue products. Until real brands exist it repeats the existing shop slogans, without inventing stocked brands. The seamless CSS loop has a pause button, pauses on hover/focus, outside the viewport and when the tab is hidden; reduced motion presents static content.

Confirmed ribbon brands from user-provided storefront photos and message: Adidas, Nike, Gaelle, Olympikus, Fila, Topper, Ringo. These remain visible alongside additional brands from real published products. The cropped far-right sign is not included because its name cannot be read reliably.

The brand ribbon uses logo image assets only, with no text labels or arrow separators. Logos retain accessible alt text, contain-fit proportions and consistent optical sizing. Assets: Adidas and Topper extracted from official inline SVGs, Nike from Simple Icons, Olympikus paths from its official logo component, Fila, Gaelle and Ringo from their official shop assets.

### Navbar and featured carousel refinement
The storefront navbar reads CALZADOS above sergio in visual and DOM order. The sidebar/footer retain their prior treatment. Featured products rotate every 3000 ms with a pause/resume button; hovering the hero, opening a dialog, hiding the document or leaving the viewport suspends rotation. Reduced-motion users retain manual navigation. All featured artwork uses a single centered contain frame (desktop 74% capped at 850px by 80% stage height; mobile 82% by 76%). Known transparent product sources use measured content viewBoxes so empty pixels do not make individual products appear smaller. Original aspect ratios and asset files remain intact.
