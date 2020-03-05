(w => {
  const select = q => document.querySelector(q);

  const toggleClass = el => className => {
    el.classList.toggle(className);
  };

  const toggleClassMultiple = els => className => {
    els.forEach(el => el.classList.toggle(className));
  };

  const onEvent = (event, el, handler) => {
    el.addEventListener(event, e => {
      handler(e);
    });
  };

  const onDOMReady = handler => {
    onEvent("DOMContentLoaded", w, handler);
  };

  const valueGetter = el => () => el.value;

  const onValueChange = (el, handler) => {
    onEvent("change", el, e => {
      handler(e.target.value);
    });
  };

  const toQueryParams = obj => {
    return Object.entries(obj)
      .map(([k, v]) => `${k}=${v}`)
      .join("&");
  };

  const htmlSetter = el => html => {
    el.innerHTML = html;
  };

  onFormSubmit = (form, handler) => {
    form.addEventListener("submit", e => {
      e.preventDefault();
      handler();
    });
  };

  const getUser = () => {
    const user = localStorage.getItem("user");
    return user ? JSON.parse(user) : null;
  };

  const logout = () => {
    localStorage.clear();
    location.href = "/";
  };

  const authenticate = () => {
    const user = getUser();

    if (user) {
      const usernameDisplay = select("#username-display");
      const username = select("#username");
      const adminAdd = select("#admin-add");
      const links = select("#access-links");
      const logoutBtn = select("#logout-btn");

      toggleClassMultiple([usernameDisplay, links, logoutBtn])("d-none");

      username.innerText = user.username;

      if (user.userRole == "ADMIN") {
        toggleClass(adminAdd)("d-none");
      }
    }
  };

  onDOMReady(() => {
    const btn = select("#logout-btn");
    onEvent("click", btn, () => {
      logout();
    });
  });

  w.Helpers = {
    select,
    toggleClass,
    onEvent,
    onDOMReady,
    onValueChange,
    toggleClassMultiple,
    valueGetter,
    toQueryParams,
    htmlSetter,
    onFormSubmit,
    logout,
    authenticate,
    getUser
  };
})(window);
