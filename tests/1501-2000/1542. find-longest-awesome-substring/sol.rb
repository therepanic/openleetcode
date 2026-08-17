# @param {String} s
# @return {Integer}
def longest_awesome(s)
    n = s.length
    mask = {}
    cur_mask = 0
    mask[cur_mask] = -1
    ans = 1
    (0...n).each do |i|
        num = s[i].to_i
        cur_mask ^= 1 << num
        need_mask = cur_mask
        if mask.key?(need_mask)
            ans = [ans, i - mask[need_mask]].max
        end
        (0...10).each do |bit|
            n_need_max = need_mask ^ (1 << bit)
            if mask.key?(n_need_max)
                ans = [ans, i - mask[n_need_max]].max
            end
        end
        mask[cur_mask] = i unless mask.key?(cur_mask)
    end
    ans
end
