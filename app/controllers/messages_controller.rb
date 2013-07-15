class MessagesController < ApplicationController
  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(params[:message])
    if @message.valid?
      # TODO send message here
      ContactMailer.new_contact_message(@message).deliver
      redirect_to root_url, notice: "Message sent! Thank you for contacting us."
    else
      flash.now.alert = "There were errors. Please try again."
      render "new"
    end
  end
end
