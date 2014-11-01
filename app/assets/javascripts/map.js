window.onload = function() {
    if(document.querySelector('#map')) {
        generateMap();
    }
};

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
        var map = L.map('map').setView([location.lat, location.long], 3);
        L.tileLayer('http://c.tile.stamen.com/toner/{z}/{x}/{y}.png', {
            attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, under <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>, under <a href="http://www.openstreetmap.org/copyright">ODbL</a>.'
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
        data.forEach(function(team) {
            L.marker([team.location.latitude, team.location.longitude]).addTo(map);
        });
    }
}
