# @param {Integer} n
# @param {Integer[]} left
# @param {Integer[]} right
# @return {Integer}
def get_last_moment(n, left, right)
    max_val = 0
    left.each do |value|
        max_val = [value, max_val].max
    end
    right.each do |value|
        max_val = [n - value, max_val].max
    end
    max_val
end
