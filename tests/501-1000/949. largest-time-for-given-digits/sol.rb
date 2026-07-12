# @param {Integer[]} arr
# @return {String}
def largest_time_from_digits(arr)
    perm_list = arr.permutation.to_a
    best_time = -1
    best_idx = -1
    
    perm_list.each_with_index do |perm, i|
        hours = perm[0] * 10 + perm[1]
        minutes = perm[2] * 10 + perm[3]
        
        if hours < 24 && minutes < 60
            curr_time = hours * 60 + minutes
            if curr_time > best_time
                best_time = curr_time
                best_idx = i
            end
        end
    end
    
    return "" if best_idx == -1
    
    res = perm_list[best_idx]
    return res[0].to_s + res[1].to_s + ':' + res[2].to_s + res[3].to_s
end
