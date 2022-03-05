# frozen_string_literal: true

class Event::TypesController < ApplicationController
  before_action :set_event_type, only: %i[show edit destroy]
  before_action :set_event_type_for_update, only: %i[update]

  def index
    @event_types = Event::Type.all
    @event_types_exist = @event_types.length.positive?
  end

  def show
  end

  def new
    @event_type = Event::Type.new
  end

  def create
    @event_type = Event::Type.new(type_params)

    respond_to do |format|
      if @event_type.save
        format.html { redirect_to event_types_path, notice: "Event Type was successfully added." }
        format.json { render :show, status: :created, location: @event_type }
      else
        format.html { redirect_to new_event_type_path(@event_type), status: :unprocessable_entity }
        format.json { render json: @event_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event_type.update(type_params)
        format.html { redirect_to event_types_path, notice: "Event Type was successfully updated." }
        format.json { render :show, status: :ok, location: @event_type }
      else
        format.html { redirect_to edit_event_type_path(@event_type), status: :unprocessable_entity }
        format.json { render json: @event_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @event_type.destroy
      redirect_to event_types_path, notice: "Event Type was successfully deleted."
    else
      render :show, notice: "Failed to delete Event Type."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to event_types_path, status: :not_found
  end

  private

  def set_event_type
    @event_type = Event::Type.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to event_types_path, status: :not_found
  end

  def set_event_type_for_update
    @event_type = Event::Type.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to event_types_path, status: :not_found
  end

  def type_params
    params.require(:event_type).permit(:description)
  end
end
