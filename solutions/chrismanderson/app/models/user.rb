class User < ActiveRecord::Base
  has_secure_password
  has_one :cart
  has_many :addresses
  has_many :orders

  attr_accessible :full_name, :email,
                  :username, :password,
                  :password_confirmation

  validates_presence_of :full_name, :password, :password_confirmation
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates_length_of :username,
                      :minimum => 2,
                      :maximum => 32,
                      :allow_blank => true
end
