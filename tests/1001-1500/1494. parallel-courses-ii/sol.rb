# @param {Integer} n
# @param {Integer[][]} relations
# @param {Integer} k
# @return {Integer}
def min_number_of_semesters(n, relations, k)
    @n = n
    @k = k
    @graph = Hash.new { |h, key| h[key] = [] }
    in_degrees = Array.new(n, 0)
    relations.each do |prev_course, next_course|
        in_degrees[next_course - 1] += 1
        @graph[prev_course - 1] << next_course - 1
    end
    
    @memo = {}
    
    recurse = lambda do |mask, in_deg_tuple|
        return 0 if mask == 0
        key = [mask, in_deg_tuple]
        return @memo[key] if @memo.key?(key)
        
        in_deg_list = in_deg_tuple.dup
        nodes = (0...@n).select { |i| mask & (1 << i) != 0 && in_deg_list[i] == 0 }
        ans = Float::INFINITY
        
        nodes.combination([@k, nodes.length].min).each do |k_nodes|
            new_mask = mask
            new_in_deg = in_deg_list.dup
            k_nodes.each do |node|
                new_mask ^= (1 << node)
                @graph[node].each do |child|
                    new_in_deg[child] -= 1
                end
            end
            ans = [ans, 1 + recurse.call(new_mask, new_in_deg)].min
        end
        @memo[key] = ans
        ans
    end
    
    recurse.call((1 << n) - 1, in_degrees)
end
