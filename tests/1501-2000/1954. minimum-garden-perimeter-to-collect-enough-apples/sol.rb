# @param {Integer} needed_apples
# @return {Integer}
def minimum_perimeter(needed_apples)
    lo, hi = 0, 100000
    while lo < hi
        mid = (lo + hi) / 2
        apples = 2 * mid * (mid + 1) * (2 * mid + 1)
        if apples >= needed_apples
            hi = mid
        else
            lo = mid + 1
        end
    end
    lo * 8
end
