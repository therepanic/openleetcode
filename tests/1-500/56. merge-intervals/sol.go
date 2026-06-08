func merge(intervals [][]int) [][]int {
    var sortIntervals func(int, int)
    sortIntervals = func(left, right int) {
        if left >= right {
            return
        }
        pivot := intervals[(left+right)/2][0]
        i, j := left, right
        for i <= j {
            for intervals[i][0] < pivot {
                i++
            }
            for intervals[j][0] > pivot {
                j--
            }
            if i <= j {
                intervals[i], intervals[j] = intervals[j], intervals[i]
                i++
                j--
            }
        }
        if left < j {
            sortIntervals(left, j)
        }
        if i < right {
            sortIntervals(i, right)
        }
    }
    sortIntervals(0, len(intervals)-1)

    merged := make([][]int, 0, len(intervals))
    for _, interval := range intervals {
        if len(merged) == 0 || merged[len(merged)-1][1] < interval[0] {
            merged = append(merged, interval)
        } else if interval[1] > merged[len(merged)-1][1] {
            merged[len(merged)-1][1] = interval[1]
        }
    }
    return merged
}
