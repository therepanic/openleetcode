# @param {String} s
# @param {Integer[]} shifts
# @return {String}
def shifting_letters(s, shifts)
    l = []
    z = shifts.sum
    l << z
    (1...shifts.length).each do |i|
        l << l[-1] - shifts[i - 1]
    end
    p = s.chars.map { |c| c.ord - 97 }
    k = ""
    (0...p.length).each do |i|
        k += ((p[i] + l[i]) % 26 + 97).chr
    end
    k
end
