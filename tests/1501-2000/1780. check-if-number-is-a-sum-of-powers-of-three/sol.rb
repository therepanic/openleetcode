# @param {Integer} n
# @return {Boolean}
def check_powers_of_three(n)
    while n > 0
        return false if n % 3 == 2
        n /= 3
    end
    true
end
