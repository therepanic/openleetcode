class Solution {
    fun countVowelStrings(n: Int): Int {
        if(n==1){
            return 5
        }else if(n==2){
            return 15
        }else if(n==3){
            return 35
        }
        val x=IntArray(n-2)
        x[0]=10
        var c=5
        for(i in 0 until n-3){
            x[i+1]=x[i]+c
            c++
        }
        val y=IntArray(n-1)
        y[0]=10
        for(i in 0 until n-2){
            y[i+1]=y[i]+x[i]
        }
        return y.sum()+5
    }
}
