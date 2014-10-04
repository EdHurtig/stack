class Event < ActiveRecord::Base
  @_source_name = ""

  def style_class
    if "error" == level or "critical" == level or "fail" == level
       "danger"
    elsif  "warning" == level
       "warning"
    elsif "info" == level or "notice" == level
       "info"
    elsif "success" == level or "ok" == level
       "success"
    end
  end

  def self.recent_levels
    Event.where(created_at: 12.hours.ago..DateTime.now ).group(:level).count
  end

  def self.last_events_per_source
    @event_ids = Event.select("MAX(id) as id").group(:source).collect(&:id)

    Event.order(created_at: :desc).where(:id => @event_ids)

  end

  def source_name
    if @_source_name
      @_source_name
    else
      @_source_name = Source.find(source).name
    end

  end




end
