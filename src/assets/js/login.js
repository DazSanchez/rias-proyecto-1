const {
  select,
  onEvent,
  onDOMReady,
  onValueChange,
  toggleClassMultiple,
  valueGetter,
  onFormSubmit
} = window.Helpers;

const login = body => {
  return fetch("/api/controladores/iniciar_sesion.php", {
    method: "POST",
    body: JSON.stringify(body)
  }).then(res => res.json());
};

onDOMReady(() => {
  const form = select("#login-form");
  const getUsername = valueGetter(select("#username"));
  const getPwd = valueGetter(select("#password"));

  onFormSubmit(form, () => {
    console.log("lorem");
    const username = getUsername();
    const pwd = getPwd();

    login({ username, pwd })
      .then(user => {
        localStorage.setItem("user", JSON.stringify(user));
        location.href = "/";
      })
      .catch(console.error);
  });
});
