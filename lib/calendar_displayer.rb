require_relative 'event'


class CalendarDisplayer
  def initialize
    create_calendar
  end

  def line_printer(i, i2)
    7.times do |i3| ### colones sur chaque ligne
      jour = (i3 + 1) + (7 * i)
      if jour < 32
        date = Time.parse("2021-01-#{jour.to_s} 01:00")
        event_day = seek_event_at_date(date)
        event_duration = seek_event_d_at_date(date).to_s + " min"
        event_nbr = count_event_at_date(date) 
      else
        event_day == nil
      end

      #### ligne des jours
      if i2 == 0 && jour < 32
        if i3 < 6
          print "|#{jour.to_s}#{" " * (9 - jour.to_s.length)}"
        else
          puts "|#{jour.to_s}#{" " * (8 - jour.to_s.length)}|"
        end

      #### ligne nom des events
      elsif i2 == 1
        #### si 1 event ce jour ci
        if event_day != nil && event_nbr == 1
          if i3 < 6
              if event_day.length < 9
                print "|#{event_day}#{" " * (9 - event_day.length)}"
              else
                print "|#{event_day[0, 9]}"  
              end
          else
              if event_day.length < 9
                puts "|#{event_day}#{" " * (8 - event_day.length)}|"
              else
                puts "|#{event_day[0, 8]}|"  
              end
          end
        #### si plusieurs events
        elsif event_day != nil && event_nbr > 1
          if i3 < 6
            print "|#{event_nbr} events "
          else
            puts "|#{event_nbr} events|"
          end
        #### si pas d'event ce jour ci  
        else
          if i3 < 6
            print "|#{" " * 9 }"
          else
            puts "|#{" " * 8}|"
          end
        end
      
      elsif i2 == 2
        #### si event ce jour ci
        if event_day != nil
          if i3 < 6
              if event_duration.to_s.length < 9
                print "|#{event_duration}#{" " * (9 - event_duration.length)}"
              else
                print "|#{event_duration[0, 8]}"  
              end
          else
              if event_duration.length < 9
                puts "|#{event_duration}#{" " * (8 - event_duration.length)}|"
              else
                puts "|#{event_duration[0, 7]}|"  
              end
          end
        #### si pas d'event ce jour ci  
        else
          if i3 < 6
            print "|#{" " * 9 }"
          else
            puts "|#{" " * 8}|"
          end
        end

      else
        if i3 < 6
          print "|#{" " * 9 }"
        else
          puts "|#{" " * 8}|"
        end
      end

    end
  end

  def create_calendar
    puts "----------------------------------------------------------------------"
    5.times do |i| #### blocs de semaines lignes
      6.times do |i2| ### blocs de 5 lignes par semaine + ligne fin
        line_printer(i, i2)  
        if i2 == 5 
          puts "----------------------------------------------------------------------"
        end
      end
    end
  end

  def seek_event_at_date(date)
    event_array = Event.all
    event_array.each do |evenement|
      if evenement.start_date.day == date.day
        return evenement.title.to_s
      end
    end
    return nil
  end

  def seek_event_d_at_date(date)
    event_array = Event.all
    event_array.each do |evenement|
      if evenement.start_date.day == date.day
        return evenement.duration.to_s
      end
    end
    return nil
  end
 
  def count_event_at_date(date) 
    event_array = Event.all
    nb = 0
    event_array.each do |evenement|
      if evenement.start_date.day == date.day
        nb += 1
      end
    end
    return nb
  end


end