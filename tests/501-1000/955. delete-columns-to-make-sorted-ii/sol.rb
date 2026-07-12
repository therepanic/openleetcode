# @param {String[]} strs
# @return {Integer}
def min_deletion_size(strs)
    n = strs.length
    m = strs[0].length
    sorted_pairs = Array.new(n - 1, false)
    del_count = 0

    (0...m).each do |col|
        bad = false
        (0...n - 1).each do |i|
            if !sorted_pairs[i] && strs[i][col] > strs[i + 1][col]
                bad = true
                break
            end
        end

        if bad
            del_count += 1
            next
        end

        (0...n - 1).each do |i|
            if !sorted_pairs[i] && strs[i][col] < strs[i + 1][col]
                sorted_pairs[i] = true
            end
        end

        break if sorted_pairs.all?
    end

    del_count
end
