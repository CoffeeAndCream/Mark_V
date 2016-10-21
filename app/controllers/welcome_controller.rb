require 'rubygems'
require 'nokogiri'
class WelcomeController < ApplicationController
  # The `fc_hash` function is defined to load data from a Ruby Hash. This data will be converted to
  # JSON and the chart will be rendered.
  def index
    @user = current_user
      respond_to do |format|
      format.html # index.html.erb
    end
    @import_jp_data = reduce_data(create_hash('public/datasets/IMPJP.csv'))
    @import_ch_data = reduce_data(create_hash('public/datasets/IMPCH.csv'))

    @world_medals = {"USA" => 40,
                    "Mexico" => 5,
                    "Japan" => 10,
                    "China" => 15,
                    "Russia" => 10,
                    "Germany" => 12}
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

  def reduce_data(hash_) #Splits data in half for legibility
    counter = 0
    hash_.each {|key, value|
      if(counter%2 == 0)
        hash_.delete(key)
      end
      counter += 1
    }
  end

end
