require_relative 'event'

class EventCreator

  def initialize
    puts "Veuillez saisir le Nom de l'évenement:"
    print "> "
    title = gets.chomp.to_s

    puts "Veuillez saisir une Date de début de l'événement: (ex: 2021-01-24 07:00)"
    print "> "
    date = Time.parse(gets.chomp.to_s)

    puts "Veuillez saisir une Durée en minutes:"
    print "> "
    duree = gets.chomp.to_i

    puts "Veuillez saisir les Mails des personnes invitées: (ex: exemple@mail.com blabla@gmail.com test@mail.fr)"
    print "> "
    invite = gets.chomp.to_s.split

    a = Event.new(date, duree, title, invite)
    return a
  end
end
