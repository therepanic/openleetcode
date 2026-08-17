# @param {String} target
# @return {Integer}
def min_flips(target)
    min_count = 0
    flag = 0
    n = target.length
    
    for i in 0...n
        if target[i] != (flag % 2 + 48).chr
            min_count += 1
            flag += 1
        end
    end
    
    min_count
end
