# @param {Integer} target
# @return {Integer}
def reach_number(target)
    target = target.abs
    n = ((-1 + Math.sqrt(1 + 8 * target)) / 2).floor
    a = n * (n + 1) / 2
    b = a + n + 1
    
    if a == target
        return n
    end
    if (b - target) % 2 == 0
        return n + 1
    end
    (n + 2) % 2 == 1 ? n + 2 : n + 3
end
