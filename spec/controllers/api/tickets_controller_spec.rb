# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::TicketsController, type: :controller do
  describe 'POST #create' do
    let(:valid_attributes) do
      {
        RequestNumber: '09252012-00001',
        SequenceNumber: '2421',
        RequestType: 'Normal',
        DateTimes: {
          ResponseDueDateTime: '2011-07-13 23:59:59'
        },
        ServiceArea: {
          PrimaryServiceAreaCode: {
            SACode: 'ZZGL103'
          },
          AdditionalServiceAreaCodes: {
            SACode: ['ZZL01', 'ZZL02', 'ZZL03']
          }
        },
        ExcavationInfo: {
          DigsiteInfo: {
            WellKnownText: 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))'
          }
        },
        Excavator: {
          CompanyName: 'John Doe CONSTRUCTION',
          Address: '555 Some RD',
          City: 'SOME PARK',
          State: 'ZZ',
          Zip: '55555',
          CrewOnsite: 'true'
        }
      }
    end

    context 'succcesfull response' do
      it 'returns message about success creation' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:created)
        expect(Ticket.count).to eq(1)
        expect(Excavator.count).to eq(1)
      end
    end

    context 'failure response' do
      it 'returns unprocessed entity exception' do
        valid_attributes.delete(:RequestNumber)
        post :create, params: valid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
