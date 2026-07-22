# @param {String} s
# @return {Integer}
def find_the_longest_substring(s)
    mapy = [-2] * 32
    mapy[0] = -1

    res = 0
    mask = 0

    s.each_char.with_index do |c, i|
        case c
        when 'a'
            mask ^= 1
        when 'e'
            mask ^= 2
        when 'i'
            mask ^= 4
        when 'o'
            mask ^= 8
        when 'u'
            mask ^= 16
        end

        prev = mapy[mask]
        if prev == -2
            mapy[mask] = i
        else
            res = [res, i - prev].max
        end
    end

    res
end
