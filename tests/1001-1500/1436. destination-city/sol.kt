class Solution {
    fun destCity(paths: List<List<String>>): String {
        val startCities = HashSet<String>()
        
        for (path in paths) {
            startCities.add(path[0])
        }
        
        for (path in paths) {
            if (path[1] !in startCities) {
                return path[1]
            }
        }
        
        return ""
    }

    // The local harness materializes nested arrays for this parameter.
    fun destCity(paths: Array<Array<String>>): String {
        val startCities = HashSet<String>()

        for (path in paths) {
            startCities.add(path[0])
        }

        for (path in paths) {
            if (path[1] !in startCities) {
                return path[1]
            }
        }

        return ""
    }
}
