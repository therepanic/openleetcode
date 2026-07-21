class Solution {
    fun maxCandies(status: IntArray, candies: IntArray, keys: Array<IntArray>, containedBoxes: Array<IntArray>, initialBoxes: IntArray): Int {
        val owned = initialBoxes.toMutableSet()
        val opened = mutableSetOf<Int>()
        var changed = true
        var totalCandies = 0
        while (changed) {
            changed = false
            val ownedList = owned.toList()
            for (boxId in ownedList) {
                if (boxId in opened || status[boxId] == 0) continue
                opened.add(boxId)
                changed = true
                totalCandies += candies[boxId]
                for (keyId in keys[boxId]) {
                    status[keyId] = 1
                }
                owned.addAll(containedBoxes[boxId].toList())
            }
        }
        return totalCandies
    }
}
