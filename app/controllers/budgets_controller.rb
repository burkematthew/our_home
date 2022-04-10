# frozen_string_literal: true

class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show edit destroy]
  before_action :set_budget_for_update, only: %i[update]

  def index
    @budgets = Budget.all
    @budgets_exist = @budgets.length.positive?
  end

  def show
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    debugger
    respond_to do |format|
      if @budget.save
        format.html { redirect_to budgets_path, notice: "Budget was successfully added." }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { redirect_to new_budget_path(@budget), status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to budgets_path, notice: "Budget was successfully updated." }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { redirect_to edit_budget_path(@budget), status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @budget.destroy
      redirect_to budgets_path, notice: "Budget was successfully deleted."
    else
      render :show, notice: "Failed to delete Budget."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to budgets_path, status: :not_found
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to budgets_path, status: :not_found
  end

  def set_budget_for_update
    @budget = Budget.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to budgets_path, status: :not_found
  end

  def budget_params
    params.require(:budget).permit(:description)
  end
end
