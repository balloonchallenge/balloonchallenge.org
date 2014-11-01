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
                var userLoc = {
                    lat: location.coords.latitude,
                    long: location.coords.longitude
                };
                initMap(userLoc);
        });
    } else {
        initMap({lat:0, long:30});
    }
    function initMap(location) {
        var tileURL = (function() {
                var url;
                if(dayOrNight() === 'night') {
                    url = 'https://{s}.tiles.mapbox.com/v3/mapbox.control-room/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3JyaXNoZCIsImEiOiJ4TDVxN3NNIn0.GL2JqgwojaO1XW0r5keZ3A'
                } else {
                    url = 'http://{s}.tile.stamen.com/toner-lite/{z}/{x}/{y}.png'
                }
                return url;
        })();
        var tileAttr = (function() {
            var attr;
            if(dayOrNight() === 'night') {
                attr = '&copy; <a href="http://mapbox.com">Mapbox</a> &copy; <a href="http://osm.org">OpenStreetMap</a>';
            } else {
                attr = 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, under <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>, under <a href="http://www.openstreetmap.org/copyright">ODbL</a>.';
            }
            return attr;
        })();
        var map = L.map('map').setView([location.lat, location.long], 3);
        L.tileLayer(tileURL, {
            attribution: tileAttr
        }).addTo(map);
        var myIcon = L.icon({
            iconUrl: 'user-marker.png',
            iconSize: [25, 25],
            iconAnchor: [12.5, 12.5],
            popupAnchor: [0, 0]
        });
        L.marker([location.lat, location.long], { icon: myIcon }).addTo(map)
            .bindPopup('You are here')
            .openPopup();
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
