require 'rubygems'
require 'nokogiri'
class WelcomeController < ApplicationController
  # The `fc_hash` function is defined to load data from a Ruby Hash. This data will be converted to
  # JSON and the chart will be rendered.
  def index
    @import_jp_data = create_hash('public/datasets/IMPJP.csv')
    @import_ch_data = create_hash('public/datasets/IMPCH.csv')

    jp_arr = []
    ch_arr = []

    @import_jp_data.each do |key, val|
      jp_arr.push({
          :label => key,
          :value => val
        })
        end
    @import_ch_data.each do |key, val|
      ch_arr.push({
          :label => key,
          :value => val
        })
        end


    @jpchart = Fusioncharts::Chart.new({
    	:height => 600,
    	:width => 800,
    	:type => 'line',
    	:renderAt => 'jpchart-container',

      :dataSource => {
        	:chart => {
            	:caption => 'Imports from Japan to the USA',
            	:subCaption => "Imported Goods",
            	:xAxisname => 'Date Recorded',
            	:yAxisName => 'Amount of Goods ($ millions)',
            	:numberPrefix => '$',
              :showValues => '0',
              :labelStep => '3',
            	:theme => 'fint',
        	},
          :data => jp_arr
        }
      })

      @chchart = Fusioncharts::Chart.new({
      	:height => 600,
      	:width => 800,
      	:type => 'line',
      	:renderAt => 'chchart-container',

        :dataSource => {
          	:chart => {
              	:caption => 'Imports from China to the USA',
              	:subCaption => "Imported Goods",
              	:xAxisname => 'Date Recorded',
              	:yAxisName => 'Amount of Goods ($ millions)',
              	:numberPrefix => '$',
                :showValues => '0',
                :labelStep => '3',
              	:theme => 'carbon',
          	},
            :data => ch_arr
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
