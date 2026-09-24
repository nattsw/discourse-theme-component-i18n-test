export default function migrate(settings) {
  const cards = settings.get("welcome_cards");
  if (cards) {
    settings.set(
      "welcome_cards",
      cards.map(({ i18n_identifier, ...card }) => ({
        ...card,
        identifier: card.identifier ?? i18n_identifier,
      }))
    );
  }
  return settings;
}
