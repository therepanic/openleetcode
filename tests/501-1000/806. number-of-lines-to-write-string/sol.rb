# @param {Integer[]} widths
# @param {String} s
# @return {Integer[]}
def number_of_lines(widths, s)
    lines = 1
    current = 0
    s.each_char do |c|
        w = widths[c.ord - 97]
        if current + w > 100
            lines += 1
            current = w
        else
            current += w
        end
    end
    [lines, current]
end
