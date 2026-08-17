# @param {String} s1
# @param {String} s2
# @return {Boolean}
def are_almost_equal(s1, s2)
    i = -1
    j = -1
    cnt = 0
    a = s1.chars
    b = s2.chars
    a.length.times do |k|
        if a[k] != b[k]
            cnt += 1
            if i == -1
                i = k
            elsif j == -1
                j = k
            end
        end
    end
    
    return true if cnt == 0
    return true if cnt == 2 && a[i] == b[j] && a[j] == b[i]
    false
end
