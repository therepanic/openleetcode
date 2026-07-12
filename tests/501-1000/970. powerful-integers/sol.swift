class Solution {
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        var result = Set<Int>()
        var i = 1

        while i <= bound {
            var j = 1
            while i + j <= bound {
                result.insert(i + j)
                if y == 1 { break }
                j *= y
            }
            if x == 1 { break }
            i *= x
        }
        
        return Array(result)
    }
}
