# @param {Integer} n
# @return {Integer}
def integer_break(n)
    if n == 2
        return 1
    end
    if n == 3
        return 2
    end
    
    threes = n / 3
    remainder = n % 3
    
    if remainder == 1
        threes -= 1
        remainder = 4
    elsif remainder == 0
        remainder = 1
    end
    
    return (3 ** threes) * remainder
end
