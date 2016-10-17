class WelcomeController < ApplicationController
  # The `fc_hash` function is defined to load data from a Ruby Hash. This data will be converted to

  # JSON and the chart will be rendered.
  def index

  end
  def change_num
    @x = rand(10... 50)
  end
end
