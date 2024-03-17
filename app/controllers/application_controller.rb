class ApplicationController < ActionController::Base
  # ユーザー認証
  before_action :authenticate_user!
  # deviseコントローラの場合、devise独自のストロングパラメータを使用する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # デフォルトで許可されているemail,password,password_confirmationに加えて、nameも追加で許可。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:password_confirmation])
  end
end
