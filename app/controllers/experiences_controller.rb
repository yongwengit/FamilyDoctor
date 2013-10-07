class ExperiencesController < ApplicationController
  # GET /experiences
  # GET /experiences.json
  def index
    category = params[:category]
    if(category != nil) then
      @experiences = Experience.find_all_by_privilege_and_category(1,category);
    else
      @experiences = Experience.find_all_by_privilege(1)
    end

    userid = params[:userid]
    if(userid != nil)
      @experiences = Experience.find_all_by_authorId(userid)
    end

    @experiences.each do |experience|
      commentsForExp = Comment.find_by_sql("select * from comments where experienceId='#{experience.id}' order by createTime desc limit 3")
      Comment.setAuthorNameBatch(commentsForExp)
      experience.setComments commentsForExp
      experience.setAuthorName(User.find(experience.authorId).username)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiences }
    end
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @experience = Experience.find(params[:id])
    @experience.setAuthorName(User.find(@experience.authorId).username)
    case @experience.category
      when 1
        @experience.setCategoryName 'beautify'
      when 2
        @experience.setCategoryName 'whitening'
      when 3
        @experience.setCategoryName 'hypertension'
      when 4
        @experience.setCategoryName 'diabetes'
      else
        @experience.setCategoryName nil
    end

    @experience.setComments(Comment.find_all_by_experienceId(@experience.id))
    Comment.setAuthorNameBatch(@experience.getComments)

    @comment = Comment.new
    @comment.experienceId = @experience.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@experience, @comment]}
    end
  end

  # GET /experiences/new
  # GET /experiences/new.json
  def new
    @experience = Experience.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experience }
    end
  end

  # GET /experiences/1/edit
  def edit
    @experience = Experience.find(params[:id])
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(params[:experience])
    @experience.authorId = session[:userid]
    @experience.createTime = Time.now

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render json: @experience, status: :created, location: @experience }
      else
        format.html { render action: "new" }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiences/1
  # PUT /experiences/1.json
  def update
    @experience = Experience.find(params[:id])

    respond_to do |format|
      if @experience.update_attributes(params[:experience])
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy

    respond_to do |format|
      format.html { redirect_to experiences_url }
      format.json { head :no_content }
    end
  end
end
