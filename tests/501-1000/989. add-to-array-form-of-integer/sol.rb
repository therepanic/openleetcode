# @param {Integer[]} num
# @param {Integer} k
# @return {Integer[]}
def add_to_array_form(num, k)
    out = []
    i = num.length - 1
    carry = k
    while i >= 0 || carry > 0
        if i >= 0
            carry += num[i]
            i -= 1
        end
        out << carry % 10
        carry /= 10
    end
    return [0] if out.empty?
    out.reverse
end
