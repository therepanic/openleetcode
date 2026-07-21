# @param {String} croak_of_frogs
# @return {Integer}
def min_number_of_frogs(croak_of_frogs)
    maxi = 0
    curr = 0
    c = r = o = a = k = 0
    croak_of_frogs.each_char do |char|
        if char == 'c'
            c += 1
            curr += 1
        elsif char == 'r'
            r += 1
        elsif char == 'o'
            o += 1
        elsif char == 'a'
            a += 1
        elsif char == 'k'
            k += 1
            curr -= 1
        end
        maxi = [maxi, curr].max
        if c < r || r < o || o < a || a < k
            return -1
        end
    end
    if curr == 0 && c == r && r == o && o == a && a == k
        return maxi
    else
        return -1
    end
end
