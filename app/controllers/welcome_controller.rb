class WelcomeController < ApplicationController
  # The `fc_hash` function is defined to load data from a Ruby Hash. This data will be converted to

  # JSON and the chart will be rendered.
  def index
    def output
      @x = rand(10...10000)
    end
    @test = "Did you drink that coffee?"
  # Create the FusionCharts object in the controller action

  	@chart = Fusioncharts::Chart.new({
      	:height => 400,
      	:width => 600,
      	:type => 'line',
      	:renderAt => 'chart-container2',

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
  # The `data` hash contains four key-value pairs that are the values for the revenue
  # generated in the previous year.
        	:data =>  [
            	{ :value => @x },
            	{ :value => '11500' },
            	{ :value => '12500' },
            	{ :value => '15000' }
        	]}
    	]
    }
  })
  end
end
