class Solution {
    fun peopleIndexes(favoriteCompanies: Array<Array<String>>): List<Int> {
        val sets = favoriteCompanies.map { it.toSet() }
        val result = mutableListOf<Int>()
        
        for (i in sets.indices) {
            var isSubset = false
            for (j in sets.indices) {
                if (i != j && sets[j].containsAll(sets[i])) {
                    isSubset = true
                    break
                }
            }
            if (!isSubset) {
                result.add(i)
            }
        }
        
        return result
    }
}
