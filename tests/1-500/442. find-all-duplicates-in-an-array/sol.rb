# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates(nums)
  r = []
  nums.each do |x|
    idx = x.abs - 1
    if nums[idx] < 0
      r << x.abs
    else
      nums[idx] = -nums[idx]
    end
  end
  r
end
