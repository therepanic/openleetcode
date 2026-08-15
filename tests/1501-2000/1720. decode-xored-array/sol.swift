class Solution {
    func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        var arr = [first]
        for e in encoded {
            arr.append(arr.last! ^ e)
        }
        return arr
    }
}
