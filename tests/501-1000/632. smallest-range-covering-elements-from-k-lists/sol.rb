# @param {Integer[][]} nums
# @return {Integer[]}
def smallest_range(nums)
  heap = []
  cur_max = -Float::INFINITY
  nums.each_with_index do |arr, idx|
    heap << [arr[0], idx, 0]
    cur_max = [cur_max, arr[0]].max
  end
  heap.sort_by! { |a| a[0] }
  small = [-Float::INFINITY, Float::INFINITY]
  while !heap.empty?
    cur_min, list_idx, i = heap.shift
    if cur_max - cur_min < small[1] - small[0]
      small = [cur_min, cur_max]
    end
    if i + 1 < nums[list_idx].length
      nxt = nums[list_idx][i + 1]
      heap << [nxt, list_idx, i + 1]
      heap.sort_by! { |a| a[0] }
      cur_max = [cur_max, nxt].max
    else
      break
    end
  end
  small
end
