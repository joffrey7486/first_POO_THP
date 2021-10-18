class User
    attr_accessor :email, :age
    @@all_users = []

    def initialize(email, age) #on définit un initialize
        @email = email
        @age = age
        @@all_users << self
    end

    def self.all
        @@all_users
    end

    def self.find_by_email(email)
        @@all_users.select do |i|
          if i.email == email
            puts "Voici l'age du détenteur de l'email: #{i.age}"
          end
        end
    end
end

julie = User.new("julie@mail.com", 22)
jean = User.new("jean@mail.com", 25)
martin = User.new("martin@mail.com", 35)


#puts User.all
puts User.find_by_email("martin@mail.com")
puts User.find_by_email("julie@mail.com")
