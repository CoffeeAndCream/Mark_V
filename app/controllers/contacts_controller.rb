class ContactsController < ApplicationController
  def new
  end

  def create
    # Get message value from form
    @message = params
    # Check if SMTP
    if @message[:mode] == "SMTP"
      # Tell notifier action mailer to send via SMTP
      Notifier.send_email(@message).deliver
      # Redirect on success
      redirect_to root_path, notice: 'Message was sent via SMTP.'
    # Else send via API
    else
      # First, instantiate the Mailgun Client with your API key
      mg_client = Mailgun::Client.new ENV['pubkey-5d1ed0b7410e40c6d540d0fbb4133fc5']

      # Define your message parameters
      html_output = render_to_string template: "notifier/send_email"
      message_params = {:from    => 'Mailgun Test Project <seanjhulse@' + ENV['mg.coffee-and-cream.com'] + ">",
                        :to      => @message[:to],
                        :subject => 'Mailgun message via API',
                        :text    => @message[:body],
                        :html    => html_output.to_str,
                        "o:tag"  => 'test'}

      # Send your message through the client
      mg_client.send_message ENV['mg.coffee-and-cream.com'], message_params
      # Redirect on success
      redirect_to root_path, notice: 'Message was sent via API.'
    end
  end
end
