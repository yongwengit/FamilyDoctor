class FamilyDoctorController < ApplicationController
  def index
    redirect_to :action=>"index",:controller=>"experiences"
  end

  def login
    uname=params[:uName]
    upass=params[:uPass]
    session[:user]=nil
    user=User.find_all_by_username_and_password(uname,upass)
    if user && user.length == 1
      session[:user]=user[0]
      session[:username] =user[0].username
      session[:userid]=user[0].id
      @user=session[:user]
      redirect_to :action=>"index",:controller=>"family_doctor"
    else
      session[:user]=nil
      flash[:notice]="login failed!"
    end
  end

  def loginByOthers
    case params[:source]
      when "renren"
        FamilyDoctorController.loginByRenren
      when "qq"
        FamilyDoctorController.loginByQQ
      when "sina"
        FamilyDoctorController.loginBySina
      when "alipay"
        FamilyDoctorController.loginByAlipay
      else
        render :action => "login", :layout => false
    end
  end

  def exit
    session[:user]=nil
    redirect_to :action=>"index",:controller=>"family_doctor"
  end

  def register
    @user = User.new
    @user.username = "test"
    @user.password="123456"
    @user.phone=15210598765
    @user.qq=837965789
    @user.address="beijing"
    @user.gender="male"
    @user.birthDay=Time.mktime(1997,9)
    @user.save
  end

  private
  def FamilyDoctorController.loginByRenren
  end

  def FamilyDoctorController.loginByQQ
  end

  def FamilyDoctorController.loginBySina
  end

  def FamilyDoctorController.loginByAlipay
  end

end
