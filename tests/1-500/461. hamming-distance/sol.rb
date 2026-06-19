# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def hamming_distance(x, y)
    count = 0
    if x == y
        return count
    end
    while x > 0 or y > 0
        x_bit = 0
        y_bit = 0
        if x > 0
            x_bit = x % 2
            x = x / 2
        end
        if y > 0
            y_bit = y % 2
            y = y / 2
        end
        if x_bit != y_bit
            count += 1
        end
    end
    return count
end
