({
    getStock: function(symbol) {
        return fetch('https://api.iextrading.com/1.0/stock/' + symbol + '/chart/1m')
            .then(function(response) {
                return response.json();
            }).catch(function(error) {
                console.error('error', error);
            });
    },
    getLogo: function(symbol) {
        return fetch('https://api.iextrading.com/1.0/stock/' + symbol + '/logo')
            .then(function(response) {
                return response.json();
            }).catch(function(error) {
                console.error('error', error);
            });
    }
})