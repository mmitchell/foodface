$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
        	credits: {
        		enabled: false
        	},
            chart: {
                renderTo: 'container',
                type: 'line',
                alignTicks: true
            },
            title: {
                text: 'Last 2 weeks'
            },
            xAxis: {
                categories: gon.past_calorie_data[1]
            },
            yAxis: [{ // Primary yAxis
                endOnTick: false,
                startOnTick: false,
                min: 0000,
                max: 4000,
                title: {
                    text: 'Calories',
                    style: {
                        color: '#4572A7'
                    }
                }, 
                labels: {
                    formatter: function() {
                        return this.value +' cal';
                    },
                    style: {
                        color: '#4572A7'
                    }
                },
            }, { // Secondary yAxis
                min: 150,
                max: 170,
                title: {
                    text: 'Weight',
                    style: {
                        color: '#AA4643'
                    }
                }, 
                labels: {
                    formatter: function() {
                        return this.value +' lb';
                    },
                    style: {
                        color: '#AA4643'
                    }
                },
                opposite: true
            }],
            tooltip: {
                formatter: function() {
                    return this.y + " Cal.";
                }
            },
            plotOptions: {
                series: {
                    point: {
                        events: {
                            click: function() {
                                document.location.href = '/daysago/' + (14 - this.x);
                            }
                        }
                    }
                }
            },
            series: [{ // Primary yAxis data
                name: 'Calories',
                yAxis: 0,
                type: 'spline',
                color: '#4572A7',
            	showInLegend: false,
                data: gon.past_calorie_data[0]
            },{ // Secondary yAxis data
                name: 'Weight',
                yAxis: 1,
                type: 'spline',
                color: '#AA4643',
                showInLegend: false,
                data: gon.past_weight_data[0]
            }]
        });
    });
    
})