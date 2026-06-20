# @param {Integer} n
# @return {Boolean}
def is_ugly(n)
    return false if n <= 0
    
    while n % 2 == 0
        n /= 2
    end
    while n % 3 == 0
        n /= 3
    end
    while n % 5 == 0
        n /= 5
    end
    
    return n == 1
end
