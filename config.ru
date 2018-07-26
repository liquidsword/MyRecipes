# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::MethodOverride

#use CulinaryArtistsController
#use RecipesController
#use SessionsController
