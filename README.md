# Community welcome

A welcome panel above the topic list, with a heading, introduction, and editable
cards. Each card has a title, description, and a button leading to a page on your
forum.

## Configure the panel

Open **Welcome cards** in the component settings to add, remove, or reorder cards.
Replace the example button destinations with your own topics or categories. The
example destinations use existing Discourse routes so they work without creating
categories first.

Each card needs a unique **Identifier**, such as `introductions`.
Use lowercase letters, numbers, and underscores, starting with a letter. Keep the
identifier unchanged when editing text or reordering cards. When duplicating a
card, give the copy a new identifier.

## Translate the panel

The heading and introduction are ordinary theme translations from `locales/en.yml`:

- `welcome_heading`
- `welcome_message`

The card schema uses a required `identifier` property and marks each text field
with `translatable: true`. No `translations` declaration is needed:

```yaml
properties:
  identifier:
    type: string
    required: true
  title:
    type: string
    translatable: true
  description:
    type: string
    translatable: true
  button_text:
    type: string
    translatable: true
  destination:
    type: string
```

The component loops through the saved cards and translates those three fields.
For example, the first card's button uses
`welcome_cards.introductions.button_text`. `themePrefix` adds the installed
component's namespace, so the component never hard-codes a theme ID.

With the experimental core object-editor translation support, save your cards and
follow **Manage translations** to Site texts. The component filter includes both
the heading/introduction and the card text. Button destinations are not translated.

Object-editor translation management requires the accompanying core changes; it
is not supplied by this component alone. Without them, card text falls back to the
values saved in the object editor.

## Files

- `settings.yml`: default cards and the object-editor form.
- `locales/en.yml`: heading, introduction, and editor field labels.
- `javascripts/discourse/components/community-welcome.gjs`: translates and renders cards.
- `javascripts/discourse/api-initializers/community-welcome.gjs`: places the panel above the topic list.
- `common/common.scss`: responsive card layout using Discourse theme colors.
