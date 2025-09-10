class Solution {
    func minimumTeachings(_ n: Int, _ languages: [[Int]], _ friendships: [[Int]]) -> Int {
        let m = languages.count
        var langSets = [Set<Int>]()
        
        // Convert each user's known languages into a Set for faster lookup
        for l in languages {
            langSets.append(Set(l))
        }
        
        // Step 1: Find all problematic users
        var problematic = Set<Int>()
        
        for f in friendships {
            let u = f[0] - 1  // make 0-indexed
            let v = f[1] - 1
            if langSets[u].intersection(langSets[v]).isEmpty {
                problematic.insert(u)
                problematic.insert(v)
            }
        }
        
        // If no problematic friendships, no need to teach anyone
        if problematic.isEmpty { return 0 }
        
        var result = Int.max
        
        // Step 2: Try teaching each language
        for lang in 1...n {
            var count = 0
            for user in problematic {
                if !langSets[user].contains(lang) {
                    count += 1
                }
            }
            result = min(result, count)
        }
        
        return result
    }
}
