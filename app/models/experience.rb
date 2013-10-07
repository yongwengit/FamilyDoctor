class Experience < ActiveRecord::Base
  attr_accessible :title, :authorId, :createTime, :endTime, :privilege, :startTime, :text, :category

  private
  @authorName
  @commentCount
  @categoryName
  @comments

  public
  def setAuthorName(name)
    @authorName = name
  end

  def getAuthorName
    return @authorName
  end

  def setCommentCount(count)
    @commentCount = count
  end

  def getCommentCount
    return @commentCount
  end


  def setCategoryName(name)
    @categoryName =name
  end

  def getCategoryName
    return @categoryName
  end

  def setComments(comments)
    @comments = comments
  end

  def getComments
    return @comments
  end
end
