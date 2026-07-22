# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @param {Integer} d
# @return {Integer}
def find_the_distance_value(arr1, arr2, d)
    arr2.sort!
    count = 0
    arr1.each do |num|
        left_index = arr2.bsearch_index { |x| x >= num - d } || arr2.length
        right_index = arr2.bsearch_index { |x| x > num + d } || arr2.length
        count += 1 if left_index == right_index
    end
    count
end
