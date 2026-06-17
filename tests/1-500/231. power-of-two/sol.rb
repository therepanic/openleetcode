# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    n > 0 && (n & (n - 1)) == 0
end
