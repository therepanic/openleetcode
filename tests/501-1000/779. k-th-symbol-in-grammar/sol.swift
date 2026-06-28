class Solution {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        if n == 1 {
            return 0
        }
        let parent = kthGrammar(n - 1, (k + 1) / 2)
        return k % 2 == 1 ? parent : 1 - parent
    }
}
