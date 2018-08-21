require 'remove_emoji'
File.readlines('outputD.xls')

a = IO.readlines("outputD.xls")
a[0]   #=> "This is line one\n


n = 2
names = (n - 1).step(a.size - 1, n).map { |i| a[i] }

class Array
  alias except - 
end

b = a.except names


a.each do |x|
    x = puts RemoveEmoji::Sanitize.call("#{x}")
    print x
end


