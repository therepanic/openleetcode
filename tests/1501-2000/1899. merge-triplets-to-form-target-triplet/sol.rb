# @param {Integer[][]} triplets
# @param {Integer[]} target
# @return {Boolean}
def merge_triplets(triplets, target)
    return true if triplets.include?(target)
    curr = [0, 0, 0]
    triplets.each do |t|
        flag = false
        flag = true if target[0] == t[0] && curr[0] != target[0]
        flag = true if target[1] == t[1] && curr[1] != target[1]
        flag = true if target[2] == t[2] && curr[2] != target[2]
        if flag
            temp = curr.dup
            curr = [ [curr[0], t[0]].max, [curr[1], t[1]].max, [curr[2], t[2]].max ]
            if curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2]
                curr = temp
            end
        end
    end
    curr == target
end
