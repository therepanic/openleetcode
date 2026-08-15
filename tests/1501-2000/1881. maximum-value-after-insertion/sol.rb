# @param {String} n
# @param {Integer} x
# @return {String}
def max_value(n, x)
    x = x.to_s
    if n[0] != '-'
        n.each_char.with_index do |c, i|
            if x > c
                return n[0...i] + x + n[i..]
            end
        end
        return n + x
    else
        (1...n.length).each do |i|
            if x < n[i]
                return n[0...i] + x + n[i..]
            end
        end
        return n + x
    end
end
