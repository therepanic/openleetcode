# @param {Integer[]} gain
# @return {Integer}
def largest_altitude(gain)
    ans = acc = 0
    gain.each do |it|
        acc += it
        d = acc - ans
        ans += d & ~(d >> 0x1F)
    end
    ans
end
