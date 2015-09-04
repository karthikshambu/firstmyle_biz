class Users::SessionsController < DeviseController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :new_business_sign_in, :create_business_sign_in ]
  prepend_before_filter :allow_params_authentication!, :only => [:create, :create_business_sign_in]
  prepend_before_filter { request.env["devise.skip_timeout"] = true }

  # GET /resource/sign_in
  def new
    self.resource = build_resource({})
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  def new_business_sign_in
    self.resource = build_resource({})
    clean_up_passwords(resource)
    render "/organizations/sign_in", :layout => 'organization_devise'
  end

  # Build a devise resource passing in the session. Useful to move
    # temporary session data to the newly created user.
    def build_resource(hash=nil)
      hash ||= resource_params || {}
      self.resource = resource_class.new_with_session(hash, session)
      self.resource.apply_omniauth(session[:omniauth])
      # self.resource.valid?
    end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end

  # POST /resource/sign_in
  def create_business_sign_in
    auth_options = {:scope=>:user, :recall=>"users/sessions#new_business_sign_in"}
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for_business(resource)
  end

  # DELETE /resource/sign_out
  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to redirect_path }
    end
  end

  # DELETE /organization/sign_out
  def destroy_business
    redirect_path = after_sign_out_path_for_business(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to redirect_path }
    end
  end

  protected

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { :methods => methods, :only => [:password] }
  end

  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#new" }
  end
end

