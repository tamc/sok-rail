class Session
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :email
  attr_accessor :password
  attr_accessor :user
  
  def initialize(attributes = {})
    self.email = attributes[:email]
    self.password = attributes[:password]
  end
  
  def persisted? 
    false 
  end
  
  def save
    self.user = User.first(:email => email)
    return false unless user
    return user.authenticate(password)
  end
  
end
