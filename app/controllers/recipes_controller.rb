class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    # @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
    @recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end
  
  def show
  
  end
  
  def new
     @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user
    
    if @recipe.save
      flash[:success] = "Your recipe was create succesfully!"
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit

  end
  
  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Your recipe was updated succesfully"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def like
    like = params[:like]
    like_process = Like.create(like: like,chef: current_user, recipe: @recipe)
    
    if like_process.valid?
      if like == "true"
        flash[:success] = "Cool!"
      else
        flash[:warning] = "What a pity!"
      end
    else
       flash[:danger] = "Only one vote!"
    end
    redirect_to :back
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name,:summary,:description,:picture)
    end
  
    def require_same_user
      if current_user != @recipe.chef
        flash[:danger] = "You can only edit your own recipes"
        redirect_to root_path
      end
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end