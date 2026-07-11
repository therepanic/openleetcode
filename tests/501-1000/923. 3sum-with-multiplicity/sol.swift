class Solution {
    func threeSumMulti(_ arr: [Int], _ target: Int) -> Int {
        var arr = arr.sorted()
        var cnt = [Int: Int]()
        for x in arr {
            cnt[x, default: 0] += 1
        }
        var res = 0
        var i = 0
        let l = arr.count
        let MOD = 1_000_000_007
        
        while i < l {
            var j = i
            var k = l - 1
            
            while j < k {
                let s = arr[i] + arr[j] + arr[k]
                if s < target {
                    j += cnt[arr[j]]!
                } else if s > target {
                    k -= cnt[arr[k]]!
                } else {
                    if arr[i] != arr[j] && arr[j] != arr[k] {
                        res += cnt[arr[i]]! * cnt[arr[j]]! * cnt[arr[k]]!
                    } else if arr[i] == arr[j] && arr[j] != arr[k] {
                        let c = cnt[arr[i]]!
                        res += c * (c - 1) * cnt[arr[k]]! / 2
                    } else if arr[i] != arr[j] && arr[j] == arr[k] {
                        let c = cnt[arr[j]]!
                        res += cnt[arr[i]]! * c * (c - 1) / 2
                    } else {
                        let c = cnt[arr[i]]!
                        res += c * (c - 1) * (c - 2) / 6
                    }
                    res %= MOD
                    j += cnt[arr[j]]!
                    k -= cnt[arr[k]]!
                }
            }
            
            i += cnt[arr[i]]!
        }
        
        return res
    }
}
