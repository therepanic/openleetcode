# @param {Integer} n
# @return {Integer}
def largest_palindrome(n)
    if n == 1
        return 9
    end
    
    min_num = 10 ** (n - 1)
    max_num = 10 ** n - 1
    max_pal = 0
    
    (max_num).step(min_num, -2) do |i|
        if i * i < max_pal
            break
        end
        
        (max_num).step(i, -2) do |j|
            product = i * j
            
            if product % 11 != 0 && product >= max_pal
                next
            end
            
            if product.to_s == product.to_s.reverse
                max_pal = product
            end
        end
    end
    
    max_pal % 1337
end
