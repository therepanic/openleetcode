class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        return operations.reduce(0) { $0 + ($1[$1.index($1.startIndex, offsetBy: 1)] == "+" ? 1 : -1) }
    }
}
