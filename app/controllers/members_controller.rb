# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { render :index, notice: "Member was successfully added." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @member = Member.find(params[:id])
    respond_to do |format|
      if @member.update(member_params)
        format.html { render :show, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordNotFound
    render :edit, status: :not_found
  end

  def destroy
    if @member.destroy
      render :index, notice: "Member was successfully deleted."
    else
      render :show, notice: "Failed to delete Member."
    end
  rescue ActiveRecord::RecordNotFound
    render :index, status: :not_found
  end

  private

  def set_member
    @member = Member.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :index, status: :not_found
  end

  def member_params
    params.require(:member).permit(:birthdate, :first_name, :middle_name, :last_name)
  end
end
