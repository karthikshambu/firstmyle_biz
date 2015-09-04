class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
    user = User.new(params[:user])
    if user.save
      redirect_to user_session_path
    end
  end

  def update
    super
  end
end