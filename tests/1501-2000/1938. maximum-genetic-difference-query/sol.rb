class BitTrieNode1938
        attr_accessor :count, :child
        def initialize
            @count = 0
            @child = {}
        end
end

class BitTrie1938
        def initialize
            @root = BitTrieNode1938.new
        end

        def increase(number, d)
            cur = @root
            17.downto(0) do |i|
                bit = (number >> i) & 1
                cur.child[bit] ||= BitTrieNode1938.new
                cur = cur.child[bit]
                cur.count += d
            end
        end

        def find_max(number)
            cur, ans = @root, 0
            17.downto(0) do |i|
                bit = (number >> i) & 1
                desired = 1 - bit
                if cur.child.key?(desired) && cur.child[desired].count > 0
                    cur = cur.child[desired]
                    ans |= (1 << i)
                else
                    cur = cur.child[bit]
                end
            end
            ans
        end
end

def max_genetic_difference(parents, queries)

    n = parents.length
    adj = Array.new(n) { [] }
    root = 0
    parents.each_with_index do |p, i|
        if p == -1
            root = i
        else
            adj[p] << i
        end
    end

    trie = BitTrie1938.new
    qmap = Hash.new { |h, k| h[k] = [] }
    queries.each_with_index do |(node, val), idx|
        qmap[node] << [idx, val]
    end

    ans = Array.new(queries.length, 0)

    dfs = lambda do |u|
        trie.increase(u, 1)
        qmap[u].each do |idx, val|
            ans[idx] = trie.find_max(val)
        end if qmap.key?(u)
        adj[u].each { |v| dfs.call(v) }
        trie.increase(u, -1)
    end

    dfs.call(root)
    ans
end
