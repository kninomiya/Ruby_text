ARGV
strs = ARGV
strs = strs.map(&:to_i)
l = strs.last
strs.pop
p strs.sum/l
