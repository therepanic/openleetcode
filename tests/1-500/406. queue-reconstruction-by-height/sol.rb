# @param {Integer[][]} people
# @return {Integer[][]}
def reconstruct_queue(people)
  people.sort_by { |h, k| [-h, k] }.reduce([]) do |q, p|
    q.insert(p[1], p)
  end
end
