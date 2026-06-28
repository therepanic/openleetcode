# @param {String[]} paths
# @return {String[][]}
def find_duplicate(paths)
    d = {}
    paths.each do |path|
        parts = path.split(" ")
        directory = parts[0]
        parts[1..].each do |file|
            name, content = file.split("(")
            content = content[0...-1]
            full_path = directory + "/" + name
            d[content] ||= []
            d[content] << full_path
        end
    end
    d.values.select { |group| group.length > 1 }
end
