# @param {Integer} n
# @return {Integer}
def monotone_increasing_digits(n)
    s = n.to_s.chars
    mark = s.length
    (s.length - 1).downto(1) do |i|
        if s[i] < s[i - 1]
            s[i - 1] = (s[i - 1].to_i - 1).to_s
            mark = i
        end
    end
    (mark...s.length).each do |i|
        s[i] = '9'
    end
    s.join.to_i
end
