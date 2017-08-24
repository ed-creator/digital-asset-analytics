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
(function(window, document, $, undefined){

  $(function(){

    var data = [{
      "label": gon.current_digital_asset.ticker,
      "color": "#23b7e5",
      "data": gon.data
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
              show: true,
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
          content: function (label, x, y) { return x + ' : ' + y; }
      },
      xaxis: {
          axisLabel: "Date",
          axisLabelUseCanvas: true,
          axisLabelFontSizePixels: 12,
          axisLabelFontFamily: 'Verdana, Arial',
          axisLabelPadding: 10,
          tickColor: '#fcfcfc',
          mode: 'categories',
          ticks: []

      },
      yaxis: {
          min: 0,
          max: gon.max_price, // optional: use it for a clear represetation
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
      $.plot(chart, data, options);

    var chartv2 = $('.chart-splinev2');
    if(chartv2.length)
      $.plot(chartv2, datav2, options);

    var chartv3 = $('.chart-splinev3');
    if(chartv3.length)
      $.plot(chartv3, datav3, options);

  });

})(window, document, window.jQuery);
