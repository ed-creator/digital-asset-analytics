// Place all the behaviors and hooks related to the matching controller here.



//--- Sparklines
//= require sparkline/index

//--- Datatables
//= require datatables/media/js/jquery.dataTables.min
//= require datatables-colvis/js/dataTables.colVis
//= require datatables/media/js/dataTables.bootstrap

//--- Datatables Buttons
//= require datatables-buttons/js/dataTables.buttons
// datatables-buttons/css/buttons.bootstrap.css
//= require datatables-buttons/js/buttons.bootstrap
//= require datatables-buttons/js/buttons.colVis
//= require datatables-buttons/js/buttons.flash
//= require datatables-buttons/js/buttons.html5
//= require datatables-buttons/js/buttons.print
//= require datatables-responsive/js/dataTables.responsive
//= require datatables-responsive/js/responsive.bootstrap

//--- jqGrid
//= require jqgrid/js/jquery.jqGrid.js
//= require jqgrid/js/i18n/grid.locale-en.js

//--- Flot
//= require flot/jquery.flot
//= require flot.tooltip/js/jquery.flot.tooltip.min
//= require flot/jquery.flot.resize
//= require flot/jquery.flot.pie
//= require flot/jquery.flot.time
//= require flot/jquery.flot.categories
//= require flot-spline/js/jquery.flot.spline.min
//= require chart.js/dist/Chart

//--- Chartist
//= require chartist/dist/chartist

//--- Morris
//= require raphael/raphael
//= require morris.js/morris

//--- Rickshaw
//= require d3/d3.min
//= require rickshaw/rickshaw

// --- Knob
//= require jquery-knob/js/jquery.knob.js

// --- EasyPie
//= require jquery.easy-pie-chart/dist/jquery.easypiechart.js


// CHART SPLINE
// -----------------------------------

var ploted_chart_price_history = null;

(function(window, document, $, undefined){
  $(function(){

    var data = [{
      "label": gon.current_digital_asset.ticker,
      "color": "#23b7e5",
      "data": gon.data,
    }];

    var options = {
      series: {
          lines: {
              show: true
          },
          points: {
              show: false,
              radius: 4
          },
          splines: {
              show: false,
              tension: 0.4,
              lineWidth: 1.4,
              fill: 0.2
          }
      },
      grid: {
          borderColor: '#eee',
          borderWidth: 1,
          hoverable: true,
          backgroundColor: '#fcfcfc'
      },
      tooltip: true,
      tooltipOpts: {
          content: function (label, x, y) {
            var date = new Date(+x);
            var tooltip = date.toLocaleDateString();
            tooltip += '<li>Price: ' + y + '</li>';
            return tooltip;
          }
      },
      xaxis: {
          axisLabel: "Date",
          axisLabelUseCanvas: true,
          axisLabelFontSizePixels: 12,
          axisLabelFontFamily: 'Verdana, Arial',
          axisLabelPadding: 10,
          tickColor: '#fcfcfc',
          mode: 'time',

      },
      yaxis: {
          min: 0,
          tickColor: '#eee',
          //position: 'right' or 'left',
          tickFormatter: function (v) {
              return v/* + ' visitors'*/;
          }
      },
      shadowSize: 0
    };

    var chart = $('.chart-price-history');
    if(chart.length)

      ploted_chart_price_history = $.plot(chart, data, options);

    var chartv2 = $('.chart-splinev2');
    if(chartv2.length)
      $.plot(chartv2, datav2, options);

    var chartv3 = $('.chart-splinev3');
    if(chartv3.length)
      $.plot(chartv3, datav3, options);

  });

  $('#min-date').change(function () {
    newMinDate = this.valueAsDate;
  });

  $('#max-date').change(function () {
    newMaxDate = this.valueAsDate;
  });

  $('#update-chart-price-history').click(function () {
    // Update range boundary for axes.
    var axes = ploted_chart_price_history.getAxes();
    if (newMinDate) {
      axes.xaxis.options.min = newMinDate;
    }
    if (newMaxDate) {
      axes.xaxis.options.max = newMaxDate;
    }


    // Redraw
    ploted_chart_price_history.setupGrid();
    ploted_chart_price_history.draw();
  });

})(window, document, window.jQuery);
// CHART AREA
// -----------------------------------
(function(window, document, $, undefined){

  $(function(){

    var data = [{
      "label": "Uniques",
      "color": "#aad874",
      "data": [
        ["Mar", 50],
        ["Apr", 84],
        ["May", 52],
        ["Jun", 88],
        ["Jul", 69],
        ["Aug", 92],
        ["Sep", 58]
      ]
    }, {
      "label": "Recurrent",
      "color": "#7dc7df",
      "data":
        gon.data

    }];

    var options = {
                    series: {
                        lines: {
                            show: true,
                            fill: 0.8
                        },
                        points: {
                            show: true,
                            radius: 4
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#fcfcfc',
                        mode: 'categories'
                    },
                    yaxis: {
                        min: 0,
                        max: (gon.max_price * 1.05),
                        tickColor: '#eee',
                        // position: 'right' or 'left'

                    },
                    shadowSize: 0
                };

    var chart = $('.chart-area-test');
    if(chart.length)
      $.plot(chart, data, options);

  });

})(window, document, window.jQuery);
