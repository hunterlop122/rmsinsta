require_relative 'selenium'
require_relative 'watir' # Crawler
require_relative 'pry' # Ruby REPL
require_relative 'rb-readline' # Ruby IRB
require_relative 'awesome_print' # Console output
require_relative 'remove_emoji'


# Open Browser, Navigate to Login page
  browser = Watir::Browser.new :chrome, switches: ['--incognito']
  browser.goto "https://www.instagram.com/accounts/login"

  # Navigate to Username and Password fields, inject info
  puts "Logging in..."
  browser.text_field(:name => "username").set "johndoeanon122"
  browser.text_field(:name => "password").set "Welc0me122"

  # Click Login Button
  browser.button(:class => '_5f5mN       jIbKX KUBKM      yZn4P   ').click
  sleep(2)
  puts "logged In"

  # Browser goto mcdance instagram page
  browser.goto "https://www.instagram.com/mdcdance"

  # Navigate to the followers section
  browser.link(:class => '-nal3 ').click
  sleep(2)

  # Scroll Page 
  browser.element(:class => ["NroHT"]).click
  startT = 0
  endT = 2

  while startT < endT do
    browser.send_keys :space
    sleep(1)
    startT+= 1
  end

  # Finally, scrape the followers
    d = browser.div(:class => ["_1xe_U"]).text

    inputD = File.new("inputD.xls", "w")
    inputD.close

    open('inputD.xls', 'a') do |f|
      f.puts d
    end