# @param {Integer[]} arr
# @return {Integer}
def max_chunks_to_sorted(arr)
    ans = 0
    prev_max = 0
    arr.each_with_index do |x, idx|
        prev_max = [prev_max, x].max
        if prev_max == idx
            ans += 1
        end
    end
    ans
end
