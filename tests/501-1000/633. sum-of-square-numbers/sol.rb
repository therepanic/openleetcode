# @param {Integer} c
# @return {Boolean}
def judge_square_sum(c)
    left = 0
    right = Integer.sqrt(c)
    while left <= right
        current_sum = left * left + right * right
        if current_sum == c
            return true
        elsif current_sum < c
            left += 1
        else
            right -= 1
        end
    end
    false
end
