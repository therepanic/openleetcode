class Solution {
    fun numberOfWeakCharacters(properties: Array<IntArray>): Int {
        properties.sortWith(compareBy({ -it[0] }, { it[1] }))
        
        var maxDefense = 0
        var weakCount = 0
        
        for (prop in properties) {
            if (prop[1] < maxDefense) {
                weakCount++
            } else {
                maxDefense = prop[1]
            }
        }
        
        return weakCount
    }
}
