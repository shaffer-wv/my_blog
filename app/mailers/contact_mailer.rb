class ContactMailer < ActionMailer::Base
  default from: "shaffer.wv@gmail.com"

  def new_contact_message(message)
  	@message = message
  	mail(to: 'shaffer.wv@gmail.com', subject: "New Contact Message")
  end
end
