
class Event
    attr_accessor :start_date, :duration, :title, :attendees
    
    def initialize(start_date, duration, title, attendees)
        @start_date = Time.parse(start_date)
        @duration = duration
        @title = title
        @attendees = attendees
    end

    def postpone_24h
        @start_date = (@start_date + (24 * 60 * 60))
    end

    def end_date
        @start_date = (@start_date + (@duration * 60))
    end

    def is_past?
        @start_date < Time.now
    end

    def is_future?
        @start_date > Time.now
    end

    def is_soon?
        @start_date < Time.now + (30 * 60)
    end

    def to_s
        puts "Titre: #{@title}"
        puts "Date de début: #{@start_date}}"
        puts "Durée: #{@duration}"
        puts "Invités: #{@attendees.join(", ")}" 
    end

    def age_analysis
        age_array = [] #On initialise un array qui va contenir les âges de tous les participants à un évènement
        average = 0 #On initialise une variable pour calculer la moyenne d'âge à l'évènement
    
        @attendees.each do |attendee| #On parcourt tous les participants (objets de type User)
          age_array << attendee.age #leur âge est stocké dans l'array des âges
          average = average + attendee.age #leur âge est additionné pour préparer le calcul de la moyenne
        end
    
        average = average / @attendees.length #on divise la somme des âges pour avoir la moyenne
    
        puts "Voici les âges des participants :"
        puts age_array.join(", ")
        puts "La moyenne d'âge est de #{average} ans"
      end    
end


class WorkEvent < Event # Créer une classe enfant à une classe parent
    attr_accessor :location

    def initialize(start_date, duration, title, attendees, location)
        @location = location # ajoute la ligne de code location

        super(start_date, duration, title, attendees) # l'appel de super permet d'initialisé la classe mère 
    end

    def is_event_acceptable?
  
      if @attendees.length > 3 || @duration > 60
        puts "Cette réunion ne respecte pas nos bonnes pratiques !"
        return false
      else
        puts "Cette réunion est OK."
        return true
      end
    end
end

julie = User.new("julie@email.com", 35)
jean = User.new("jean@maimail.com", 22)
marc = User.new("marc@email.com", 30)
oliv = User.new("oliv@maimail.com", 28)

my_event = Event.new("2019-01-13 09:00", 10, "standup quotidien", [julie, jean])
meeting = WorkEvent.new("2019-01-17 09:00", 70, "réunion de travail", [marc, oliv])
birthday = Event.new("2019-02-22 11:00", 70, "anniversaire", [julie, jean, oliv]

puts my_event.start_date
puts my_event.postpone_24h
puts my_event.end_date
puts my_event.is_past?
puts my_event.is_future?
puts my_event.is_soon?

puts my_event.to_s

puts my_event.age_analysis


puts meeting.is_event_acceptable?