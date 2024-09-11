# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'GET #index' do
    context 'succesfull response' do
      it 'returns tickets' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #show' do
    context 'succesfull response' do
      let(:test_ticket) { create(:ticket) }

      it 'returns ticket' do
        get :show, params: { id: test_ticket.id }

        expect(response.status).to eq(200)
      end
    end

    context 'failure response' do
      it 'returns not found exception' do
        expect do
          get :show, params: { id: 10_010_101_010 }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end