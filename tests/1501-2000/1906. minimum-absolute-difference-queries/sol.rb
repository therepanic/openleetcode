# @param {Integer[]} nums
# @param {Integer[][]} queries
# @return {Integer[]}
def min_difference(nums, queries)
    max_val = nums.max || 0
    p = Array.new(nums.length + 1) { Array.new(max_val + 1, 0) }
    (0..max_val).each { |j| p[0][j] = 0 }
    nums.each_with_index do |x, i|
        (0..max_val).each do |j|
            p[i + 1][j] = p[i][j] + (x == j ? 1 : 0)
        end
    end
    res = []
    queries.each do |l, r|
        diff = (0..max_val).map { |j| p[r + 1][j] - p[l][j] }
        prev = -1
        best = -1
        (0..max_val).each do |j|
            if diff[j] > 0
                if prev >= 0
                    best = j - prev if best == -1 || j - prev < best
                end
                prev = j
            end
        end
        res << best
    end
    res
end
