# @param {Integer[]} nums
# @return {Integer}
def get_max_len(nums)
    pos_len = 0
    neg_len = 0
    max_len = 0
    nums.each do |num|
        if num == 0
            pos_len = 0
            neg_len = 0
        elsif num > 0
            pos_len += 1
            neg_len = neg_len > 0 ? neg_len + 1 : 0
        else
            temp = pos_len
            pos_len = neg_len > 0 ? neg_len + 1 : 0
            neg_len = temp + 1
        end
        max_len = [max_len, pos_len].max
    end
    max_len
end
