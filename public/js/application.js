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
  var formValues;
  formValues = this.formatFormValues($('#get-address'));

  $.ajax({
    url: '/geocode_address',
    method: 'post',
    data: formValues
  }).done(function(data){
    console.log(data);
  }).fail(function(data){
    console.log(data);
  });
};

// perhaps extract to formHelper instead of leaving here
LandingPageController.prototype.formatFormValues = function ($form) {
  var unindexed_array = $form.serializeArray();
  var indexed_array = {};

  $.map(unindexed_array, function(n, i){
      indexed_array[n['name']] = n['value'];
  });

  return indexed_array;
};


$(document).ready(function () {
  var landingPageController = new LandingPageController();
  landingPageController.bindEvenListeners();
})
