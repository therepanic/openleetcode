# @param {Integer} n
# @return {Integer}
def subtract_product_and_sum(n)
    sum_digits = 0
    product_digits = 1
    
    while n > 0
        digit = n % 10
        sum_digits += digit
        product_digits *= digit
        n /= 10
    end
    
    return product_digits - sum_digits
end
