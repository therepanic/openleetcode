# @param {Integer[]} nums
# @return {Integer[]}
def sorted_squares(nums)
    newarr = []
    nums.each do |i|
        newarr.push(i*i)
    end
    newarr.sort!
    newarr
end
