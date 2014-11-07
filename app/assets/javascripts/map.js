$(document).on('page:load', init);
$(document).ready(init);

function init() {
    if(document.querySelector('#map')) {
        generateMap();
    }
}

function generateMap() {
    if(navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(location){
            document.querySelector('.status').innerHTML = 'Obtained location, loading locations of other teams...';
            var userLoc = {
                lat: location.coords.latitude,
                long: location.coords.longitude
            };
            initMap(userLoc, true);
        }, function(err) {
            initMap({lat:30, long:0}, false);
        });
    } else {
        initMap({lat:30, long:0}, false);
    }
    function initMap(location, permission) {
        var tileURL = 'http://{s}.tile.stamen.com/toner-lite/{z}/{x}/{y}.png';
        var tileAttr = 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, under <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>, under <a href="http://www.openstreetmap.org/copyright">ODbL</a>.';
        $('.loading').css('display', 'none');
        var zoomLevel = (function() {
            if(permission) {
                return 3;
            } else {
                return 2;
            }
        })();
        var map = L.map('map').setView([location.lat, location.long], zoomLevel);
        L.tileLayer(tileURL, {
            attribution: tileAttr
        }).addTo(map);
        if(permission) {
            var myIcon = L.icon({
                iconUrl: 'user-marker.png',
                iconSize: [25, 25],
                iconAnchor: [12.5, 12.5],
                popupAnchor: [0, 0]
            });
            L.marker([location.lat, location.long], { icon: myIcon }).addTo(map)
                .bindPopup('You are here')
                .openPopup();
        }
        var apiURL = 'http://www.json-generator.com/api/json/get/clyzZtFLKG?indent=2'
        http.GET(apiURL, function(data) {
                populateMap(map, JSON.parse(data));
        });
    }
    function populateMap(map, data) {
        var map = map;
        var teamIcon = L.icon({
                iconUrl: 'team-marker.png',
                iconSize: [25, 25],
                iconAnchor: [12.5, 12.5],
                popupAnchor: [0,0]
        });
        data.forEach(function(team) {
            L.marker([team.location.latitude, team.location.longitude], { icon: teamIcon })
                .addTo(map)
                .bindPopup('<a href="' + team.url + '">' + team.name + '</a>');
        });
    }
    function dayOrNight() {
        if((new Date).getHours() > 18) {
            return 'night'
        } else {
            return 'day'
        }
    }
}
