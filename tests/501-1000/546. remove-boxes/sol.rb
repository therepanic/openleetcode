# @param {Integer[]} boxes
# @return {Integer}
def remove_boxes(boxes)
    n = boxes.length
    memo = Array.new(n) { Array.new(n) { Array.new(n) } }
    dfs = lambda do |l, r, k|
        return 0 if l > r
        while l < r && boxes[r] == boxes[r - 1]
            r -= 1
            k += 1
        end
        cached = memo[l][r][k]
        return cached unless cached.nil?

        best = dfs.call(l, r - 1, 0) + (k + 1) * (k + 1)
        (l...r).each do |i|
            if boxes[i] == boxes[r]
                best = [best, dfs.call(l, i, k + 1) + dfs.call(i + 1, r - 1, 0)].max
            end
        end
        memo[l][r][k] = best
    end

    dfs.call(0, n - 1, 0)
end
