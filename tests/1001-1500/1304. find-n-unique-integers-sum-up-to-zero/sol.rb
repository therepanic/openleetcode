# @param {Integer} n
# @return {Integer[]}
def sum_zero(n)
    Array.new(n) { |i| i * 2 - n + 1 }
end
