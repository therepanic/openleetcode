# @param {Integer} a
# @param {Integer} b
# @return {String}
def str_without3a3b(a, b)
    res = ""
    prev_a = 0
    prev_b = 0
    
    while a > 0 || b > 0
        if prev_a == 2 && b > 0
            res += "b"
            b -= 1
            prev_b += 1
            prev_a = 0
        elsif prev_b == 2 && a > 0
            res += "a"
            a -= 1
            prev_a += 1
            prev_b = 0
        elsif a > b && a > 0
            res += "a"
            a -= 1
            prev_a += 1
        elsif b > 0
            res += "b"
            b -= 1
            prev_b += 1
        end
    end
    res
end
