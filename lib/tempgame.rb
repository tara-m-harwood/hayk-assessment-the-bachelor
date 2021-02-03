# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i # the number of temperatures to analyse
inputs = gets.split(" ")
result = inputs[0].to_i
for i in 0..(n-1)
    # t: a temperature expressed as an integer ranging from -273 to 5526
    t = inputs[i].to_i
    if t.abs() < result.abs() || (t.abs() == result.abs() && t > 0)
        result = t
    end
end

# Write an answer using puts
# To debug: S-1 -6 7TDERR.puts "Debug messages..."

puts result