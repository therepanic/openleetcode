# @param {Integer[][]} first_list
# @param {Integer[][]} second_list
# @return {Integer[][]}
def interval_intersection(first_list, second_list)
    return [] if first_list.empty? || second_list.empty?
    
    n, m = first_list.length, second_list.length
    res = []
    i = j = 0
    
    while i < n && j < m
        s1, e1 = first_list[i]
        s2, e2 = second_list[j]
        
        if e1 >= s2 && s1 <= e2
            res << [[s1, s2].max, [e1, e2].min]
        end
        
        if e1 > e2
            j += 1
        else
            i += 1
        end
    end
    
    res
end
