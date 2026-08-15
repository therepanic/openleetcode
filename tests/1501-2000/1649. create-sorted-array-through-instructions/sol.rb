# @param {Integer[]} instructions
# @return {Integer}
def create_sorted_array(instructions)
    n = instructions.length
    ans = {}
    (0...n).each { |i| ans[i] = [0, 0] }
    
    merge = ->(left, right) {
        l = left.length - 1
        r = right.length - 1
        while l > -1 && r > -1
            if instructions[left[l]] <= instructions[right[r]]
                ans[right[r]][1] += (left.length - 1) - l
                r -= 1
            else
                l -= 1
            end
        end
        while r > -1
            ans[right[r]][1] += left.length
            r -= 1
        end
        
        l = 0
        r = 0
        res = []
        while l < left.length && r < right.length
            if instructions[left[l]] < instructions[right[r]]
                res << left[l]
                l += 1
            else
                ans[right[r]][0] += l
                res << right[r]
                r += 1
            end
        end
        while r < right.length
            ans[right[r]][0] += l
            res << right[r]
            r += 1
        end
        res.concat(left[l..-1] || [])
        res
    }
    
    split = nil
    split = ->(l, r, arr) {
        if l == r
            return [arr[r]]
        end
        mid = (l + r) / 2
        left = split.call(l, mid, arr)
        right = split.call(mid + 1, r, arr)
        merge.call(left, right)
    }
    
    split.call(0, n - 1, (0...n).to_a)
    
    real_ans = 0
    ans.each_value { |v| real_ans += v.min }
    real_ans % (10**9 + 7)
end
