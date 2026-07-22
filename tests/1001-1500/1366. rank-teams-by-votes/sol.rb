# @param {String[]} votes
# @return {String}
def rank_teams(votes)
    teams = votes[0]
    positions = {}
    teams.each_char { |team| positions[team] = Array.new(teams.length, 0) }
    votes.each do |vote|
        vote.each_char.with_index do |team, index|
            positions[team][index] += 1
        end
    end
    teams.chars.sort_by { |team| positions[team].map { |count| -count } + [team.ord] }.join
end
