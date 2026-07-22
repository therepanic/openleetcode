class Solution {
    fun getFolderNames(names: Array<String>): Array<String> {
        val nameCount = mutableMapOf<String, Int>()
        val result = mutableListOf<String>()

        for (name in names) {
            if (!nameCount.containsKey(name)) {
                result.add(name)
                nameCount[name] = 1
            } else {
                var k = nameCount[name]!!
                while (nameCount.containsKey("$name($k)")) {
                    k++
                }
                val newName = "$name($k)"
                result.add(newName)
                nameCount[name] = k + 1
                nameCount[newName] = 1
            }
        }

        return result.toTypedArray()
    }
}
