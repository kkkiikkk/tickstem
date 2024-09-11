# frozen_string_literal: true

class ExcavatorCreationService
  def initialize(excavator_params, ticket_id)
    @excavator_params = excavator_params
    @ticket_id = ticket_id
  end

  def create!
    Excavator.create!(
      company_name: @excavator_params[:Excavator][:CompanyName],
      address: "#{@excavator_params[:Excavator][:Address]}, #{@excavator_params[:Excavator][:City]}, #{@excavator_params[:Excavator][:State]}, #{@excavator_params[:Excavator][:Zip]}",
      crew_on_site: @excavator_params[:Excavator][:CrewOnsite],
      ticket_id: @ticket_id
    )
  end
end
