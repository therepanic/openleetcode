# @param {Integer[]} arr
# @param {Integer} difference
# @return {Integer}
def longest_subsequence(arr, difference)
    dic = {}
    arr.each do |x|
        if dic.key?(x - difference)
            dic[x] = dic[x - difference] + 1
        else
            dic[x] = 1
        end
    end
    dic.values.max
end
