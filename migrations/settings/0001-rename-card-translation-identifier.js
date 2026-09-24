export default function migrate(settings) {
  const cards = settings.get("welcome_cards");
  if (cards) {
    settings.set(
      "welcome_cards",
      cards.map(({ translation_identifier, ...card }) => ({
        ...card,
        i18n_identifier: card.i18n_identifier ?? translation_identifier,
      }))
    );
  }
  return settings;
}
