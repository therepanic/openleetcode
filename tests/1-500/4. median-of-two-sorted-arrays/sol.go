func findMedianSortedArrays(nums1 []int, nums2 []int) float64 {
	if len(nums1) > len(nums2) {
		return findMedianSortedArrays(nums2, nums1)
	}

	m, n := len(nums1), len(nums2)
	totalLeft := (m + n + 1) / 2
	left, right := 0, m

	for left <= right {
		i := (left + right) / 2
		j := totalLeft - i

		maxLeft1 := -2147483647 - 1
		if i != 0 {
			maxLeft1 = nums1[i-1]
		}
		minRight1 := 2147483647
		if i != m {
			minRight1 = nums1[i]
		}
		maxLeft2 := -2147483647 - 1
		if j != 0 {
			maxLeft2 = nums2[j-1]
		}
		minRight2 := 2147483647
		if j != n {
			minRight2 = nums2[j]
		}

		if maxLeft1 <= minRight2 && maxLeft2 <= minRight1 {
			leftMax := maxLeft1
			if maxLeft2 > leftMax {
				leftMax = maxLeft2
			}
			if (m+n)&1 == 1 {
				return float64(leftMax)
			}
			rightMin := minRight1
			if minRight2 < rightMin {
				rightMin = minRight2
			}
			return float64(int64(leftMax)+int64(rightMin)) / 2.0
		}

		if maxLeft1 > minRight2 {
			right = i - 1
		} else {
			left = i + 1
		}
	}

	return 0
}
