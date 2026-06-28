# @param {String} jewels
# @param {String} stones
# @return {Integer}
def num_jewels_in_stones(jewels, stones)
    count = 0
    jewels.each_char do |i|
        if stones.include?(i)
            count += stones.count(i)
        end
    end
    count
end
