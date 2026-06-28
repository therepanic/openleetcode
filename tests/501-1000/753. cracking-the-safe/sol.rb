# @param {Integer} n
# @param {Integer} k
# @return {String}
def crack_safe(n, k)
    if n == 1
        return (0...k).map(&:to_s).join
    end
    
    adj = Hash.new { |hash, key| hash[key] = (0...k).to_a.reverse }
    start_node = "0" * (n - 1)
    res = []
    
    visit = lambda do |node|
        while !adj[node].empty?
            digit = adj[node].pop
            next_node = (node + digit.to_s)[1..-1]
            visit.call(next_node)
            res << digit.to_s
        end
    end
    
    visit.call(start_node)
    res.join + start_node
end
