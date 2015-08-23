L.mapbox.accessToken = 'pk.eyJ1IjoicmtyYWJlayIsImEiOiIzZjBkZDQ2OGJhNmRhYWZhNDdkZmE0YzMwYjkwNDNiYyJ9.4AsJUOjYe0gfKMrSjtb0Ww';
var map = L.mapbox.map('map', 'mapbox.streets', {
    zoomControl: false
}).setView([40, -74.50], 9);

// move the attribution control out of the way
map.attributionControl.setPosition('bottomleft');

// create the initial directions object, from which the layer
// and inputs will pull data.
var directions = L.mapbox.directions();

var distance = [];
var carbon_load = [];
function calcDistanceCarbon(){
    distance = []
    directions.directions.routes.forEach(function(route){
        distance.push(route.distance);
    });
    carbon_load = [];
    distance.forEach(function(meters){
        carbon_load.push(Math.round(((meters*0.000621371)/25.5)*19.64));
    });
}
function triggerModal(){
        calcDistanceCarbon();
        $("#modal_distance").html("<p>At the US average of 25.5mpg:</p>")
        carbon_load.forEach(function(lbs, i){
            $("#modal_distance").append("<p>Route " + (i+1) + " CO2 emissions: " + lbs + " lbs</p>");
        });
        $("#footprintModal").modal()
}

var directionsLayer = L.mapbox.directions.layer(directions)
    .addTo(map);
    
var directionsInputControl = L.mapbox.directions.inputControl('inputs', directions)
    .addTo(map);

var directionsErrorsControl = L.mapbox.directions.errorsControl('errors', directions)
    .addTo(map);

var directionsRoutesControl = L.mapbox.directions.routesControl('routes', directions)
    .addTo(map);

var directionsInstructionsControl = L.mapbox.directions.instructionsControl('instructions', directions)
    .addTo(map);

function updateDirections() {
    //this would update the directions boxes
};

$(function() {
    // if you want to trigger something on change of input use this
    // $("input").change(function() {
    // });
    //$("input").trigger('change')

    $(".mapbox-directions-inputs form").keypress(function(event) { 
        if (event.keyCode === 13) {
            if($('#mapbox-directions-profile-driving').is(':checked')){
                triggerModal();
            }
        } 
    });
    $("#mapbox-directions-profile-walking").click(updateDirections); 
    $("#mapbox-directions-profile-cycling").click(updateDirections);
    $("#mapbox-directions-profile-driving").click(function () {
        triggerModal();
    });
});
