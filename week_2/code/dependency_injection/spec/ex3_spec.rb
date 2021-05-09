class EmailClient
  def initialize(message_class = Message)
    @message_class = message_class
  end

  def message
    @message_class.new
  end
end

class Message
  def send(to, body)
    # Imagine I'm sending an email
    "#{to} and #{body}"
  end
end

class SayHello
  def initialize(email_client = EmailClient.new)
    @email_client = email_client
  end 

  def run
    @email_client.message.send(
      "friend@example.com",
      "HELLO!"
    )
  end
end


RSpec.describe Message do
  describe "#send" do
    it 'should send a message' do
      expect(subject.send("Hello", "World")).to eq("Hello and World")
    end
  end
end

RSpec.describe EmailClient do
  describe "#message" do
    it 'creates a new message' do
      message_double = double(:message)
      message_class_double = double(:message_class, new: message_double) 
      email_client = EmailClient.new(message_class_double)
      expect(email_client.message).to eq(message_double)
    end
  end
end

RSpec.describe SayHello do
  describe '#run' do
    it 'should send a message' do
      message_double = double(:message, send: "Hello and World")
      email_client_double = double(:email_client, message: message_double)
      say_hello = SayHello.new(email_client_double)
      expect(say_hello.run).to eq("Hello and World")
    end
  end
end