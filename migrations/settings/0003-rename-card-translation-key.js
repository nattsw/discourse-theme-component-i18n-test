export default function migrate(settings) {
  const cards = settings.get("welcome_cards");
  if (cards) {
    settings.set(
      "welcome_cards",
      cards.map(({ identifier, ...card }) => ({
        ...card,
        translation_key: card.translation_key ?? identifier,
      }))
    );
  }
  return settings;
}
