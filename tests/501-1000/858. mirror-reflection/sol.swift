class Solution {
    func mirrorReflection(_ p: Int, _ q: Int) -> Int {
        var pp = p
        var qq = q
        while pp % 2 == 0 && qq % 2 == 0 {
            pp /= 2
            qq /= 2
        }
        if pp % 2 == 0 { return 2 }
        if qq % 2 == 0 { return 0 }
        return 1
    }
}
