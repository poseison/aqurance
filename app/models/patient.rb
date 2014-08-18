require 'date'
class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :measurements
  belongs_to :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:email]
         
  
  
         def self.age(birthday)
           return nil if birthday.nil?
           (Time.now.to_s(:number).to_i - birthday.to_time.to_s(:number).to_i)/10e9.to_i    
         end
end
