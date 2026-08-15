# @param {String[][]} paths
# @return {String[][]}
Node1948 = Struct.new(:name, :children, :signature)
def delete_duplicate_folder(paths)
    root = Node1948.new("", {}, "")
    
    paths.each do |path|
        node = root
        path.each do |folder|
            if !node.children.key?(folder)
                node.children[folder] = Node1948.new(folder, {}, "")
            end
            node = node.children[folder]
        end
    end
    
    signature_count = Hash.new(0)
    
    dfs = lambda do |node|
        if node.children.empty?
            node.signature = ""
            return ""
        end
        child_signatures = []
        node.children.keys.sort.each do |name|
            child = node.children[name]
            child_signature = dfs.call(child)
            child_signatures << "#{name}(#{child_signature})"
        end
        node.signature = child_signatures.join
        signature_count[node.signature] += 1
        node.signature
    end
    
    dfs.call(root)
    
    result = []
    current_path = []
    
    dfs2 = lambda do |node|
        if !node.children.empty? && signature_count[node.signature] >= 2
            return
        end
        current_path << node.name
        result << current_path.dup
        node.children.keys.sort.each do |name|
            dfs2.call(node.children[name])
        end
        current_path.pop
    end
    
    root.children.keys.sort.each do |name|
        dfs2.call(root.children[name])
    end
    
    result
end
