class Story < ActiveRecord::Base
  attr_accessible :title, :author, :endTime, :startTime, :text, :type, :privilege, :createTime
end
