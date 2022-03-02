console.log('START')
document.addEventListener('DOMContentLoaded', () => {
  var data = document.getElementById('shopify-app-init').dataset;
  var AppBridge = window['app-bridge'];
  var createApp = AppBridge.default;
  window.app = createApp({
    apiKey: data.apiKey,
    shopOrigin: data.shopOrigin,
  });

  var actions = AppBridge.actions;
  var TitleBar = actions.TitleBar;
  TitleBar.create(app, {
    title: data.page,
  });
});




// var data = document.getElementById('shopify-app-init').dataset;
// var AppBridge = window['app-bridge'];
// var createApp = AppBridge.default;
// window.app = createApp({
//   apiKey: data.apiKey,
//   // host: data.host,
//   shopOrigin: data.shopOrigin,
// });
// console.log('11111111111111111111111')
// var actions = AppBridge.actions;
// var TitleBar = actions.TitleBar;
// TitleBar.create(app, {
//   title: data.page,
// });
