# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
    n1, n2 = s1.length, s2.length
    return false if n2 < n1

    c1 = Array.new(26, 0)
    c2 = Array.new(26, 0)

    n1.times do |i|
        c1[s1[i].ord - 'a'.ord] += 1
        c2[s2[i].ord - 'a'.ord] += 1
    end

    return true if c1 == c2

    (n1...n2).each do |i|
        c2[s2[i].ord - 'a'.ord] += 1
        c2[s2[i - n1].ord - 'a'.ord] -= 1

        return true if c1 == c2
    end

    false
end
