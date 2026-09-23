# Community resources

A local theme component for testing object-editor content with dynamically derived
translation keys. Resources appear above discovery topic lists, including category
lists. Edit **Resource sections** in the component settings to add sections and
nested links with a label, description, URL, and icon.

## Locale-backed theme text

The introductory sentence above the resources uses `resource_intro` from
`locales/en.yml`, rendered with `i18n(themePrefix("resource_intro"))`. It appears
in the component's standard translation controls and supports
`ThemeTranslationOverride`, including the existing AI Translate action.

Use it to test translating a shipped default and a site-specific English override
alongside the dynamic object-editor fields below.

## Keys and source text

Each section and link has a manually assigned stable `key`. Use lowercase letters,
numbers, and underscores, with unique section keys and unique link keys within each
section. Changing text or reordering objects preserves translations; duplicating an
object requires a new key. Automatic persisted IDs are a future core integration,
not something this prototype provides.

The component derives these global frontend keys:

- `community_resources.<section>.title`
- `community_resources.<section>.<link>.label`
- `community_resources.<section>.<link>.description`

For example, `community_resources.getting_started.guidelines.label` uses the source
label from the object editor as its `defaultValue`. These are global lookups, not
`themePrefix` lookups or keys declared in theme locale YAML. The prototype reserves
`community_resources` for this component; multiple independent copies would need
separate namespaces.

The object editor's read-only **Usable translation keys** block updates as you edit
the section or link translation key. **Default title**, **Default label**, and
**Default description** provide the source text used when no translation exists.
The live preview depends on the local core extension that reads
`translation_key_preview` schema metadata. The root schema supplies the
`community_resources` prefix; each ancestor and current object's `key` contributes
one segment, followed by a field from `fields`. This metadata displays the keys;
it does not register them in Site texts or create translations.

## Local console experiment

On a disposable development site, create a previously unused override:

```ruby
TranslationOverride.upsert!(
  "fr",
  "js.community_resources.getting_started.guidelines.label",
  "Règles de la communauté",
)
```

The `js.` prefix is required for server-side client translation delivery. Open the
site in French and reload to compare the translated label with the source fallback
for the other fields. The site must allow user locale selection to test through
user preferences. The component itself does not change site settings or users.

This is deliberately a temporary experiment. Site texts still does not discover
these custom keys, and override updates or the scheduled translation cleanup may
mark an override deprecated because there is no shipped original. Theme
installation does not register these keys or create override records. There is no
AI action, source-change tracking, automatic cleanup, or production-ready custom
translation lifecycle in this component.

## Development

Run `pnpm install` to install the lint tools. Run `discourse_theme watch .` against
your development site to upload the component and sync edits. The CLI prints the
preview and settings URLs for the installed component.
