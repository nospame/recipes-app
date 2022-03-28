class RecipesController < ApplicationController
  def index
    app_id = Rails.application.credentials.recipes_app_id
    app_key = Rails.application.credentials.recipes_api_key
    response = HTTP.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{params[:q]}&app_id=#{app_id}&app_key=#{app_key}")

    recipes = []
    response.parse(:json)["hits"].each_with_index do |hit, i|
      recipes[i] = {
        title: hit["recipe"]["label"],
        image: hit["recipe"]["image"],
        source: hit["recipe"]["source"],
        url: hit["recipe"]["url"],
        ingredients_list: hit["recipe"]["ingredientLines"],
        cuisine_type: hit["recipe"]["cuisineType"],
        meal_type: hit["recipe"]["mealType"],
        dish_type: hit["recipe"]["dishType"]
      }
    end
    render json: recipes.as_json
  end
end
