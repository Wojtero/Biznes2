{*
 * This file allows you to customize your search page.
 * You can safely remove it if you want it to appear exactly like all other product listing pages
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name="error_content"}
  <h4>{l s='Brak produktu' d='Shop.Theme.Catalog'}</h4>
  <p>{l s='Użyj innych słów do opisania szukanego produktu.' d='Shop.Theme.Catalog'}</p>
{/block}
