class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var mp = [String: Int]()
        mp[list1[0]] = Int.min
        for i in 1..<list1.count {
            mp[list1[i]] = -i
        }
        if mp[list2[0]] == nil {
            mp[list2[0]] = Int.min
        } else {
            if mp[list2[0]] != Int.min {
                mp[list2[0]] = abs(mp[list2[0]]!)
            } else {
                mp[list2[0]] = 0
            }
        }
        for i in 1..<list2.count {
            if mp[list2[i]] != nil {
                if mp[list2[i]] != Int.min {
                    mp[list2[i]] = abs(mp[list2[i]]!) + i
                } else {
                    mp[list2[i]] = i
                }
            } else {
                mp[list2[i]] = -i
            }
        }
        var minVal = Int.max
        for val in mp.values {
            if val >= 0 {
                minVal = min(minVal, val)
            }
        }
        var ans = [String]()
        for (key, val) in mp {
            if val >= 0 && val == minVal {
                ans.append(key)
            }
        }
        return ans
    }
}
