class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(strong_params)
    redirect_to cocktails_path
  end

  private

  def strong_params
    params.require("cocktail").permit(:name)
  end

end
