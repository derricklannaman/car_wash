class Vehicle < ApplicationRecord
  has_many :transactions, dependent: :destroy

  def car_wash
    5.00
  end

  def truck_wash
    10.00
  end

  def muddy_bed_upcharge
    truck_wash + 2.00
  end
end
