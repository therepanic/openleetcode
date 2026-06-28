class Solution {
    fun countOfAtoms(formula: String): String {
        var i = intArrayOf(0)
        val atomsFreq = decodeAtomsHelper(i, formula)
        
        val sortedAtomFreq = atomsFreq.toSortedMap()
        
        val decodedFormula = StringBuilder()
        for ((key, value) in sortedAtomFreq) {
            decodedFormula.append(key)
            if (value > 1) {
                decodedFormula.append(value)
            }
        }
        
        return decodedFormula.toString()
    }
    
    private fun decodeAtomsHelper(i: IntArray, s: String): MutableMap<String, Int> {
        val size = s.length
        val decoded = mutableMapOf<String, Int>()
        
        while (i[0] < size) {
            var atom = ""
            var power = 0
            
            if (s[i[0]] in 'A'..'Z') {
                atom += s[i[0]]
                i[0]++
                
                while (i[0] < size && s[i[0]] in 'a'..'z') {
                    atom += s[i[0]]
                    i[0]++
                }
            }
            
            while (i[0] < size && s[i[0]] in '0'..'9') {
                power = power * 10 + (s[i[0]] - '0')
                i[0]++
            }
            
            if (atom.isNotEmpty()) {
                if (power == 0) {
                    decoded[atom] = decoded.getOrDefault(atom, 0) + 1
                } else {
                    decoded[atom] = decoded.getOrDefault(atom, 0) + power
                }
            }
            
            power = 0
            atom = ""
            
            if (i[0] < size && s[i[0]] == '(') {
                i[0]++
                val smallerDecoded = decodeAtomsHelper(i, s)
                
                power = 0
                while (i[0] < size && s[i[0]] in '0'..'9') {
                    power = power * 10 + (s[i[0]] - '0')
                    i[0]++
                }
                
                if (power == 0) {
                    power = 1
                }
                
                for ((key, value) in smallerDecoded) {
                    decoded[key] = decoded.getOrDefault(key, 0) + value * power
                }
            }
            
            if (i[0] < size && s[i[0]] == ')') {
                i[0]++
                return decoded
            }
        }
        
        return decoded
    }
}
