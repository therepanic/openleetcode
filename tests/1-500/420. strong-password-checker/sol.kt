class Solution {
    fun strongPasswordChecker(password: String): Int {
        val lowercase = setOf('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
        val uppercase = setOf('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
        val digit = setOf('0','1','2','3','4','5','6','7','8','9')
        
        val characters = password.toSet()
        
        val needsLowercase = !characters.any { it in lowercase }
        val needsUppercase = !characters.any { it in uppercase }
        val needsDigit = !characters.any { it in digit }
        val numRequiredTypeReplaces = (if (needsLowercase) 1 else 0) + (if (needsUppercase) 1 else 0) + (if (needsDigit) 1 else 0)
        
        val numRequiredInserts = maxOf(0, 6 - password.length)
        val numRequiredDeletes = maxOf(0, password.length - 20)
        
        val groups = mutableListOf<Int>()
        if (password.isNotEmpty()) {
            var count = 1
            for (i in 1 until password.length) {
                if (password[i] == password[i-1]) {
                    count++
                } else {
                    groups.add(count)
                    count = 1
                }
            }
            groups.add(count)
        }
        
        repeat(numRequiredDeletes) {
            val argmin = groups.indices.minByOrNull { i ->
                val group = groups[i]
                if (group >= 3) group % 3 else 10 - group
            }
            if (argmin != null) {
                groups[argmin] = groups[argmin] - 1
            }
        }
        
        val numRequiredGroupReplaces = groups.sumOf { it / 3 }
        
        return numRequiredDeletes + maxOf(numRequiredTypeReplaces, numRequiredGroupReplaces, numRequiredInserts)
    }
}
