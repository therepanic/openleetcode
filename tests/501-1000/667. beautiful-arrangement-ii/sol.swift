class Solution {
    func constructArray(_ n: Int, _ k: Int) -> [Int] {
        var ans = [Int]()
        for i in 1...(n - k) {
            ans.append(i)
        }
        for i in 0..<k {
            let diff = i / 2 + 1
            if i % 2 == 0 {
                ans.append(n - diff + 1)
            } else {
                ans.append(n - k + diff)
            }
        }
        return ans
    }
}
