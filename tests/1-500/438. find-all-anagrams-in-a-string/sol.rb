def find_anagrams(s, p)
    n1, n2 = s.length, p.length
    return [] if n1 < n2

    a = Array.new(26, 0)
    b = Array.new(26, 0)
    res = []

    n2.times do |i|
        a[p[i].ord - 97] += 1
        b[s[i].ord - 97] += 1
    end

    res << 0 if a == b

    (n2...n1).each do |i|
        b[s[i].ord - 97] += 1
        b[s[i - n2].ord - 97] -= 1
        res << i - n2 + 1 if a == b
    end

    res
end
