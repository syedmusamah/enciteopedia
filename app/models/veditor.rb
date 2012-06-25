class Veditor < ActiveRecord::Base
acts_as_voteable
attr_accessor :password
attr_accessible :name, :email, :password, :password_confirmation
end
