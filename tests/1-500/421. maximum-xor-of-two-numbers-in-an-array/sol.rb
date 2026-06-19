# @param {Integer[]} nums
# @return {Integer}
def find_maximum_xor(nums)
    mx_bit = nums.max.bit_length
    trie = [[-1, -1]]
    
    insert = lambda do |num|
        node = 0
        (mx_bit - 1).downto(0) do |i|
            bit = (num >> i) & 1
            if trie[node][bit] == -1
                trie[node][bit] = trie.length
                trie << [-1, -1]
            end
            node = trie[node][bit]
        end
    end
    
    get_max = lambda do |num|
        node = 0
        ans = 0
        (mx_bit - 1).downto(0) do |i|
            bit = (num >> i) & 1
            opp = 1 - bit
            if trie[node][opp] != -1
                ans |= (1 << i)
                node = trie[node][opp]
            else
                node = trie[node][bit]
            end
        end
        ans
    end
    
    nums.each { |num| insert.call(num) }
    
    res = 0
    nums.each { |num| res = [res, get_max.call(num)].max }
    
    res
end
