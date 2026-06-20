# @param {String} s
# @param {Integer} k
# @return {String}
def license_key_formatting(s, k)
    s = s.gsub("-", "").upcase
    result = []
    i = s.length
    while i > 0
        start = [0, i - k].max
        result << s[start...i]
        i -= k
    end
    result.reverse.join("-")
end
