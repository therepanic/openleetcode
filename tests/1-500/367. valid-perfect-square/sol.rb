# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
    return true if num < 2

    left, right = 2, num / 2
    while left <= right
        mid = (left + right) / 2
        squared = mid * mid
        if squared == num
            return true
        elsif squared < num
            left = mid + 1
        else
            right = mid - 1
        end
    end

    false
end
