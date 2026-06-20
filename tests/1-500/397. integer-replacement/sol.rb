# @param {Integer} n
# @return {Integer}
def integer_replacement(n)
    helper = lambda do |x, c|
        return c if x == 1
        if x % 2 == 0
            helper.call(x >> 1, c + 1)
        else
            if x == 3 || ((x >> 1) & 1) == 0
                helper.call(x - 1, c + 1)
            else
                helper.call(x + 1, c + 1)
            end
        end
    end
    helper.call(n, 0)
end
