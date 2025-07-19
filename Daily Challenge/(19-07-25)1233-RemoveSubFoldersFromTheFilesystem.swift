class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        let sortedFolders = folder.sorted()
        var result = [String]()
        
        for path in sortedFolders {
            if result.isEmpty || !path.hasPrefix(result.last! + "/") {
                result.append(path)
            }
        }
        
        return result
    }
}
