# frozen_string_literal: true

class Vets::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: [:new, :create]
  before_action :authenticate_user!, only: [:edit, :update]

    def edit
    end

    def update
        if current_user.update(user_params)
            flash[:notice] = "Profil başarıyla güncellendi."
            redirect_to root_path
          else
            flash[:alert] = "Profil güncellenirken bir hata oluştu. Lütfen tekrar deneyin."
            render :edit
          end
        end


    def sign_up_params
      params.require(:vet).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone, :birth_date, :address, :certificate_no)
    end
  
    def account_update_params
      params.require(:vet).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :phone, :birth_date, :address, :certificate_no)
    end

    private

  def user_params
    params.require(:vet).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone, :birth_date, :address, :certificate_no)
  end


  
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end