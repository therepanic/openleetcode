# @param {String} num
# @return {Boolean}
def sum_game(num)
    n = num.length
    half = n / 2
    sum_left = 0
    sum_right = 0
    q_left = 0
    q_right = 0

    (0...half).each do |i|
        if num[i] == '?'
            q_left += 1
        else
            sum_left += num[i].to_i
        end
    end

    (half...n).each do |i|
        if num[i] == '?'
            q_right += 1
        else
            sum_right += num[i].to_i
        end
    end

    (sum_left - sum_right) * 2 != (q_right - q_left) * 9
end
