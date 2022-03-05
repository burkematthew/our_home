# frozen_string_literal: true

class Budget::CategoriesController < ApplicationController
  before_action :set_budget_category, only: %i[show edit destroy]
  before_action :set_budget_category_for_update, only: %i[update]

  def index
    @categories = Budget::Category.all
    @categories_exist = @categories.length.positive?
  end

  def show
  end

  def new
    @budget_category = Budget::Category.new
  end

  def create
    @budget_category = Budget::Category.new(category_params)

    respond_to do |format|
      if @budget_category.save
        format.html { redirect_to budget_categories_path, notice: "Budget Category was successfully added." }
        format.json { render :show, status: :created, location: @budget_category }
      else
        format.html { redirect_to new_budget_category_path(@budget_category), status: :unprocessable_entity }
        format.json { render json: @budget_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @budget_category.update(category_params)
        format.html { redirect_to budget_categories_path, notice: "Budget Category was successfully updated." }
        format.json { render :show, status: :ok, location: @budget_category }
      else
        format.html { redirect_to edit_budget_category_path(@budget_category), status: :unprocessable_entity }
        format.json { render json: @budget_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @budget_category.destroy
      redirect_to budget_categories_path, notice: "Budget Category was successfully deleted."
    else
      render :show, notice: "Failed to delete Budget Category."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to budget_categories_path, status: :not_found
  end

  private

  def set_budget_category
    @budget_category = Budget::Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to budget_categories_path, status: :not_found
  end

  def set_budget_category_for_update
    @budget_category = Budget::Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to budget_categories_path, status: :not_found
  end

  def category_params
    params.require(:budget_category).permit(:description)
  end
end
