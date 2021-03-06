class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.reverse_order
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @sources = Source.all
  end

  # GET /events/1/edit
  def edit
    @sources = Source.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    if 'text/html' == request.format
      @event.by = 'user'
    elsif 'application/json' == request.format
      @event.by = 'api'
    end

    respond_to do |format|
      if @event.save
        # @facts = params[:facts]
        #
        # @facts.each do |fact|
        #    Fact.new event: @event.id, name: fact[:name], data: fact[:data]
        # end

        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  # DELETE /events
  # DELETE /events.json
  def destroy_many
    Event.where(:id => params[:ids]).destroy_all
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :content, :level, :source, :by)
    end
end
