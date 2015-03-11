//
function LandingPageController() {}

//
LandingPageController.prototype.bindEvenListeners = function () {
  $('#get-address').on('submit', this.getGeolocation.bind(this));
}
//
LandingPageController.prototype.getGeolocation = function () {
  console.log('meow');
}


$(document).ready(function () {
  var landingPageController = new LandingPageController();
  landingPageController.bindEvenListeners();
})
