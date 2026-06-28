# @param {Integer} m
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_kth_number(m, n, k)
    lo, hi = 1, m * n
    while lo < hi
        mid = (lo + hi) / 2
        count = 0
        (1..m).each do |i|
            count += n < mid / i ? n : mid / i
        end
        if count >= k
            hi = mid
        else
            lo = mid + 1
        end
    end
    lo
end
