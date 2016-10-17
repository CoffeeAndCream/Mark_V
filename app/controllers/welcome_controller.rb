require 'rubygems'
require 'nokogiri'
class WelcomeController < ApplicationController
  # The `fc_hash` function is defined to load data from a Ruby Hash. This data will be converted to
  # JSON and the chart will be rendered.
  def index
    @import_data = create_hash('public/datasets/IMPJP.csv')
    graph_arr = []

    @import_data.each do |key, val|
      graph_arr.push({
          :label => key,
          :value => val
        })
        end


    @chart = Fusioncharts::Chart.new({
    	:height => 1000,
    	:width => 1200,
    	:type => 'line',
    	:renderAt => 'chart-container',

      :dataSource => {
        	:chart => {
            	:caption => 'Comparison of Quarterly Revenue',
            	:subCaption => "Sample Data",
            	:xAxisname => 'Quarter',
            	:yAxisName => 'Amount ($)',
            	:numberPrefix => '$',
              :showValues => false,
            	:theme => 'fint',
        	},
          :data => graph_arr
        }
      })
  end

  def create_hash(filepath)
    fake_hash = []
    dates = []
    values = []
    CSV.foreach(filepath, { :col_sep => ',' }) { |key|
        fake_hash.push(key)
        dates.push(fake_hash.last[0])
        values.push(fake_hash.last[1])
    }
    Hash[dates.zip(values)]
  end
end
