# @param {Integer[]} arr
# @return {Boolean}
def unique_occurrences(arr)
    d = {}
    arr.each do |i|
        if d.key?(i)
            d[i] += 1
        else
            d[i] = 1
        end
    end
    s = Set.new
    d.values.each do |value|
        if s.include?(value)
            return false
        end
        s.add(value)
    end
    return true
end
