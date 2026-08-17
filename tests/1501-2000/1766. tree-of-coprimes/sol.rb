# @param {Integer[]} nums
# @param {Integer[][]} edges
# @return {Integer[]}
def get_coprimes(nums, edges)
    require 'set'
    n = nums.length
    adj = Array.new(n) { [] }
    edges.each do |u, v|
        adj[u] << v
        adj[v] << u
    end
    
    ans = Array.new(n, -1)
    depth = Array.new(n, 0)
    ancestor_by_value = Array.new(51, -1)
    
    gcd = ->(a, b) { b == 0 ? a : gcd.call(b, a % b) }
    
    dfs = ->(node, prev, dep) do
        depth[node] = dep
        best = Float::INFINITY
        best_anc = -1
        (1..50).each do |i|
            if gcd.call(i, nums[node]) == 1
                anc = ancestor_by_value[i]
                if anc != -1
                    diff = dep - depth[anc]
                    if diff < best
                        best = diff
                        best_anc = anc
                    end
                end
            end
        end
        ans[node] = best_anc
        
        prev_state = ancestor_by_value[nums[node]]
        ancestor_by_value[nums[node]] = node
        adj[node].each do |v|
            dfs.call(v, node, dep + 1) if v != prev
        end
        ancestor_by_value[nums[node]] = prev_state
    end
    
    dfs.call(0, 0, 0)
    ans
end
