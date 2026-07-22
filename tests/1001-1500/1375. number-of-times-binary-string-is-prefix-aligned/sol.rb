# @param {Integer[]} flips
# @return {Integer}
def num_times_all_blue(flips)
    res = 0
    max_flips = 0
    
    flips.each_with_index do |flip, i|
        max_flips = [max_flips, flip].max
        res += 1 if max_flips == i + 1
    end
    
    res
end
