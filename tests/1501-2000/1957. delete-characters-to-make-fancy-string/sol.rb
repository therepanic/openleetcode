# @param {String} s
# @return {String}
def make_fancy_string(s)
    result = String.new
    last = nil
    count = 0

    s.each_char do |char|
        if char != last
            last = char
            count = 0
        end

        count += 1
        next if count > 2

        result << char
    end

    result
end
