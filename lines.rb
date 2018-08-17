n = 3 # modify every 3rd line

File.open('new1.xls','w') do |f|               # Open the output file
  File.open('outputD.xls').each_with_index do |line,i| # Open the input file
    if (i+1) % n == 0                             # Every nth line
      f.print line.                      # Remove newline
    else                                          # Every non-nth line
      f.puts line                                 # Print line
    end
  end
end