"use strict"
//
function LandingPageController() {}

//
LandingPageController.prototype.bindEvenListeners = function () {
  $('#get-address').on('submit', this.getGeolocation.bind(this));
}
//
LandingPageController.prototype.getGeolocation = function (e) {
  e.preventDefault();
  var formattedAddress;
  formattedAddress = $('#get-address').serialize();

  $.ajax({
    url: '/geocode_address',
    method: 'post',
    data: {formattedAddress: formattedAddress}
  }).done(function(data){
    console.log(data);
  }).fail(function(data){
    console.log(data);
  });
};

$(document).ready(function () {
  var landingPageController = new LandingPageController();
  landingPageController.bindEvenListeners();
})
