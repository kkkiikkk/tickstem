# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Excavator, type: :model do

  describe 'valid ticket' do
    let(:test_ticket) { create(:ticket) }
    subject(:test_excavator) do
      Excavator.new(
        company_name: company_name,
        address: address,
        crew_on_site: crew_on_site,
        ticket_id: test_ticket.id
      )
    end

    context 'when excavator is valid' do
      let(:company_name) { 'test' }
      let(:address) { 'test' }
      let(:crew_on_site) { 'test' }

      it 'returns true' do
        expect(test_excavator.valid?).to be(true)
      end
    end

    context 'when excavator company_name is invalid' do
      let(:company_name) { nil }
      let(:address) { 'test' }
      let(:crew_on_site) { 'test' }

      it 'returns false' do
        expect(test_excavator.valid?).to be(false)
      end
    end

    context 'when excavator address is invalid' do
      let(:company_name) { 'test' }
      let(:address) { nil }
      let(:crew_on_site) { 'test' }

      it 'returns false' do
        expect(test_excavator.valid?).to be(false)
      end
    end

    context 'when excavator crew_on_site is invalid' do
      let(:company_name) { 'test' }
      let(:address) { 'test' }
      let(:crew_on_site) { nil }

      it 'returns false' do
        expect(test_excavator.valid?).to be(false)
      end
    end
  end

end