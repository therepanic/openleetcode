class Solution {
    fun reorderLogFiles(logs: Array<String>): Array<String> {
        return logs.sortedWith(Comparator { log1, log2 ->
            val split1 = log1.split(" ", limit = 2)
            val split2 = log2.split(" ", limit = 2)
            val isDigit1 = split1[1][0].isDigit()
            val isDigit2 = split2[1][0].isDigit()
            if (!isDigit1 && !isDigit2) {
                val cmp = split1[1].compareTo(split2[1])
                if (cmp != 0) cmp else split1[0].compareTo(split2[0])
            } else {
                if (isDigit1 && isDigit2) 0
                else if (isDigit1) 1
                else -1
            }
        }).toTypedArray()
    }
}
