# @param {Integer[]} answers
# @return {Integer}
def num_rabbits(answers)
    mpp = Hash.new(0)
    answers.each { |a| mpp[a] += 1 }
    total = 0
    mpp.each do |x, count|
        total += (count.to_f / (x + 1)).ceil * (x + 1)
    end
    total
end
