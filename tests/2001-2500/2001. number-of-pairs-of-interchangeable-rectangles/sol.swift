class Solution {
    func interchangeableRectangles(_ rectangles: [[Int]]) -> Int {
        func gcd(_ a: Int, _ b: Int) -> Int {
            var x = a
            var y = b
            while y != 0 {
                let temp = x % y
                x = y
                y = temp
            }
            return x
        }
        
        var ratioCount: [Pair<Int, Int>: Int] = [:]
        var result = 0
        
        for rect in rectangles {
            let width = rect[0], height = rect[1]
            let g = gcd(width, height)
            let reduced = Pair(a: width / g, b: height / g)
            result += ratioCount[reduced] ?? 0
            ratioCount[reduced] = (ratioCount[reduced] ?? 0) + 1
        }
        
        return result
    }
}

struct Pair<A: Hashable, B: Hashable>: Hashable {
    let a: A
    let b: B
}
