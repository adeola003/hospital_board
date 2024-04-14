class PagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      if @user.doctor?
        @partial = 'pages/doctor_content'
      elsif @user.receptionist?
        @partial = 'pages/receptionist_content'
      end

      # User is signed in, proceed with normal action
      # You can access the current user using `current_user`
    else
      # User is not signed in, redirect to the sign-in page
      redirect_to new_user_registration_path
    end
  end

  private

  def patients_list
    @patients = Patient.all
  end
end
