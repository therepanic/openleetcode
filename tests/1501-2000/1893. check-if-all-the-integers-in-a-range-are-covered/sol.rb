# @param {Integer[][]} ranges
# @param {Integer} left
# @param {Integer} right
# @return {Boolean}
def is_covered(ranges, left, right)
    slots = [0] * 51
    ranges.each do |s, e|
        (s..e).each { |i| slots[i] = 1 }
    end
    (left..right).each do |i|
        return false if slots[i] == 0
    end
    true
end
