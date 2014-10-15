class Event < ActiveRecord::Base
  @_source = nil

  def style_class
    if 'error' == level or 'critical' == level or 'fail' == level
       'danger'
    elsif  'warning' == level
       'warning'
    elsif 'info' == level or 'notice' == level
       'info'
    elsif 'success' == level or 'ok' == level
       'success'
    end
  end

  def self.recent_levels
    Event.where(created_at: 12.hours.ago..DateTime.now ).group(:level).count
  end

  def self.last_events_per_source
    @event_ids = Event.select('MAX(id) as id').group(:source).collect(&:id)

    Event.order(created_at: :desc).where(:id => @event_ids)

  end



  # Returns the name of the source that reported this event
  # Returns empty string if there is no source linked to the event
  def source_name
    if source
      # Lookup the Source Record by the Source ID of this event
      @_source = Source.find(source)
      if @_source
        @_source = @_source.name
      else
        @_source = ''
      end
    else
      ''
    end


  end
end
