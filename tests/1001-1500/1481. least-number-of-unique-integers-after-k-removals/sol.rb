# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_least_num_of_unique_ints(arr, k)
    counts = arr.tally
    remaining = counts.size
    counts.values.sort.each do |count|
        break if k < count
        k -= count
        remaining -= 1
    end
    remaining
end
