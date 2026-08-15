# @param {String} boxes
# @return {Integer[]}
def min_operations(boxes)
    n = boxes.length
    distances = Array.new(n, 0)
    
    prefix_count = 0
    prefix_sum = 0
    
    (0...n).each do |i|
        distances[i] = prefix_count * i - prefix_sum
        if boxes[i] == '1'
            prefix_count += 1
            prefix_sum += i
        end
    end
    
    suffix_count = 0
    suffix_sum = 0
    
    (n-1).downto(0) do |i|
        distances[i] += suffix_sum - suffix_count * i
        if boxes[i] == '1'
            suffix_count += 1
            suffix_sum += i
        end
    end
    
    distances
end
