# @param {String} bottom
# @param {String[]} allowed
# @return {Boolean}
def pyramid_transition(bottom, allowed)
    tab = Hash.new { |h, k| h[k] = Set.new }
    allowed.each do |a|
        tab[[a[0], a[1]]].add(a[2])
    end
    
    visited = Set.new
    
    dfs = lambda do |node|
        return true if node.length == 1
        return false if visited.include?(node)
        
        res = ['']
        (1...node.length).each do |i|
            key = [node[i-1], node[i]]
            if tab.key?(key)
                chars = tab[key].to_a
                res = chars.flat_map { |c| res.map { |r| r + c } }
            else
                visited.add(node)
                return false
            end
        end
        
        res.each do |nxt|
            return true if dfs.call(nxt)
        end
        
        visited.add(node)
        false
    end
    
    dfs.call(bottom)
end
