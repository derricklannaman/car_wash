module ServiceHelper
  def check_plate_number
    if params[:plate_number] == '1111111'
      redirect_back fallback_location: root_path, alert: "Decline Service Reason: Vehicle Reported Stolen!"
    end
  end

  def check_if_bed_down
    if params[:bed_is_down?].present?
      redirect_back fallback_location: root_path, alert: "Decline Service Reason: Truck Bed Down!"
    end
  end

  def check_for_discount transaction
    if @vehicle.visit_count == 2
      transaction.total_price *= 0.50
      transaction.save
    end
  end
end