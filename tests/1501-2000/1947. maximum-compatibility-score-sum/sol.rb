# @param {Integer[][]} students
# @param {Integer[][]} mentors
# @return {Integer}
def max_compatibility_sum(students, mentors)
    m = students.length
    max_score = 0
    (0...m).to_a.permutation.each do |perm|
        total = 0
        m.times do |i|
            total += (0...students[i].length).count { |j| students[i][j] == mentors[perm[i]][j] }
        end
        max_score = [max_score, total].max
    end
    max_score
end
