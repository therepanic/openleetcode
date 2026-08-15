# @param {String} answer_key
# @param {Integer} k
# @return {Integer}
def max_consecutive_answers(answer_key, k)
    l = 0
    r = 0
    false_cnt = 0
    true_cnt = 0
    result = 0
    n = answer_key.length
    while r < n
        if answer_key[r] == 'T'
            true_cnt += 1
        end
        if answer_key[r] == 'F'
            false_cnt += 1
        end
        while true_cnt > k && false_cnt > k
            if answer_key[l] == 'T'
                true_cnt -= 1
            end
            if answer_key[l] == 'F'
                false_cnt -= 1
            end
            l += 1
        end
        result = [result, r - l + 1].max
        r += 1
    end
    result
end
