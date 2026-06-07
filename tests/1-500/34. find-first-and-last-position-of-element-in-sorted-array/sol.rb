def search_range(nums, target)
  bound = lambda do |left|
    low = 0
    high = nums.length - 1
    ans = -1

    while low <= high
      mid = (low + high) / 2
      if nums[mid] < target
        low = mid + 1
      elsif nums[mid] > target
        high = mid - 1
      else
        ans = mid
        if left
          high = mid - 1
        else
          low = mid + 1
        end
      end
    end

    ans
  end

  [bound.call(true), bound.call(false)]
end
