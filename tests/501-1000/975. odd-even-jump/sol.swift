class Solution {
    func oddEvenJumps(_ arr: [Int]) -> Int {
        let n = arr.count
        var nextHigher = [Int?](repeating: nil, count: n)
        var nextLower = [Int?](repeating: nil, count: n)
        
        let indices = (0..<n).sorted { arr[$0] < arr[$1] }
        var stack = [Int]()
        for i in indices {
            while !stack.isEmpty && i > stack.last! {
                nextHigher[stack.removeLast()] = i
            }
            stack.append(i)
        }
        
        let indicesDesc = (0..<n).sorted { arr[$0] > arr[$1] }
        stack.removeAll()
        for i in indicesDesc {
            while !stack.isEmpty && i > stack.last! {
                nextLower[stack.removeLast()] = i
            }
            stack.append(i)
        }
        
        var odd = [Bool](repeating: false, count: n)
        var even = [Bool](repeating: false, count: n)
        odd[n - 1] = true
        even[n - 1] = true
        
        var result = 1
        for i in stride(from: n - 2, through: 0, by: -1) {
            if let higher = nextHigher[i] {
                odd[i] = even[higher]
            }
            if let lower = nextLower[i] {
                even[i] = odd[lower]
            }
            if odd[i] {
                result += 1
            }
        }
        return result
    }
}
