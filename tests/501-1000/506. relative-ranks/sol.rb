# @param {Integer[]} score
# @return {String[]}
def find_relative_ranks(score)
    sorted_scores = score.sort.reverse
    ranks = {}
    sorted_scores.each_with_index do |s, i|
        ranks[s] = (i + 1).to_s
    end
    ranks[sorted_scores[0]] = "Gold Medal"
    if score.length > 1
        ranks[sorted_scores[1]] = "Silver Medal"
    end
    if score.length > 2
        ranks[sorted_scores[2]] = "Bronze Medal"
    end
    score.map { |s| ranks[s] }
end
