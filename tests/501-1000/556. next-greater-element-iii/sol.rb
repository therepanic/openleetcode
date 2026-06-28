# @param {Integer} n
# @return {Integer}
def next_greater_element(n)
    digits = n.to_s.chars
    length = digits.length
    pivot = -1

    (length - 2).downto(0) do |i|
        if digits[i] < digits[i + 1]
            pivot = i
            break
        end
    end

    return -1 if pivot == -1

    (length - 1).downto(pivot + 1) do |i|
        if digits[i] > digits[pivot]
            digits[i], digits[pivot] = digits[pivot], digits[i]
            break
        end
    end

    digits[pivot + 1..-1] = digits[pivot + 1..-1].reverse
    result = digits.join.to_i

    result <= 2**31 - 1 ? result : -1
end
