import Component from "@glimmer/component";
import { i18n } from "discourse-i18n";

function translateCardField(card, field) {
  return i18n(themePrefix(`welcome_cards.${card.translation_key}.${field}`), {
    defaultValue: card[field] || "",
  });
}

export default class CommunityWelcome extends Component {
  get cards() {
    return settings.welcome_cards.map((card) => ({
      ...card,
      title: translateCardField(card, "title"),
      description: translateCardField(card, "description"),
      button_text: translateCardField(card, "button_text"),
    }));
  }

  <template>
    <section class="community-welcome" ...attributes>
      <h2 class="community-welcome__heading">
        {{i18n (themePrefix "welcome_heading")}}
      </h2>
      <p class="community-welcome__introduction">
        {{i18n (themePrefix "welcome_message")}}
      </p>

      {{#if this.cards.length}}
        <div class="community-welcome__cards">
          {{#each this.cards as |card|}}
            <article class="community-welcome__card">
              <h3 class="community-welcome__title">{{card.title}}</h3>
              {{#if card.description}}
                <p
                  class="community-welcome__description"
                >{{card.description}}</p>
              {{/if}}
              <a
                class="community-welcome__button btn btn-primary"
                href={{card.destination}}
              >
                {{card.button_text}}
              </a>
            </article>
          {{/each}}
        </div>
      {{/if}}
    </section>
  </template>
}
