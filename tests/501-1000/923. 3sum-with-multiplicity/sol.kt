class Solution {
    fun threeSumMulti(arr: IntArray, target: Int): Int {
        arr.sort()
        val cnt = mutableMapOf<Int, Int>()
        for (x in arr) {
            cnt[x] = cnt.getOrDefault(x, 0) + 1
        }
        var res = 0L
        var i = 0
        val l = arr.size
        val MOD = 1_000_000_007
        
        while (i < l) {
            var j = i
            var k = l - 1
            
            while (j < k) {
                val s = arr[i] + arr[j] + arr[k]
                if (s < target) {
                    j += cnt[arr[j]]!!
                } else if (s > target) {
                    k -= cnt[arr[k]]!!
                } else {
                    if (arr[i] != arr[j] && arr[j] != arr[k]) {
                        res += cnt[arr[i]]!!.toLong() * cnt[arr[j]]!! * cnt[arr[k]]!!
                    } else if (arr[i] == arr[j] && arr[j] != arr[k]) {
                        val c = cnt[arr[i]]!!.toLong()
                        res += c * (c - 1) * cnt[arr[k]]!! / 2
                    } else if (arr[i] != arr[j] && arr[j] == arr[k]) {
                        val c = cnt[arr[j]]!!.toLong()
                        res += cnt[arr[i]]!!.toLong() * c * (c - 1) / 2
                    } else {
                        val c = cnt[arr[i]]!!.toLong()
                        res += c * (c - 1) * (c - 2) / 6
                    }
                    j += cnt[arr[j]]!!
                    k -= cnt[arr[k]]!!
                }
            }
            
            i += cnt[arr[i]]!!
        }
        
        return (res % MOD).toInt()
    }
}
