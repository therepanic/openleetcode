# @param {String} s
# @param {Integer} k
# @return {Boolean}
def has_all_codes(s, k)
    req = 1 << k
    seen = Array.new(req, false)
    mask = req - 1
    h = 0

    s.each_char.with_index do |ch, i|
        h = ((h << 1) & mask) | (ch.ord & 1)

        if i >= k - 1 && !seen[h]
            seen[h] = true
            req -= 1
            return true if req == 0
        end
    end

    false
end
