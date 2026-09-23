import Component from "@glimmer/component";
import dIcon from "discourse/ui-kit/helpers/d-icon";
import { i18n } from "discourse-i18n";

function localized(key, source) {
  return i18n(`community_resources.${key}`, {
    defaultValue: source || "",
  });
}

export default class ObjectResources extends Component {
  get sections() {
    return settings.resource_sections.map((section) => ({
      title: localized(`${section.key}.title`, section.title),
      links: (section.links || []).map((link) => ({
        ...link,
        label: localized(`${section.key}.${link.key}.label`, link.label),
        description: localized(
          `${section.key}.${link.key}.description`,
          link.description
        ),
      })),
    }));
  }

  <template>
    {{#if this.sections.length}}
      <div class="object-resources" ...attributes>
        <p class="object-resources__intro">
          {{i18n (themePrefix "resource_intro")}}
        </p>
        {{#each this.sections as |resourceSection|}}
          {{#if resourceSection.links.length}}
            <section class="object-resources__section">
              <h2 class="object-resources__title">{{resourceSection.title}}</h2>
              <ul class="object-resources__links">
                {{#each resourceSection.links as |link|}}
                  <li class="object-resources__item">
                    <a class="object-resources__link" href={{link.url}}>
                      {{dIcon link.icon}}
                      {{link.label}}
                    </a>
                    {{#if link.description}}
                      <p
                        class="object-resources__description"
                      >{{link.description}}</p>
                    {{/if}}
                  </li>
                {{/each}}
              </ul>
            </section>
          {{/if}}
        {{/each}}
      </div>
    {{/if}}
  </template>
}
