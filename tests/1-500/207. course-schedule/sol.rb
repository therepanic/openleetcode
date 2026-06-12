def can_finish(num_courses, prerequisites)
  graph = Array.new(num_courses) { [] }
  indegree = Array.new(num_courses, 0)
  prerequisites.each do |course, pre|
    graph[pre] << course
    indegree[course] += 1
  end
  queue = []
  num_courses.times { |i| queue << i if indegree[i] == 0 }
  head = 0
  seen = 0
  while head < queue.length
    node = queue[head]
    head += 1
    seen += 1
    graph[node].each do |nxt|
      indegree[nxt] -= 1
      queue << nxt if indegree[nxt] == 0
    end
  end
  seen == num_courses
end
