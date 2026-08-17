class Solution {

    func waysToBuildRooms(_ prevRoom: [Int]) -> Int {

        let MOD = 1_000_000_007

        let n = prevRoom.count

        var tree = Array(repeating: [Int](), count: n)

        for i in 1..<n {

            tree[prevRoom[i]].append(i)

        }

        var fact = [Int64](repeating: 1, count: n+1)

        var invFact = [Int64](repeating: 1, count: n+1)

        for i in 1...n {

            fact[i] = fact[i-1] * Int64(i) % Int64(MOD)

        }

        invFact[n] = powMod(fact[n], Int64(MOD-2), Int64(MOD))

        for i in stride(from: n, through: 1, by: -1) {

            invFact[i-1] = invFact[i] * Int64(i) % Int64(MOD)

        }

        var ways = [Int64](repeating: 0, count: n)

        var size = [Int](repeating: 0, count: n)

        func dfs(_ node: Int) {

            ways[node] = 1

            size[node] = 1

            for child in tree[node] {

                dfs(child)

                let oldSize = size[node]

                size[node] += size[child]

                ways[node] = ways[node] * comb(Int64(size[node]-1), Int64(oldSize-1), fact, invFact, Int64(MOD)) % Int64(MOD)

                ways[node] = ways[node] * ways[child] % Int64(MOD)

            }

        }

        dfs(0)

        return Int(ways[0])

    }

    private func comb(_ n: Int64, _ k: Int64, _ fact: [Int64], _ invFact: [Int64], _ mod: Int64) -> Int64 {

        if k < 0 || k > n { return 0 }

        return fact[Int(n)] * invFact[Int(k)] % mod * invFact[Int(n-k)] % mod

    }

    private func powMod(_ a: Int64, _ b: Int64, _ mod: Int64) -> Int64 {

        var res: Int64 = 1

        var base = a % mod

        var exp = b

        while exp > 0 {

            if exp & 1 == 1 {

                res = res * base % mod

            }

            base = base * base % mod

            exp >>= 1

        }

        return res

    }

}
