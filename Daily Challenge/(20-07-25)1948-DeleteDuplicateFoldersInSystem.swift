class Solution {
    class TrieNode {
        var children = [String: TrieNode]()
        var isDeleted = false
    }

    func deleteDuplicateFolder(_ paths: [[String]]) -> [[String]] {
        let root = TrieNode()
        
        for path in paths {
            var node = root
            for folder in path {
                if node.children[folder] == nil {
                    node.children[folder] = TrieNode()
                }
                node = node.children[folder]!
            }
        }

        var count = [String: Int]()
        
        @discardableResult
        func serialize(_ node: TrieNode) -> String {
            if node.children.isEmpty { return "" }
            var serials = [String]()
            for (name, child) in node.children {
                let subSerial = serialize(child)
                serials.append("(\(name)\(subSerial))")
            }
            serials.sort()
            let serial = serials.joined()
            count[serial, default: 0] += 1
            return serial
        }

        _ = serialize(root)
        func mark(_ node: TrieNode) -> String {
            if node.children.isEmpty { return "" }
            var serials = [String]()
            for (name, child) in node.children {
                let subSerial = mark(child)
                serials.append("(\(name)\(subSerial))")
            }
            serials.sort()
            let serial = serials.joined()
            if count[serial]! > 1 {
                node.isDeleted = true
            }
            return serial
        }

        _ = mark(root)

        var result = [[String]]()
        func dfs(_ node: TrieNode, _ path: [String]) {
            if node.isDeleted { return }
            if !path.isEmpty {
                result.append(path)
            }
            for (name, child) in node.children {
                dfs(child, path + [name])
            }
        }

        dfs(root, [])
        return result
    }
}
