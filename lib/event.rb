class Event
  attr_accessor :start_date, :duration, :title, :attendees, :end_date
  @@events = []

  def initialize(start_date, duree_minutes, titre, invites)
    @start_date = Time.parse(start_date.to_s)
    @duration = duree_minutes.to_i
    @title = titre.to_s
    @attendees = invites.to_a
    @@events.push(self)
  end

  def postpone_24h
    @start_date = @start_date + (3600 * 24)
    return @start_date
  end

  def end_date
    @end_date = @start_date + (@duration * 60)
    return @end_date
  end

  def is_past?
    if @start_date < Time.now
      return true
    else
      return false
    end
  end

  def is_futur?
    if @start_date > Time.now
      return true
    else
      return false
    end
  end

  def is_soon?
    if (@start_date > Time.now) && (@start_date < (Time.now + 60 * 30))
      return true
    else
      return false
    end
  end

  def to_s
    puts "> Titre: #{@title}"
    puts "> Date de début: #{@start_date}"
    puts "> Date de fin: #{self.end_date}"
    puts "> Durée: #{@duration} min"
    puts "> Invités: #{@attendees.join(", ")}"
  end

  def self.all
    return @@events
  end

end