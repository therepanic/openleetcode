class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        if arr.filter({ $0 == 0 }).count >= 2 {
            return true
        }

        for i in arr {
            if i != 0 && arr.contains(i * 2) {
                return true
            }
        }
        return false
    }
}
