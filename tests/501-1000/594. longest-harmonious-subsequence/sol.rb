# @param {Integer[]} nums
# @return {Integer}
def find_lhs(nums)
    frequency_map = Hash.new(0)
    nums.each { |num| frequency_map[num] += 1 }
    
    max_length = 0
    frequency_map.each do |num, count|
        if frequency_map.key?(num + 1)
            current_length = count + frequency_map[num + 1]
            max_length = [max_length, current_length].max
        end
    end
    
    max_length
end
