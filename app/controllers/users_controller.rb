class UsersController < ApplicationController
  def signup
  end

  def signup_complete
  	user = User.new
		user.username = params[:username]
		if params[:password] == params[:retype_password]
			user.password = params[:password]
			if user.save
				flash[:alert] = "성공적으로 가입 완료"
				redirect_to "/"
			else
				flash[:alert] = user.errors.values.flatten.join(' ')
				redirect_to :back
			end
		else
			flash[:alert] = "비밀번호 안 맞어"
			redirect_to :back
		end
	end

  def login
  end

  def login_complete
  	user = User.where(username: params[:username])[0]
		if user.nil?
			flash[:alert] = "아이디 또는 비밀번호 잘못 입력"
			redirect_to :back
		elseif user.password != params[:password]
			flash[:alert] = "아이디 또는 비밀번호 잘못 입력"
 			redirect_to :back
		else
			session[:user_id] = user.id
			flash[:alert] = "로그인 오케이"
			redirect_to "/"
		end
	end

  def logout_complete
  	reset_session
		flash[:alert] = "로그아웃 성공적"
		redirect_to "/"
	end
end
