# @param {Integer} n
# @return {Integer[]}
def beautiful_array(n)
    if n == 1
        return [1]
    end
    
    left = beautiful_array((n + 1) / 2)
    right = beautiful_array(n / 2)
    
    left = left.map { |x| 2 * x - 1 }
    right = right.map { |x| 2 * x }
    
    left + right
end
