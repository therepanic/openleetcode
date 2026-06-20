# @param {Integer} n
# @return {Integer}
def count_digit_one(n)
    count = 0
    factor = 1
    while factor <= n
        lower = n % factor
        cur = (n / factor) % 10
        higher = n / (factor * 10)
        if cur == 0
            count += higher * factor
        elsif cur == 1
            count += higher * factor + lower + 1
        else
            count += (higher + 1) * factor
        end
        factor *= 10
    end
    return count
end
