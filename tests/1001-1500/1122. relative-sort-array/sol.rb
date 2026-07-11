# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def relative_sort_array(arr1, arr2)
    freq = Array.new(1001, 0)
    arr1.each { |num| freq[num] += 1 }
    idx = 0
    arr2.each do |num|
        while freq[num] > 0
            arr1[idx] = num
            idx += 1
            freq[num] -= 1
        end
    end
    (0...1001).each do |num|
        while freq[num] > 0
            arr1[idx] = num
            idx += 1
            freq[num] -= 1
        end
    end
    arr1
end
