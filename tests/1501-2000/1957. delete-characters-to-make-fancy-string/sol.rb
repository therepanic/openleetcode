# @param {String} s
# @return {String}
def make_fancy_string(s)
    return "" if s.empty?
    result = s[0]
    last = s[0]
    count = 1

    (1...s.length).each do |i|
        if s[i] != last
            last = s[i]
            count = 0
        end

        count += 1
        next if count > 2

        result += s[i]
    end

    result
end
