# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}
def closest_to_target(arr, target)
    n = arr.length
    log = Math.log2(n).floor + 1
    st = Array.new(n) { Array.new(log, 0) }
    n.times { |i| st[i][0] = arr[i] }
    (1...log).each do |j|
        (0..n - (1 << j)).each do |i|
            st[i][j] = st[i][j-1] & st[i + (1 << (j-1))][j-1]
        end
    end
    logs = Array.new(n + 1, 0)
    (2..n).each { |i| logs[i] = logs[i / 2] + 1 }
    query = lambda do |l, r|
        k = logs[r - l + 1]
        st[l][k] & st[r - (1 << k) + 1][k]
    end
    
    res = 2**31 - 1
    (0...n).each do |l|
        left = l
        right = n - 1
        while left <= right
            mid = (left + right) / 2
            val = query.call(l, mid)
            res = [res, (val - target).abs].min
            if val >= target
                left = mid + 1
            else
                right = mid - 1
            end
        end
    end
    res
end
