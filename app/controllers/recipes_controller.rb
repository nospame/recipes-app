class RecipesController < ApplicationController
  def index
    app_id = Rails.application.credentials.recipes_app_id
    app_key = Rails.application.credentials.recipes_api_key
    response = HTTP.get("https://api.edamam.com/api/recipes/v2?type=public&q=breakfast&app_id=#{app_id}&app_key=#{app_key}")
    recipes = response.parse(:json)
    render json: recipes.as_json
  end
end
