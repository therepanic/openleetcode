# @param {String[][]} watched_videos
# @param {Integer[][]} friends
# @param {Integer} id
# @param {Integer} level
# @return {String[]}
def watched_videos_by_friends(watched_videos, friends, id, level)
    n = friends.size
    visited = Array.new(n, false)
    q = [[id, 0]]
    visited[id] = true
    
    target_people = []
    
    until q.empty?
        person, dist = q.shift
        
        if dist == level
            target_people << person
            next
        end
        
        friends[person].each do |f|
            unless visited[f]
                visited[f] = true
                q << [f, dist + 1]
            end
        end
    end
    
    freq = Hash.new(0)
    target_people.each do |p|
        watched_videos[p].each do |vid|
            freq[vid] += 1
        end
    end
    
    freq.keys.sort_by { |x| [freq[x], x] }
end
