/* Progressive enhancement: navigation and catalogue remain usable without JS. */
(() => {
  const toggle = document.querySelector('.menu-toggle');
  const panel = document.querySelector('.nav-panel');
  if (toggle && panel) {
    toggle.hidden = false;
    panel.classList.add('is-collapsible');
    const close = () => { toggle.setAttribute('aria-expanded', 'false'); panel.classList.remove('is-open'); };
    toggle.addEventListener('click', () => {
      const open = toggle.getAttribute('aria-expanded') !== 'true';
      toggle.setAttribute('aria-expanded', String(open));
      panel.classList.toggle('is-open', open);
    });
    panel.addEventListener('keydown', event => {
      if (event.key === 'Escape') { close(); toggle.focus(); }
    });
    document.addEventListener('click', event => {
      if (!event.target.closest('.site-header')) close();
    });
    matchMedia('(min-width: 1100px)').addEventListener('change', close);
  }
  document.querySelectorAll('.nav-search').forEach(form => { form.hidden = false; });
  const search = document.querySelector('.archive-search');
  if (!search) return;
  search.hidden = false;
  const form = document.querySelector('#archive-search-form');
  const query = document.querySelector('#archive-query');
  const kind = document.querySelector('#archive-kind');
  const results = document.querySelector('.search-results');
  const entries = [...document.querySelectorAll('.search-entry')];
  const status = document.querySelector('#search-status');
  const empty = document.querySelector('#search-empty');
  const params = new URLSearchParams(location.search);
  query.value = (params.get('q') || '').slice(0, 160);
  if (['all', 'resource', 'archive-category'].includes(params.get('kind'))) kind.value = params.get('kind');
  const update = () => {
    const words = query.value.trim().toLocaleLowerCase().split(/\s+/).filter(Boolean);
    const active = words.length > 0 || kind.value !== 'all';
    let count = 0;
    entries.forEach(entry => {
      const text = entry.textContent.toLocaleLowerCase();
      const visible = (kind.value === 'all' || entry.dataset.kind === kind.value) && words.every(word => text.includes(word));
      entry.hidden = !visible;
      if (visible) count++;
    });
    results.hidden = !active;
    empty.hidden = !active || count > 0;
    status.textContent = active ? `${count} matching ${count === 1 ? 'entry' : 'entries'}.` : 'Browse collections below, or search the catalogue.';
  };
  query.addEventListener('input', update);
  kind.addEventListener('change', update);
  form.addEventListener('submit', event => {
    event.preventDefault(); update();
    const url = new URL(location.href);
    url.searchParams.set('q', query.value.trim());
    url.searchParams.set('kind', kind.value);
    history.replaceState(null, '', url);
  });
  update();
})();
