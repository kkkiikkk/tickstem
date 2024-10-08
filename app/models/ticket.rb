# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator

  validates :request_number, :sequence_number, :request_type, :response_due_date_time, :primary_service_area_code, presence: true
  serialize :additional_service_area_codes, Array
end
