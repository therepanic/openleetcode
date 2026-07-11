# @param {String} s
# @param {Integer} k
# @return {String}
def decode_at_index(s, k)
    size = 0
    s.each_char do |ch|
        if ch =~ /[0-9]/
            size *= ch.to_i
        else
            size += 1
        end
    end

    s.reverse.each_char do |ch|
        k %= size
        if k == 0 && ch =~ /[a-zA-Z]/
            return ch
        end
        if ch =~ /[0-9]/
            size /= ch.to_i
        else
            size -= 1
        end
    end
end
