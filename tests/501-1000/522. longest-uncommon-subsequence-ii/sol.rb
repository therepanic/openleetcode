# @param {String[]} strs
# @return {Integer}
def find_lu_slength(strs)
    is_subsequence = lambda do |s, t|
        i = 0
        t.each_char do |c|
            i += 1 if i < s.length && s[i] == c
        end
        i == s.length
    end

    strs.sort_by! { |x| -x.length }

    strs.each_with_index do |s, i|
        all_not_sub = true
        strs.each_with_index do |t, j|
            next if i == j
            if is_subsequence.call(s, t)
                all_not_sub = false
                break
            end
        end
        return s.length if all_not_sub
    end

    -1
end
