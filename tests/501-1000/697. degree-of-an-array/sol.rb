# @param {Integer[]} nums
# @return {Integer}
def find_shortest_sub_array(nums)
    left, right, count = {}, {}, {}
    nums.each_with_index do |x, i|
        unless left.key?(x)
            left[x] = i
        end
        right[x] = i
        count[x] = (count[x] || 0) + 1
    end

    ans = nums.length
    degree = count.values.max
    count.each do |x, c|
        if c == degree
            ans = [ans, right[x] - left[x] + 1].min
        end
    end

    ans
end
