# Community resources

A local theme component for testing object-editor content with dynamically derived
translation keys. Resources appear above discovery topic lists, including category
lists. Edit **Resource sections** in the component settings to add sections and
nested links with a label, description, URL, and icon.

## Locale-backed theme text

The introductory sentence above the resources uses `resource_intro` from
`locales/en.yml`, rendered with `i18n(themePrefix("resource_intro"))`. It appears
in Site texts alongside object-editor fields and retains `ThemeTranslationOverride`
storage. The theme settings page links to Site texts for editing and AI translation.

Use it to test translating a shipped default and a site-specific English override
alongside the dynamic object-editor fields below.

## Object-editor text

Each section and link has a manually assigned stable `key`. Use lowercase letters,
numbers, and underscores, with unique section keys and unique link keys within each
section. Changing text or reordering objects preserves translations; duplicating an
object requires a new key.

The schema declares the identifier property and translatable fields using
`translations: { key: key, fields: [label, description] }`. Core supplies
the theme namespace and setting name; no custom prefix is needed.

The component loops through sections and links and translates these relative keys:

- `resource_sections.<section>.title`
- `resource_sections.<section>.<link>.label`
- `resource_sections.<section>.<link>.description`

For example:

```js
i18n(themePrefix(`resource_sections.${section.key}.${link.key}.label`), {
  defaultValue: link.label,
});
```

`themePrefix` scopes keys to this component's installed theme ID. Multiple copies
can use identical settings and object identifiers without sharing translations.
The editor previews the relative keys to pass to `themePrefix`.

Saving the settings registers the default text in Site texts through the local
core extension. **Manage translations** opens the component's Site texts view,
which includes both these fields and `resource_intro`. Default text changes mark
translations outdated; removing an object removes its registered translations.
**Translate** covers both the registered fields and the locale-file introduction.
Existing translations, including shipped locale-file translations, are preserved
unless **Override existing translations** is selected.

This testing component requires the local core object-editor translation feature.
Theme components themselves contain no Ruby registration code.

## Development

Run `pnpm install` to install the lint tools. Run `discourse_theme watch .` against
your development site to upload the component and sync edits. The CLI prints the
preview and settings URLs for the installed component.
