class Customer < ActiveRecord::Base
	attr_accessor :password

	validates :firstName, :presence => true
  validates :lastName, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, :with => /^[\w]([^@\s,:]+)@(([\w_]+\.)(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid email adress"
  validates_format_of :phone, :with => /^(\+?\{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits"
  before_save :formate_phone,  :encrypt_password
  has_many :orders

   
  validates :password, :presence => true,
						:confirmation => true,
						:length => {:within => 6..40}
  
 
  def has_password?(submitted_password)
	encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, password)
	customer = find_by_email(email)
	if customer && customer.password_hash == BCrypt::Engine.hash_secret(password, customer.password_salt)
		customer
	else
		nil
	end
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
	customer = find_by_id(id)
	(customer && customer.password_salt == cookie_salt)? customer : nil
  end
  
  def proper_name
 	firstName + " " + lastName
  end
  
  private
  
  def encrypt_password
	if password.present?
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end
  end
  
  def formate_phone
  	phone = self.phone.to_s
  	#to avoid having nil phone field
  	phone.gsub!(/[^0-9]/, "")
  	#\ refers to regular expression
  	self.phone = phone
  end


end
