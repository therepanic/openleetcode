# @param {String} s
# @return {Integer[]}
def di_string_match(s)
    low, high = 0, s.length
    result = []
    s.each_char do |c|
        if c == 'I'
            result << low
            low += 1
        else
            result << high
            high -= 1
        end
    end
    result << low
    result
end
