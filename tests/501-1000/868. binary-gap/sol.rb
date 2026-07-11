# @param {Integer} n
# @return {Integer}
def binary_gap(n)
    max_dist = 0
    curr_dist = 0
    found_first_one = false
    
    while n > 0
        bit = n % 2
        
        if bit == 1
            if found_first_one
                max_dist = [max_dist, curr_dist].max
            end
            
            curr_dist = 1
            found_first_one = true
        else
            if found_first_one
                curr_dist += 1
            end
        end
        
        n /= 2
    end
    
    max_dist
end
