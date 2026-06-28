# @param {String} s
# @return {String}
def to_lower_case(s)
    result = ""
    s.each_char do |ch|
        if ch.ord >= 65 && ch.ord <= 90
            result += (ch.ord + 32).chr
        else
            result += ch
        end
    end
    result
end
