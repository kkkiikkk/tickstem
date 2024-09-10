class TicketCreationService
  def initialize(ticket_params)
    @ticket_params = ticket_params
  end

  def create!
    Ticket.create!(
      request_number: @ticket_params[:RequestNumber],
      sequence_number: @ticket_params[:SequenceNumber],
      request_type: @ticket_params[:RequestType],
      response_due_date_time: @ticket_params[:DateTimes][:ResponseDueDateTime],
      primary_service_area_code: @ticket_params[:ServiceArea][:PrimaryServiceAreaCode][:SACode],
      additional_service_area_codes: @ticket_params[:ServiceArea][:AdditionalServiceAreaCodes][:SACode],
      digsite_info: @ticket_params[:ExcavationInfo][:DigsiteInfo][:WellKnownText]
    )
  end
end
