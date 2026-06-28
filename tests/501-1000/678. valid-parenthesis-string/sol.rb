# @param {String} s
# @return {Boolean}
def check_valid_string(s)
    low = 0
    high = 0
    s.each_char do |char|
        if char == '('
            low += 1
            high += 1
        elsif char == ')'
            low = [low - 1, 0].max
            high -= 1
        else
            low = [low - 1, 0].max
            high += 1
        end
        return false if high < 0
    end
    return low == 0
end
