class HomeController < ApplicationController
  include ServiceHelper
  before_action :check_plate_number,
                :check_if_bed_down, only: :wash_service

  def index
  end

  def wash_service
    find_vehicle
    update_visit_counter
    transaction = Transaction.create(vehicle_id: @vehicle.id, plate_number: @vehicle.plate_number)
    determine_wash_price transaction
    @transactions = @vehicle.transactions.order('created_at DESC')
  end

  private

    def find_vehicle
      @vehicle = Vehicle.find_by(plate_number: params[:plate_number])
      if @vehicle.nil?
        @vehicle = Vehicle.create(vehicle_type: params[:vehicle_type],
                                  plate_number: params[:plate_number])
      end
    end

    def update_visit_counter
      if @vehicle.visit_count.blank?
        @vehicle.visit_count = 1
      elsif @vehicle.visit_count >= 1
        @vehicle.visit_count += 1
      end
      @vehicle.save
    end

    def determine_wash_price transaction
      if @vehicle.vehicle_type == "truck"
        transaction.total_price = params[:mud_in_bed?].present? ? @vehicle.muddy_bed_upcharge : @vehicle.truck_wash
      else
        transaction.total_price = @vehicle.car_wash
      end
      transaction.save
      check_for_discount transaction
    end

end
