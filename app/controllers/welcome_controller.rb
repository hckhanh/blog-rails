class WelcomeController < ApplicationController
  skip_before_action :authenticate
end
