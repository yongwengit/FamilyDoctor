class Experience < ActiveRecord::Base
  attr_accessible :title, :authorId, :createTime, :endTime, :privilege, :startTime, :text, :category
end
