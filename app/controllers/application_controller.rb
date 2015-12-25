class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  require 'will_paginate'
  require 'will_paginate/array'
end
