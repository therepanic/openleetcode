func maxCandies(status []int, candies []int, keys [][]int, containedBoxes [][]int, initialBoxes []int) int {
    owned := make(map[int]bool)
    for _, box := range initialBoxes {
        owned[box] = true
    }
    opened := make(map[int]bool)
    changed := true
    totalCandies := 0
    for changed {
        changed = false
        for boxId := range owned {
            if opened[boxId] || status[boxId] == 0 {
                continue
            }
            opened[boxId] = true
            changed = true
            totalCandies += candies[boxId]
            for _, keyId := range keys[boxId] {
                status[keyId] = 1
            }
            for _, box := range containedBoxes[boxId] {
                owned[box] = true
            }
        }
    }
    return totalCandies
}
