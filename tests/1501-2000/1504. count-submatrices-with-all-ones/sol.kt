class Solution {
    fun numSubmat(mat: Array<IntArray>): Int {
        val r = mat.size
        val c = mat[0].size
        val h = IntArray(c)
        var ans = 0
        
        for (i in 0 until r) {
            for (j in 0 until c) {
                h[j] = if (mat[i][j] == 1) h[j] + 1 else 0
            }
            
            val sumv = IntArray(c)
            val st = mutableListOf<Int>()
            
            for (j in 0 until c) {
                while (st.isNotEmpty() && h[st.last()] >= h[j]) {
                    st.removeAt(st.size - 1)
                }
                
                if (st.isNotEmpty()) {
                    val p = st.last()
                    sumv[j] = sumv[p] + h[j] * (j - p)
                } else {
                    sumv[j] = h[j] * (j + 1)
                }
                
                st.add(j)
                ans += sumv[j]
            }
        }
        
        return ans
    }
}
