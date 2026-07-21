class Solution {
    fun removeSubfolders(folder: Array<String>): List<String> {
        folder.sort()
        val res = mutableListOf<String>()
        for (f in folder) {
            if (res.isEmpty()) {
                res.add(f)
            } else {
                val prev = res.last()
                if (f.startsWith(prev) && f.length > prev.length && f[prev.length] == '/') {
                    continue
                } else {
                    res.add(f)
                }
            }
        }
        return res
    }
}
