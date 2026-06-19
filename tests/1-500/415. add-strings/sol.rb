# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
    result = []
    carry = 0
    i, j = num1.length - 1, num2.length - 1
    
    while i >= 0 || j >= 0 || carry > 0
        digit1 = i >= 0 ? num1[i].ord - '0'.ord : 0
        digit2 = j >= 0 ? num2[j].ord - '0'.ord : 0
        
        total = digit1 + digit2 + carry
        carry = total / 10
        result.push((total % 10 + '0'.ord).chr)
        
        i -= 1
        j -= 1
    end
    
    result.reverse.join
end
