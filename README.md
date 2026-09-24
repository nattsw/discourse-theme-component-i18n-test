# Community welcome

A welcome panel above the topic list, with a heading, introduction, and editable
cards. Each card has a title, description, and a button leading to a page on your
forum.

## Configure the panel

Open **Welcome cards** in the component settings to add, remove, or reorder cards.
Replace the example button destinations with your own topics or categories. The
example destinations use existing Discourse routes so they work without creating
categories first.

Each card needs a unique **Translation identifier**, such as `introductions`.
Use lowercase letters, numbers, and underscores, starting with a letter. Keep the
identifier unchanged when editing text or reordering cards. When duplicating a
card, give the copy a new identifier.

## Translate the panel

The heading and introduction are ordinary theme translations from `locales/en.yml`:

- `welcome_heading`
- `welcome_message`

The card schema declares its translatable text:

```yaml
translations:
  key: i18n_identifier
  fields: [title, description, button_text]
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

## Updating from Community resources

This version replaces `resource_sections` with `welcome_cards`. Existing resource
settings and translations are not migrated to the new cards. Record any content
or translations you want to keep before updating, then recreate them as welcome
cards.

## Identifier rename

The settings migration renames saved card properties from `translation_identifier`
to `i18n_identifier`, preserving the identifier values and generated translation keys.

The experimental core integration currently validates object translation keys before
running theme settings migrations. Updating an existing installation with saved cards
can therefore fail validation during this rename. Core needs to validate the migrated
settings; fresh installations are unaffected.

## Development

Run `pnpm install` to install the lint tools. Use `discourse_theme watch .` to sync
the component to your development site.
