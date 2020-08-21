class DosesController < ApplicationController
  def create
    @dose = Dose.new(strong_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      render "new", dose: @dose
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy!
    redirect_to cocktail_path(@dose.cocktail)
  end

private
 def strong_params
  params.require("dose").permit(:description, :ingredient_id, :cocktail_id)
 end
end