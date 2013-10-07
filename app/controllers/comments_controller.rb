class CommentsController  < ApplicationController
  # To change this template use File | Settings | File Templates.
  def create
    if(session[:userid] == nil) then
      redirect_to :controller => 'family_doctor', :action => 'login', :notice => 'Your must login before add comment'
      return
    end
    @comment = Comment.new(params[:comment])
    @comment.authorId=session[:userid]
    @comment.createTime=Time.now
    @experience = Experience.find(@comment.experienceId)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @experience, notice: 'Comment was successfully added.' }
        format.json { render json: @experience, status: :created, location: @experience }
      else
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

end