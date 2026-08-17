# @param {Integer} n
# @return {String}
def thousand_separator(n)
    s = n.to_s
    return s if s.length <= 3
    result = []
    count = 0
    s.reverse.each_char do |ch|
        result << ch
        count += 1
        if count % 3 == 0 && count < s.length
            result << '.'
        end
    end
    result.reverse.join
end
