class Solution:
    def simplifyPath(self, path):
        components = path.split("/")
        st = []

        for comp in components:
            if comp == "" or comp == ".":
                continue
            
            if comp == "..":
                if st:
                    st.pop()
            else:
                st.append(comp)
        
        return "/" + "/".join(st)