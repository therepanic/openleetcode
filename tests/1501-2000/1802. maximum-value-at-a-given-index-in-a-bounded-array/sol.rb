# @param {Integer} n
# @param {Integer} index
# @param {Integer} max_sum
# @return {Integer}
def max_value(n, index, max_sum)
    def is_valid(mid, n, index, max_sum)
        left_count = index
        if mid > left_count
            left = (mid - left_count + mid - 1) * left_count / 2
        else
            ones = left_count - (mid - 1)
            left = mid * (mid - 1) / 2 + ones
        end

        right_count = n - index - 1
        if mid > right_count
            right = (mid - 1 + mid - right_count) * right_count / 2
        else
            ones = right_count - (mid - 1)
            right = mid * (mid - 1) / 2 + ones
        end

        left + mid + right <= max_sum
    end

    l, r, result = 0, max_sum, 1
    while l <= r
        mid = (l + r) / 2
        if is_valid(mid, n, index, max_sum)
            result = mid
            l = mid + 1
        else
            r = mid - 1
        end
    end
    result
end
