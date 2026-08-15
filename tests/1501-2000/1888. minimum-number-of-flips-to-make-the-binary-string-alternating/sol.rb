# @param {String} s
# @return {Integer}
def min_flips(s)
    n = s.length
    t = s + s
    ans = n
    mis0 = 0

    (0...(2 * n)).each do |i|
        expected0 = i % 2 == 0 ? '0' : '1'
        mis0 += 1 if t[i] != expected0

        if i >= n
            left = i - n
            exp_left = left % 2 == 0 ? '0' : '1'
            mis0 -= 1 if t[left] != exp_left
        end

        if i >= n - 1
            mis1 = n - mis0
            ans = [ans, [mis0, mis1].min].min
        end
    end

    ans
end
