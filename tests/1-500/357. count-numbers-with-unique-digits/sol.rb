# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
    return 1 if n == 0
    return 10 if n == 1
    result = 10
    current = 9
    (2..n).each do |i|
        current *= (10 - (i - 1))
        result += current
    end
    result
end
