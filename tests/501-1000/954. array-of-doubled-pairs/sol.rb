# @param {Integer[]} arr
# @return {Boolean}
def can_reorder_doubled(arr)
    freq = Hash.new(0)
    arr.each { |i| freq[i] += 1 }
    
    arr.sort_by! { |x| x.abs }
    arr.each do |val|
        next if freq[val] == 0
        target = val * 2
        if freq[target] && freq[target] > 0
            freq[val] -= 1
            freq[target] -= 1
        else
            return false
        end
    end
    true
end
