const { select, onDOMReady, logout, getUser } = window.Helpers;

onDOMReady(() => {
  const user = getUser();

  if (!user || user.userRole != "ADMIN") {
    location.href = "/";
  }
});
