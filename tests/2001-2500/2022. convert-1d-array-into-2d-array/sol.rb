# @param {Integer[]} original
# @param {Integer} m
# @param {Integer} n
# @return {Integer[][]}
def construct2_d_array(original, m, n)
    k = original.length
    return [] if m * n != k
    ans = []
    idx = 0
    while idx < k
        temp = []
        n.times do
            temp << original[idx]
            idx += 1
        end
        ans << temp
    end
    ans
end
