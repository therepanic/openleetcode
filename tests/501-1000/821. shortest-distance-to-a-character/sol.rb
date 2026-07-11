# @param {String} s
# @param {Character} c
# @return {Integer[]}
def shortest_to_char(s, c)
    n = s.length
    ans = Array.new(n, n)
    prev = -n
    s.chars.each_with_index do |ch, i|
        if ch == c
            prev = i
        end
        ans[i] = i - prev
    end
    prev = 2 * n
    (n - 1).downto(0) do |i|
        if s[i] == c
            prev = i
        end
        ans[i] = [ans[i], prev - i].min
    end
    ans
end
