class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0..<mat.count {
            let sum = mat[i].reduce(0, +)
            dict[i] = sum
        }
        return dict.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value }
            .prefix(k)
            .map { $0.key }
    }
}
