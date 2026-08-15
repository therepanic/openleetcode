func maximumUnits(boxTypes [][]int, truckSize int) int {
    sort.Slice(boxTypes, func(i, j int) bool {
        return boxTypes[i][1] > boxTypes[j][1]
    })
    ans := 0
    remaining := truckSize
    for _, box := range boxTypes {
        quantitytaken := box[0]
        if remaining < quantitytaken {
            quantitytaken = remaining
        }
        ans += box[1] * quantitytaken
        remaining -= quantitytaken
        if remaining == 0 {
            break
        }
    }
    return ans
}
