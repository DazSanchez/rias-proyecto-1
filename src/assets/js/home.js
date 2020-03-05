/**
 * @author hsanchez
 */

const {
  select,
  toggleClass,
  onEvent,
  onDOMReady,
  onValueChange,
  toggleClassMultiple,
  valueGetter,
  toQueryParams,
  htmlSetter,
  logout,
  authenticate
} = window.Helpers;

const FILTER_KIND = {
  TYPE: 1,
  STYLE: 2
};

const createItem = ({ url, title, price }) => {
  return `
    <div class="col-xs col-sm-6 col-lg-3 mb-3">
        <div class="card">
            <img class="card-img-top" src="${url}" alt="${title}">
            <div class="card-body">
            <h5 class="card-title">${title}</h5>
            <p class="card-text">$${Number(price).toFixed(2)}</p>
            <button class="btn button-primary btn-block">
                <i class="la la-cart-plus"></i>
                Agregar al carrito
            </button>
            </div>
        </div>
    </div>`;
};

const toggleLoading = () => {
  const toggle = toggleClassMultiple([
    select("#loader"),
    select("#catalog-results")
  ]);

  toggle("d-none");

  return () => {
    toggle("d-none");
  };
};

const renderResults = items => {
  const container = select("#catalog-results");
  htmlSetter(container)(
    items ||
      '<h3 class="text-muted my-5 text-center">No hay resultados para esta b&uacute;squeda</h3>'
  );
};

const getCatalog = filters => {
  const params = toQueryParams(filters);
  return fetch(`/api/controladores/catalogo_productos.php?${params}`)
    .then(res => res.json())
    .then(res => res.map(createItem).join(" "))
    .catch(() => alert("Ha ocurrido un error haciendo la petición."));
};

const setupFormToggle = ({ form }) => {
  const filterToggle = select("#toggle-filters");
  const toggleBtn = toggleClass(filterToggle);
  const toggle = toggleClass(form);

  onEvent("click", filterToggle, () => {
    toggle("show");
    toggleBtn("button-primary");
  });
};

const setupFilterSelection = ({ kind, type, style }) => {
  const toggle = toggleClassMultiple([type.parentElement, style.parentElement]);

  onValueChange(kind, () => {
    toggle("d-none");
  });
};

const setupFilterTrigger = ({ kind, type, style }) => {
  const getKind = valueGetter(kind);
  const getType = valueGetter(type);
  const getStyle = valueGetter(style);

  const handler = filters => {
    const loaded = toggleLoading();
    getCatalog(filters).then(results => {
      renderResults(results);
      loaded();
    });
  };

  onValueChange(type, () => {
    handler({ filter: getKind(), q: getType() });
  });
  onValueChange(style, () => {
    handler({ filter: getKind(), q: getStyle() });
  });
  onValueChange(kind, () => {
    handler({
      filter: getKind(),
      q: getKind() == FILTER_KIND.TYPE ? getType() : getStyle()
    });
  });
};

const setupFilterForm = () => {
  const form = select("#filter-form");
  const filterKind = select("#kind-filter");
  const filterType = select("#type-filter");
  const filterStyle = select("#style-filter");

  const inputs = {
    kind: filterKind,
    style: filterStyle,
    type: filterType
  };

  setupFormToggle({ form });
  setupFilterSelection(inputs);
  setupFilterTrigger(inputs);

  const loaded = toggleLoading();

  getCatalog({ filter: 1, q: 1 }).then(results => {
    renderResults(results);
    loaded();
  });
};

onDOMReady(() => {
  const callToAction = select("#call-to-action");
  const catalog = select("#catalog");

  onEvent("click", callToAction, () => {
    window.scrollTo({
      behavior: "smooth",
      top: catalog.offsetTop - 64
    });
  });

  setupFilterForm();

  authenticate();
});
