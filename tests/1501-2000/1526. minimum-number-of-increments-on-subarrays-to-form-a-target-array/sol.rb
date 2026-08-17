# @param {Integer[]} target
# @return {Integer}
def min_number_operations(target)
    total = target[0]
    (1...target.length).each do |i|
        if target[i] > target[i - 1]
            total += target[i] - target[i - 1]
        end
    end
    total
end
