# @param {String} s
# @return {Integer}
def count_palindromic_subsequence(s)
    n = s.length
    first = Array.new(26, -1)
    last = Array.new(26, -1)

    s.each_char.with_index do |ch, i|
        c = ch.ord - 'a'.ord
        first[c] = i if first[c] == -1
        last[c] = i
    end

    ans = 0
    (0...26).each do |c|
        if first[c] != -1 && last[c] - first[c] > 1
            mask = 0
            (first[c] + 1...last[c]).each do |i|
                mask |= 1 << (s[i].ord - 'a'.ord)
            end
            ans += mask.to_s(2).count('1')
        end
    end

    ans
end
