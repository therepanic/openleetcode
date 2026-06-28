# @param {Integer[]} nums
# @return {Integer}
def find_length_of_lcis(nums)
  ptr1 = 0
  ptr2 = 1
  n = nums.length
  return 0 if n == 0
  max_len_subseq = 1
  while ptr2 < n
    while ptr2 < n && nums[ptr2] > nums[ptr2 - 1]
      ptr2 += 1
    end
    max_len_subseq = [max_len_subseq, ptr2 - ptr1].max
    ptr1 = ptr2
    ptr2 += 1
  end
  max_len_subseq
end
