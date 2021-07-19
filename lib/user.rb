class User
  attr_accessor :prenom, :nom, :email, :age
  @@user_count = 0
  @@user_array = []

  def initialize(prenom, nom, email_to_save, age_to_save)
    @prenom = prenom.to_s
    @nom = nom.to_s
    @email = email_to_save.to_s
    @age = age_to_save.to_i
    @@user_array.push(self)
    @@user_count = @@user_count + 1
  end

  def self.all
    return @@user_array
  end

  def self.find_by_email(mail)
    @@user_array.each do |i|
      if i.email == mail
        return i
      end
    end
  end
  
end