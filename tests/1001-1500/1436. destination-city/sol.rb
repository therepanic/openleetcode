# @param {String[][]} paths
# @return {String}
def dest_city(paths)
    start_cities = Set.new
    
    paths.each do |path|
        start_cities.add(path[0])
    end
    
    paths.each do |path|
        return path[1] unless start_cities.include?(path[1])
    end
    
    ""
end
