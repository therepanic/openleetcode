# @param {Integer[]} nums
# @return {Integer}
def minimum_deviation(nums)
    return Float::INFINITY if nums.empty?
    
    evens = []
    min_val = Float::INFINITY
    
    nums.each do |num|
        if num.even?
            evens << -num
            min_val = [num, min_val].min
        else
            evens << -num * 2
            min_val = [num * 2, min_val].min
        end
    end
    
    evens.sort!
    res = Float::INFINITY
    
    while evens[0].even?
        max_val = -evens[0]
        evens[0] = evens[-1]
        evens.pop
        i = 0
        while (left = i * 2 + 1) < evens.length
            right = left + 1
            child = right < evens.length && evens[right] < evens[left] ? right : left
            break if evens[i] <= evens[child]
            evens[i], evens[child] = evens[child], evens[i]
            i = child
        end
        res = [res, max_val - min_val].min
        new_num = max_val / 2
        evens << -new_num
        i = evens.length - 1
        while i > 0
            p = (i - 1) / 2
            break if evens[p] <= evens[i]
            evens[p], evens[i] = evens[i], evens[p]
            i = p
        end
        min_val = [new_num, min_val].min
    end
    
    res = [-evens[0] - min_val, res].min
    res
end
