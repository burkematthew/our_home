# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit destroy]
  before_action :set_member_for_update, only: %i[update]

  def index
    @members = Member.all
    @members_exist = @members.length.positive?
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
        format.html { redirect_to members_path, notice: "Member was successfully added." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { redirect_to new_member_path(@member), status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to members_path, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { redirect_to edit_member_path(@member), status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @member.destroy
      redirect_to members_path, notice: "Member was successfully deleted."
    else
      render :show, notice: "Failed to delete Member."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to members_path, status: :not_found
  end

  private

  def set_member
    @member = Member.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to members_path, status: :not_found
  end

  def set_member_for_update
    @member = Member.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to members_path, status: :not_found
  end

  def member_params
    params.require(:member).permit(:birthdate, :first_name, :middle_name, :last_name)
  end
end
