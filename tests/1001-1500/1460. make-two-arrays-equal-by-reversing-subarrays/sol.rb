# @param {Integer[]} target
# @param {Integer[]} arr
# @return {Boolean}
def can_be_equal(target, arr)
    counts = Array.new(1001, 0)
    
    target.zip(arr).each do |t, a|
        counts[t] += 1
        counts[a] -= 1
    end
    
    counts.all? { |c| c == 0 }
end
