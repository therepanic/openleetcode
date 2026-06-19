# @param {Integer} n
# @return {Integer}
def find_nth_digit(n)
    i = 1
    count = 9
    start = 1

    while n > i * count
        n -= i * count
        i += 1
        count *= 10
        start *= 10
    end

    number = start + (n - 1) / i
    return number.to_s[(n - 1) % i].to_i
end
