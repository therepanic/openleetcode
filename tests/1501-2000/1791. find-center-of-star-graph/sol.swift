class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        let a = edges[0][0], b = edges[0][1]
        let c = edges[1][0], d = edges[1][1]
        return (a == c || a == d) ? a : b
    }
}
