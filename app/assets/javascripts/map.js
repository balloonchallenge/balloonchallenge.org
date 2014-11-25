$(document).ready(init);

function init() {
     if(document.querySelector('#map')) {
         generateMap();
     }
}

 function generateMap() {
     initMap({lat:30, long:0}, false);
     function initMap(location, permission) {
         var tileURL = 'http://{s}.tile.stamen.com/toner-lite/{z}/{x}/{y}.png';
         var tileAttr = 'Map tiles by <a href="http:stamen.com">Stamen Design</a>, under <a href="http:creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http:openstreetmap.org">OpenStreetMap</a>, under <a href="http:www.openstreetmap.org/copyright">ODbL</a>.';
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
         var apiURL = '/teams/all';
         http.GET(apiURL, function(data) {
                 console.log(data);
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
             L.marker([team.latitude, team.longitude], { icon: teamIcon })
                 .addTo(map)
                 .bindPopup(
                     '<a href="/teams/' + team.id + '">' + team.name + '</a>' +
                     '<p>' + team.city + ', ' + team.state_code + ', ' + team.country_code + '</p>'
                 );
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
