({
    generateChart: function(component, event, helper) {
        var symbol = component.get('v.symbol');
        var existingChart = component.get('v.linechart');
        if (existingChart) {
            existingChart.destroy();
        }
        if (!symbol) {
            return;
        }
        helper.getStock(symbol).then(chart => {

            var data = [],
                labels = [];
            chart.forEach(point => {
                data.push(point.close);
                labels.push(point.date);
            });

            var chartdata = {
                    labels: labels,
                    datasets: [{
                        label: symbol,
                        data: data,
                        borderColor: 'rgba(62, 159, 222, 1)',
                        fill: true,
                        pointBackgroundColor: "#FFFFFF",
                        pointBorderWidth: 4,
                        pointHoverRadius: 5,
                        pointRadius: 3,
                        bezierCurve: true,
                        pointHitRadius: 10
                    }]
                }
                //Get the context of the canvas element we want to select
            var ctx = component.find("linechart").getElement();
            var lineChart = new Chart(ctx, {
                type: 'line',
                data: chartdata,
                options: {
                    legend: {
                        position: 'bottom',
                        padding: 10,
                    },
                    responsive: true
                }
            });
            component.set('v.linechart', lineChart);
        }).catch(error => {
            console.error('error', error.message);
        });
        helper.getLogo(symbol).then(logo => {
            if (logo) {
                component.set('v.imageURL', logo.url);
            } else {
                component.set('v.imageURL', '');
            }
        }).catch(error => {
            console.error('error', error.message);
        });
    }
})