class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)
    if @user.nil?
      @clearance_login_failure = true
      flash_failure_after_create
      render :template => 'sessions/new', :status => :unauthorized
    else
      sign_in(@user)
      respond_to do |format|
        flash[:notice] = "You're Logged In!"
        format.html {redirect_back_or(url_after_create)}
        format.js {render action:'create_success'}
      end
    end
  end
end
