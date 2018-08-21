require 'selenium'
require 'watir' # Crawler
require 'pry' # Ruby REPL
require 'rb-readline' # Ruby IRB
require 'awesome_print' # Console output
require 'remove_emoji'


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

 # Parse data get ready to input into database
  system("ruby", "parse_info.rb") 

  # Read file an then put it into a array every two lines
    File.readlines('outputD.xls')

    a = IO.readlines("outputD.xls")
    a[0]   #=> "This is line one\n

    a.each do |x|
    x = puts RemoveEmoji::Sanitize.call("#{x}")
    print x
    end
