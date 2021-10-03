# frozen_string_literal: true

module Validations
  PASS_SIZE = 8
  MESSAGE_SIZE = 20

  def check(message)
    type = if message == @username
             'USER'
           elsif message == @password
             'PASSWORD'
           else
             'MESSAGE'
           end

    raise ArgumentError, "The field '#{type}' cann't be empty!" if message.empty? && message != @password

    if message.size < PASS_SIZE && message == @password
      raise ArgumentError,
            "The field '#{type}' must be at least 8 characters long!"
    end
    if message.size > MESSAGE_SIZE && message == @text
      raise ArgumentError,
            "The field '#{type}' must be between 1 and 280 characters long!"
    end

    print_message(message)
  end

  def print_message(message)
    if message == @password
      p "Password for user '#{username}' was saved!"
      p "Password = '#{password}'"
    elsif message == @text
      puts "Everything is ok. Your message '#{text}' was sent!"
    end
  end
end

class User
  include Validations
  attr_reader :username, :password

  def initialize(username, password)
    self.username = username
    self.password = password
  end

  def username=(username)
    @username = username
    check(username)
  end

  def password=(password)
    @password = password
    check(password)
  end
end

class Message
  include Validations
  attr_reader :text

  def initialize(text)
    self.text = text
  end

  def text=(text)
    @text = text
    check(text)
  end
end
