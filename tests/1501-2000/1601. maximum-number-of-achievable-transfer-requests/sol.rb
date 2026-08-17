# @param {Integer} n
# @param {Integer[][]} requests
# @return {Integer}
def maximum_requests(n, requests)
    @ans = 0
    indegree = Array.new(n, 0)
    helper(0, requests, indegree, n, 0)
    @ans
end

def helper(start, requests, indegree, n, count)
    if start == requests.length
        (0...n).each do |i|
            return if indegree[i] != 0
        end
        @ans = [@ans, count].max
        return
    end
    
    # Take
    indegree[requests[start][0]] -= 1
    indegree[requests[start][1]] += 1
    helper(start + 1, requests, indegree, n, count + 1)
    
    # Not-take
    indegree[requests[start][0]] += 1
    indegree[requests[start][1]] -= 1
    helper(start + 1, requests, indegree, n, count)
end
