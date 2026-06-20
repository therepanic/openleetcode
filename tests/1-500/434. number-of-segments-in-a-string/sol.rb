# @param {String} s
# @return {Integer}
def count_segments(s)
    c = 0
    (0...s.length).each do |i|
        if s[i] != ' ' && (i == 0 || s[i - 1] == ' ')
            c += 1
        end
    end
    c
end
