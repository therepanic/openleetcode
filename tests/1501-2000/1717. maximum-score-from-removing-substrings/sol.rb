# @param {String} s
# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def maximum_gain(s, x, y)
    score = 0
    ch1, ch2 = 'a', 'b'
    cnt1 = cnt2 = 0

    if x < y
        x, y = y, x
        ch1, ch2 = 'b', 'a'
    end

    s.each_char do |ch|
        if ch == ch1
            cnt1 += 1
        elsif ch == ch2
            if cnt1 > 0
                cnt1 -= 1
                score += x
            else
                cnt2 += 1
            end
        else
            score += [cnt1, cnt2].min * y
            cnt1 = cnt2 = 0
        end
    end

    if cnt1 != 0
        score += [cnt1, cnt2].min * y
    end

    return score
end
