require 'active_record'

class User < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :email_address
  validates_presence_of :email_address

end