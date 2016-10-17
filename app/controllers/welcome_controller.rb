class WelcomeController < ApplicationController
  # The `fc_hash` function is defined to load data from a Ruby Hash. This data will be converted to

  # JSON and the chart will be rendered.
  def index
    @test = "Did you drink that coffee?"
  # Create the FusionCharts object in the controller action

  	@chart = Fusioncharts::Chart.new({
      	:height => 400,
      	:width => 600,
      	:type => 'line2d',
      	:renderAt => 'chart-container',

  # Chart data is passed to the `dataSource` parameter, as hashes, in the form of

  # key-value pairs.

  :dataSource => {
    	:chart => {
        	:caption => @test,
        	:subCaption => 'Coffee Index',
        	:xAxisname => 'Quarter',
        	:yAxisName => 'Amount ($)',
        	:numberPrefix => '$',
        	:theme => 'fint',
    	},

  # The `category` hash is defined inside the `categories` array with four key-value pairs

  # that represent the x-axis labels for the four quarters.

    	:categories => [{
        	:category => [
            	{ :label => 'Q1' },
            	{ :label => 'Q2' },
            	{ :label => 'Q3' },
            	{ :label => 'Q4' }
        	]
    	}],
    	:dataset =>  [{
        	:seriesname => 'Previous Year',

  # The `data` hash contains four key-value pairs that are the values for the revenue

  # generated in the previous year.

        	:data =>  [
            	{ :value => '10000' },
            	{ :value => '11500' },
            	{ :value => '12500' },
            	{ :value => '15000' }
        	]},{
        	:seriesname => 'Current Year',
        	:data =>  [
            	{ :value => '25400' },
            	{ :value => '29800' },
            	{ :value => '21800' },
            	{ :value => '26800' }
        	]}
    	]
    }
  })
  end
end
