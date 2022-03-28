class RecipesController < ApplicationController
  def index
    render json: {message: "Recipes Index"}
  end
end
