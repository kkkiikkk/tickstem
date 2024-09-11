# frozen_string_literal: true

class TicketsController < ApplicationController
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
end

