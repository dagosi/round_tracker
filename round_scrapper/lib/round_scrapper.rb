require "round_scrapper/version"
require "round_scrapper/round"
require "round_scrapper/round_parser"

require 'mail'

module RoundScrapper
  def self.send_email
    options = { 
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => 'herokuapp.com',
      :user_name            => ENV['MAIL_USER_NAME'],
      :password             => ENV['MAIL_PASSWORD'],
      :authentication       => 'plain',
      :enable_starttls_auto => true
    }

    Mail.defaults do
      delivery_method :smtp, options
    end

    mail = Mail.new do
      from 'danielgomezsierra@gmail.com'
      to 'danielgomezsierra@gmail.com'
      subject 'Test!'
      body 'This is the content'
    end

    mail.deliver
  end
end