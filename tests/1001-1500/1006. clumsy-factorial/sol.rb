# @param {Integer} n
# @return {Integer}
def clumsy(n)
    if n == 1
        return 1
    elsif n == 2
        return 2
    elsif n == 3
        return 6
    elsif n == 4
        return 7
    else
        if n % 4 == 0
            return n + 1
        elsif n % 4 <= 2
            return n + 2
        else
            return n - 1
        end
    end
end
