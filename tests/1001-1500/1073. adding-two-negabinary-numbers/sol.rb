# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def add_negabinary(arr1, arr2)
    res = []
    carry = 0
    while carry != 0 || !arr1.empty? || !arr2.empty?
        carry += arr1.pop.to_i
        carry += arr2.pop.to_i
        res.push(carry & 1)
        carry = -(carry >> 1)
    end
    
    while res.length > 1 && res[-1] == 0
        res.pop
    end
    res.reverse
end
