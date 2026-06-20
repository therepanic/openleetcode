class Solution {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        return solve(0, n, k)
    }

    private func solve(_ current: Int, _ n: Int, _ k: Int) -> Int {
        var kVar = k
        if kVar == 0 {
            return current / 10
        }

        let start = max(current, 1)
        for i in start..<(current + 10) {
            let count = numOfChildren(i, i + 1, n)
            if count >= kVar {
                return solve(i * 10, n, kVar - 1)
            }
            kVar -= count
        }

        return -1
    }

    private func numOfChildren(_ current: Int, _ neighbour: Int, _ n: Int) -> Int {
        if neighbour > n {
            if current > n {
                return 0
            }
            return n - current + 1
        }
        return (neighbour - current) + numOfChildren(current * 10, neighbour * 10, n)
    }
}
