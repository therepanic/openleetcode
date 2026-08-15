# @param {String} s
# @return {Integer}
def min_swaps(s)
    swap = 0
    s.each_char do |char|
        if char == "["
            swap += 1
        else
            if swap > 0
                swap -= 1
            end
        end
    end
    (swap + 1) / 2
end
