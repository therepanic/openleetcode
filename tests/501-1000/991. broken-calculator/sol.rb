# @param {Integer} start_value
# @param {Integer} target
# @return {Integer}
def broken_calc(start_value, target)
    ans = 0
    while target > start_value
        ans += 1
        if target % 2 == 1
            target += 1
        else
            target /= 2
        end
    end
    ans + start_value - target
end
