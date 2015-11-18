require 'twilio-ruby'

class SendSMS
  def self.send_text(phone_nuber)
    account_sid = "ACb5d37ec881dbbc6e2b769dca8d7e2a33"
    auth_token = ENV['AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+17327985314"
    key  = "+1" + phone_nuber.gsub("-","")
    client.account.messages.create(
      :from => from,
      :to => key,
      :body => "Hey! You've placed an order"
    )
  end
end
