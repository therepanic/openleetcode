def find_median_sorted_arrays(nums1, nums2)
  if nums1.length > nums2.length
    nums1, nums2 = nums2, nums1
  end

  m = nums1.length
  n = nums2.length
  total_left = (m + n + 1) / 2
  left = 0
  right = m

  while left <= right
    i = (left + right) / 2
    j = total_left - i

    max_left1 = i == 0 ? -Float::INFINITY : nums1[i - 1]
    min_right1 = i == m ? Float::INFINITY : nums1[i]
    max_left2 = j == 0 ? -Float::INFINITY : nums2[j - 1]
    min_right2 = j == n ? Float::INFINITY : nums2[j]

    if max_left1 <= min_right2 && max_left2 <= min_right1
      left_max = [max_left1, max_left2].max
      return left_max.to_f if (m + n).odd?
      right_min = [min_right1, min_right2].min
      return (left_max + right_min) / 2.0
    end

    if max_left1 > min_right2
      right = i - 1
    else
      left = i + 1
    end
  end

  0.0
end
