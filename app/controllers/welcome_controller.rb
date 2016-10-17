class WelcomeController < ApplicationController
  # The `fc_hash` function is defined to load data from a Ruby Hash. This data will be converted to

  # JSON and the chart will be rendered.
  def index
    @user = "Test"
    var subCaption = @user.to_json;
  end
end
