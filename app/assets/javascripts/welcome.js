$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
        	credits: {
        		enabled: false
        	},
            chart: {
                renderTo: 'container',
                type: 'line'
            },
            title: {
                text: 'Calories per day for the last 2 weeks'
            },
            xAxis: {
                categories: gon.past_calorie_data[1]
            },
            yAxis: {
            	min: 0,
            	max: 4000,
                title: {
                    text: 'Calories',
                }
            },
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
            series: [{
            	showInLegend: false,
                data: gon.past_calorie_data[0]
            }]
        });
    });
    
})