func minWastedSpace(packages []int, boxes [][]int) int {
    sort.Ints(packages)
    n := len(packages)
    totalPackageSum := 0
    for _, p := range packages {
        totalPackageSum += p
    }
    
    minGrossArea := int64(1<<62)
    
    for _, supplierBoxes := range boxes {
        sort.Ints(supplierBoxes)
        if supplierBoxes[len(supplierBoxes)-1] < packages[n-1] {
            continue
        }
        
        var grossArea int64 = 0
        lowIdx := 0
        
        for _, b := range supplierBoxes {
            highIdx := upperBound(packages, b, lowIdx)
            count := highIdx - lowIdx
            if count > 0 {
                grossArea += int64(b) * int64(count)
                lowIdx = highIdx
            }
            if lowIdx == n {
                break
            }
        }
        
        if grossArea < minGrossArea {
            minGrossArea = grossArea
        }
    }
    
    if minGrossArea == int64(1<<62) {
        return -1
    }
    return int((minGrossArea - int64(totalPackageSum)) % 1000000007)
}

func upperBound(arr []int, target int, lo int) int {
    hi := len(arr)
    for lo < hi {
        mid := lo + (hi-lo)/2
        if arr[mid] <= target {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}
