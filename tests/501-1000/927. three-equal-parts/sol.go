func threeEqualParts(arr []int) []int {
	n := len(arr)
	ones := 0
	for _, x := range arr {
		ones += x
	}
	if ones == 0 {
		return []int{0, n - 1}
	}
	if ones%3 != 0 {
		return []int{-1, -1}
	}

	k := ones / 3
	i1, i2, i3 := -1, -1, -1
	seen := 0
	for i, x := range arr {
		if x == 1 {
			seen++
			if seen == 1 {
				i1 = i
			} else if seen == k+1 {
				i2 = i
			} else if seen == 2*k+1 {
				i3 = i
				break
			}
		}
	}

	length := n - i3
	if i1+length > i2 || i2+length > i3 {
		return []int{-1, -1}
	}
	for i := 0; i < length; i++ {
		if arr[i1+i] != arr[i2+i] || arr[i1+i] != arr[i3+i] {
			return []int{-1, -1}
		}
	}
	return []int{i1 + length - 1, i2 + length}
}
