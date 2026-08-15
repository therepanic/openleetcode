class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        if n==1{
            return 5
        }else if n==2{
            return 15
        }else if n==3{
            return 35
        }
        var x=Array(repeating:0,count:n-2)
        x[0]=10
        var c=5
        if n>3{
            for i in 0..<(n-3){
                x[i+1]=x[i]+c
                c+=1
            }
        }
        var y=Array(repeating:0,count:n-1)
        y[0]=10
        for i in 0..<(n-2){
            y[i+1]=y[i]+x[i]
        }
        return y.reduce(0,+)+5
    }
}
