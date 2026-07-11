# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}
def three_sum_multi(arr, target)
    arr.sort!
    cnt = Hash.new(0)
    arr.each { |x| cnt[x] += 1 }
    res, i, l = 0, 0, arr.length
    
    while i < l
        j, k = i, l - 1
        
        while j < k
            s = arr[i] + arr[j] + arr[k]
            if s < target
                j += cnt[arr[j]]
            elsif s > target
                k -= cnt[arr[k]]
            else
                if arr[i] != arr[j] && arr[j] != arr[k]
                    res += cnt[arr[i]] * cnt[arr[j]] * cnt[arr[k]]
                elsif arr[i] == arr[j] && arr[j] != arr[k]
                    res += cnt[arr[i]] * (cnt[arr[i]] - 1) * cnt[arr[k]] / 2
                elsif arr[i] != arr[j] && arr[j] == arr[k]
                    res += cnt[arr[i]] * cnt[arr[j]] * (cnt[arr[j]] - 1) / 2
                else
                    res += cnt[arr[i]] * (cnt[arr[i]] - 1) * (cnt[arr[i]] - 2) / 6
                end
                j += cnt[arr[j]]
                k -= cnt[arr[k]]
            end
        end
        
        i += cnt[arr[i]]
    end
    
    res % (10**9 + 7)
end
