# @param {Integer[]} arr
# @return {Integer}
def odd_even_jumps(arr)
    n = arr.length
    next_higher = Array.new(n)
    next_lower = Array.new(n)
    
    stack = []
    arr.each_with_index.sort_by { |v, i| v }.each do |_, i|
        while !stack.empty? && i > stack.last
            next_higher[stack.pop] = i
        end
        stack.push(i)
    end
    
    stack = []
    arr.each_with_index.sort_by { |v, i| -v }.each do |_, i|
        while !stack.empty? && i > stack.last
            next_lower[stack.pop] = i
        end
        stack.push(i)
    end
    
    odd = Array.new(n, false)
    even = Array.new(n, false)
    odd[-1] = even[-1] = true
    (n - 2).downto(0) do |i|
        if next_higher[i]
            odd[i] = even[next_higher[i]]
        end
        if next_lower[i]
            even[i] = odd[next_lower[i]]
        end
    end
    odd.count(true)
end
