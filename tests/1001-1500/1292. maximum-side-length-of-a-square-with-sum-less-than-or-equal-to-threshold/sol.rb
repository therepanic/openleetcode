# @param {Integer[][]} mat
# @param {Integer} threshold
# @return {Integer}
def max_side_length(mat, threshold)
    is_valid = ->(pref, k, limit) {
        n = pref.length
        m = pref[0].length
        (k - 1...n).each do |i|
            (k - 1...m).each do |j|
                x1 = i - k + 1
                y1 = j - k + 1
                total = pref[i][j]
                total -= pref[x1 - 1][j] if x1 > 0
                total -= pref[i][y1 - 1] if y1 > 0
                total += pref[x1 - 1][y1 - 1] if x1 > 0 && y1 > 0
                return true if total <= limit
            end
        end
        false
    }

    n = mat.length
    m = mat[0].length
    pref = mat.map(&:dup)
    (0...n).each do |i|
        (1...m).each do |j|
            pref[i][j] += pref[i][j - 1]
        end
    end
    (0...m).each do |j|
        (1...n).each do |i|
            pref[i][j] += pref[i - 1][j]
        end
    end
    low, high = 1, [n, m].min
    ans = 0
    while low <= high
        mid = (low + high) / 2
        if is_valid.call(pref, mid, threshold)
            ans = mid
            low = mid + 1
        else
            high = mid - 1
        end
    end
    ans
end
