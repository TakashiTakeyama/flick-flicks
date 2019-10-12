class CategoriesController < ApplicationController
  def index
    @cats = Category.all
  end

  def new
    @cat = Category.new
  end

  def show
  end

  def edit
  end

  def create
    @cat = Category.new(cat_params)
    if @cat.save
      redirect_to new_category_path, notice: "作成しました。"
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def cat_params
    params.require(:category).permit(:name)
  end
end
