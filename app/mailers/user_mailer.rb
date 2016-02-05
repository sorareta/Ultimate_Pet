class UserMailer < ActionMailer::Base
  default from: "hola@groopiepets.me"

	def welcome(user)
	  @user = user
	  
	  mail(to: @user.email,
	    subject: 'Bienvenido a la aplicacion de Ultimate_PET') 
    
	end

end
