# @param {String} binary
# @return {String}
def maximum_binary_string(binary)
    n = binary.length
    z = binary.count('0')
    
    return binary if z < 2
    
    first_zero = binary.index('0')
    p = first_zero + z - 1
    
    '1' * p + '0' + '1' * (n - p - 1)
end
