# @param {Integer[]} arr
# @return {Integer}
def subarray_bitwise_o_rs(arr)
    result_ors = Set.new
    current_ors = Set.new
    
    arr.each do |x|
        next_ors = Set.new
        current_ors.each { |y| next_ors.add(x | y) }
        next_ors.add(x)
        result_ors.merge(next_ors)
        current_ors = next_ors
    end
    
    result_ors.size
end
