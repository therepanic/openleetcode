# @param {String} s
# @param {String} p
# @param {Integer[]} removable
# @return {Integer}
def maximum_removals(s, p, removable)
    left = 0
    right = removable.length
    max_k = 0
    while left <= right
        mid = (left + right) / 2
        removed = Array.new(s.length, false)
        (0...mid).each do |i|
            removed[removable[i]] = true
        end
        j = 0
        (0...s.length).each do |i|
            break if j >= p.length
            if !removed[i] && s[i] == p[j]
                j += 1
            end
        end
        if j == p.length
            max_k = mid
            left = mid + 1
        else
            right = mid - 1
        end
    end
    max_k
end
