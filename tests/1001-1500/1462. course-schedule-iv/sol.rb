# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @param {Integer[][]} queries
# @return {Boolean[]}
def check_if_prerequisite(num_courses, prerequisites, queries)
    adj = Array.new(num_courses) { [] }
    prereq = Array.new(num_courses, 0)
    in_degree = Array.new(num_courses, 0)
    
    prerequisites.each do |a, b|
        adj[a] << b
        prereq[b] |= (1 << a)
        in_degree[b] += 1
    end
    
    q = []
    (0...num_courses).each do |i|
        q.push(i) if in_degree[i] == 0
    end
    
    while !q.empty?
        u = q.shift
        adj[u].each do |v|
            prereq[v] |= prereq[u]
            in_degree[v] -= 1
            if in_degree[v] == 0
                q.push(v)
            end
        end
    end
    
    queries.map { |u, v| (prereq[v] & (1 << u)) != 0 }
end
