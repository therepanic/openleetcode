class Solution {
    func maxCandies(_ status: [Int], _ candies: [Int], _ keys: [[Int]], _ containedBoxes: [[Int]], _ initialBoxes: [Int]) -> Int {
        var status = status
        var owned = Set(initialBoxes)
        var opened = Set<Int>()
        var changed = true
        var totalCandies = 0
        while changed {
            changed = false
            for boxId in owned {
                if opened.contains(boxId) || status[boxId] == 0 {
                    continue
                }
                opened.insert(boxId)
                changed = true
                totalCandies += candies[boxId]
                for keyId in keys[boxId] {
                    status[keyId] = 1
                }
                owned.formUnion(containedBoxes[boxId])
            }
        }
        return totalCandies
    }
}
