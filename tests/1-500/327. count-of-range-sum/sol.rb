# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def count_range_sum(nums, lower, upper)
  prefix = [0]
  nums.each do |num|
    prefix << prefix[-1] + num
  end

  buffer = Array.new(prefix.length, 0)

  sort_count = lambda do |left, right|
    return 0 if right - left <= 1

    mid = left + (right - left) / 2
    count = sort_count.call(left, mid) + sort_count.call(mid, right)

    low = mid
    high = mid
    i = left
    while i < mid
      low += 1 while low < right && prefix[low] - prefix[i] < lower
      high += 1 while high < right && prefix[high] - prefix[i] <= upper
      count += high - low
      i += 1
    end

    p1 = left
    p2 = mid
    idx = left
    while p1 < mid && p2 < right
      if prefix[p1] <= prefix[p2]
        buffer[idx] = prefix[p1]
        p1 += 1
      else
        buffer[idx] = prefix[p2]
        p2 += 1
      end
      idx += 1
    end
    while p1 < mid
      buffer[idx] = prefix[p1]
      p1 += 1
      idx += 1
    end
    while p2 < right
      buffer[idx] = prefix[p2]
      p2 += 1
      idx += 1
    end
    (left...right).each do |k|
      prefix[k] = buffer[k]
    end

    count
  end

  sort_count.call(0, prefix.length)
end
