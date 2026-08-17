# @param {Integer[]} target
# @param {Integer[]} arr
# @return {Integer}
def min_operations(target, arr)
    target_index_map = {}
    target.each_with_index do |num, i|
        target_index_map[num] = i
    end
    
    transformed_arr = []
    arr.each do |num|
        if target_index_map.key?(num)
            transformed_arr << target_index_map[num]
        end
    end
    
    lis = []
    transformed_arr.each do |index|
        pos = lis.bsearch_index { |x| x >= index } || lis.length
        if pos == lis.length
            lis << index
        else
            lis[pos] = index
        end
    end
    
    target.length - lis.length
end
