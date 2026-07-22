# @param {Integer} n
# @return {Integer}
def num_of_ways(n)
    mod = 1000000007
    x, y = 6, 6
    
    (2..n).each do |i|
        new_x = (3 * x + 2 * y) % mod
        new_y = (2 * x + 2 * y) % mod
        x, y = new_x, new_y
    end
    
    (x + y) % mod
end
