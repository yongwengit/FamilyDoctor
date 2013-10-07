class Comment < ActiveRecord::Base
  attr_accessible :authorId, :content, :createTime, :experienceId

  @authorName

  def setAuthorName(name)
    @authorName = name
  end

  def getAuthorName
    return @authorName
  end

  def Comment.setAuthorNameBatch(comments)
     comments.each do|comment|
       comment.setAuthorName(User.find(comment.authorId).username)
     end
  end
end
