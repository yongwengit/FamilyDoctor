class User < ActiveRecord::Base
  attr_accessible :id, :qq, :address, :birthDay, :gender, :password, :phone, :username
end
