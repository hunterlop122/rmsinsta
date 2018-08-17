outputD = File.new("outputD.xls", "w")
outputD.close


def unwanted?(line)
  line.strip.empty? ||
    line.include?('Follow')
end

File.open('outputD.xls', 'w+') do |out|
  File.foreach('inputD.xls') do |line|
    out.puts line unless unwanted?(line)
  end
end