/*
* By Krish Dholakiya (itskrish.co, git.io/krish)
* MIT Licensed.
*
*     GET('http://example.com/index.html', function(response) {
*        var responseFromServer = response;
*     });
*     POST('http://example.com', {'keyOne': 'valueOne', 'keyTwo': 'valueTwo'}, function(response) {
*        var responseFromServer = response;
*     });
*/

window.http =  (function() {
    var GET = function(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, false);
        xhr.send(null);
        callback(xhr.responseText);
    };
    var POST = function (url, data, callback) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        var params = "";
        var loaded = false;
        var keys = Object.keys;
        if(data) {
            keys(data).forEach(function(d) {
                if(params.length<1) {
                    params = params + d + '=' + data[d];
                } else {
                    params = params + '&' + d + '=' + data[d];
                }
            });
        }
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.addEventListener('load', function(e) {
             callback(xhr.responseText);
        }, false);
        xhr.send(params);
    };
    return {
        GET: function(url, cb) { return GET(url, cb); },
        POST: function(url, data, cb) { return POST(url, data, cb); }
    }
}());