require 'rubygems'
require 'nokogiri'

class WelcomeController < ApplicationController
  # The `fc_hash` function is defined to load data from a Ruby Hash. This data will be converted to
  # JSON and the chart will be rendered.
  def index
    page = Nokogiri::HTML(open("https://en.wikipedia.org/"))
    @title = page.css('title').to_json
    # **Step 1:** Create the FusionCharts object in the controller action
    	@chart = Fusioncharts::Chart.new({
        	:height => 400,
        	:width => 600,
        	:id => 'chart',
        	:type => 'column2d',
        	:renderAt => 'chart-container',
        	:dataSource => '{
            	"chart": {
                	"caption": "Monthly revenue for last year",
                	"subCaption": ' + @title + ',
                	"xAxisName": "Month",
                	"yAxisName": "Revenues (In USD)",
                	"numberPrefix": "$",
                	"paletteColors": "#0075c2",
                	"bgColor": "#ffffff",
                	"borderAlpha": "20",
                	"canvasBorderAlpha": "0",
                	"usePlotGradientColor": "0",
                	"plotBorderAlpha": "10",
                	"placevaluesInside": "1",
                	"rotatevalues": "1",
                	"valueFontColor": "#ffffff",
                	"showXAxisLine": "1",
                	"xAxisLineColor": "#999999",
                	"divlineColor": "#999999",
                	"divLineDashed": "1",
                	"showAlternateHGridColor": "0",
                	"subcaptionFontBold": "0",
                	"subcaptionFontSize": "14"
            	},
            	"data": [{
                	"label": "Jan",
                	"value": "420000"
            	}, {
                	"label": "Feb",
                	"value": "810000"
            	}, {
                	"label": "Mar",
                	"value": "720000"
            	}, {
                	"label": "Apr",
                	"value": "550000"
            	}, {
                	"label": "May",
                	"value": "910000"
            	}, {
                	"label": "Jun",
                	"value": "510000"
            	}, {
                	"label": "Jul",
                	"value": "680000"
            	}, {
                	"label": "Aug",
                	"value": "620000"
            	}, {
                	"label": "Sep",
                	"value": "610000"
            	}, {
                	"label": "Oct",
                	"value": "490000"
            	}, {
                	"label": "Nov",
                	"value": "900000"
            	}, {
                	"label": "Dec",
                	"value": "730000"
            	}]
        	}'
    	})
  end
end
