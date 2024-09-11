# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'valid ticket' do
    subject(:test_ticket) do
      Ticket.new(
        request_number: request_number,
        sequence_number: sequence_number,
        request_type: request_type,
        response_due_date_time: response_due_date_time,
        primary_service_area_code: primary_service_area_code,
        additional_service_area_codes: additional_service_area_codes,
        digsite_info: digsite_info
      )
    end

    context 'when ticket is valid' do
      let(:request_number) { "09252012-00001" }
      let(:sequence_number) { "2421" }
      let(:request_type) { "Normal" }
      let(:response_due_date_time) { "2011-07-13 23:59:59" }
      let(:primary_service_area_code) { "ZZGL103" }
      let(:additional_service_area_codes) { ["ZZL01", "ZZL02", "ZZL03"] }
      let(:digsite_info) { "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))" }
      
      it 'returns true' do
        expect(test_ticket.valid?).to be(true)
      end
    end

    context 'when ticket request_number is invalid' do
      let(:request_number) { nil }
      let(:sequence_number) { "2421" }
      let(:request_type) { "Normal" }
      let(:response_due_date_time) { "2011-07-13 23:59:59" }
      let(:primary_service_area_code) { "ZZGL103" }
      let(:additional_service_area_codes) { ["ZZL01", "ZZL02", "ZZL03"] }
      let(:digsite_info) { "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))" }
      
      it 'returns false' do
        expect(test_ticket.valid?).to be(false)
      end
    end

    context 'when ticket sequence_number is invalid' do
      let(:request_number) { "09252012-00001" }
      let(:sequence_number) { nil }
      let(:request_type) { "Normal" }
      let(:response_due_date_time) { "2011-07-13 23:59:59" }
      let(:primary_service_area_code) { "ZZGL103" }
      let(:additional_service_area_codes) { ["ZZL01", "ZZL02", "ZZL03"] }
      let(:digsite_info) { "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))" }
      
      it 'returns false' do
        expect(test_ticket.valid?).to be(false)
      end
    end

    context 'when ticket request_type is invalid' do
      let(:request_number) { "09252012-00001" }
      let(:sequence_number) { "2421" }
      let(:request_type) { nil }
      let(:response_due_date_time) { "2011-07-13 23:59:59" }
      let(:primary_service_area_code) { "ZZGL103" }
      let(:additional_service_area_codes) { ["ZZL01", "ZZL02", "ZZL03"] }
      let(:digsite_info) { "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))" }
      
      it 'returns false' do
        expect(test_ticket.valid?).to be(false)
      end
    end

    context 'when ticket response_due_date_time is invalid' do
      let(:request_number) { "09252012-00001" }
      let(:sequence_number) { "2421" }
      let(:request_type) { "Normal" }
      let(:response_due_date_time) { nil }
      let(:primary_service_area_code) { "ZZGL103" }
      let(:additional_service_area_codes) { ["ZZL01", "ZZL02", "ZZL03"] }
      let(:digsite_info) { "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))" }
      
      it 'returns false' do
        expect(test_ticket.valid?).to be(false)
      end
    end

    context 'when ticket primary_service_area_code is invalid' do
      let(:request_number) { "09252012-00001" }
      let(:sequence_number) { "2421" }
      let(:request_type) { "Normal" }
      let(:response_due_date_time) { "2011-07-13 23:59:59" }
      let(:primary_service_area_code) { nil }
      let(:additional_service_area_codes) { ["ZZL01", "ZZL02", "ZZL03"] }
      let(:digsite_info) { "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))" }
      
      it 'returns false' do
        expect(test_ticket.valid?).to be(false)
      end
    end
  end
end
