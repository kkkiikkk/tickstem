class TicketsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      ticket_creation_service = TicketCreationService.new(ticket_params)
      new_ticket = ticket_creation_service.create!

      excavator_creation_service = ExcavatorCreationService.new(excavator_params, new_ticket.id)
      excavator_creation_service.create!
    end

    render json: { message: "Ticket and Excavator created successfully" }, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def index
    @tickets = Ticket.includes(:excavator).all

    respond_to do |format|
      format.html
      format.json { render json: @tickets, include: [:excavator] }
    end
  end

  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @ticket, include: [:excavator] }
    end
  end

  private

  def ticket_params
    params.permit(
      :RequestNumber,
      :SequenceNumber,
      :RequestType,
      DateTimes: [:ResponseDueDateTime],
      ServiceArea: { PrimaryServiceAreaCode: [:SACode], AdditionalServiceAreaCodes: [:SACode] },
      ExcavationInfo: { DigsiteInfo: [:WellKnownText] }
    )
  end

  def excavator_params
    params.permit(
      Excavator: [:CompanyName, :Address, :City, :State, :Zip, :CrewOnsite]
    )
  end
end
