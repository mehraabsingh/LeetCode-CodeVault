class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int, _ numOperations: Int) -> Int {
        var ans = 1
        var adjustable = 0
        
        var count = [Int: Int]()   // like HashMap<Integer, Integer>
        var line = [Int: Int]()    // for sweep line +1/-1 markers
        var candidates = Set<Int>()  // like TreeSet<Integer>
        
        // Step 1: Build maps
        for num in nums {
            count[num, default: 0] += 1
            line[num - k, default: 0] += 1
            line[num + k + 1, default: 0] -= 1
            candidates.insert(num)
            candidates.insert(num - k)
            candidates.insert(num + k + 1)
        }
        
        // Step 2: Sort candidates (TreeSet iteration order)
        let sortedCandidates = candidates.sorted()
        
        // Step 3: Sweep line logic
        for num in sortedCandidates {
            adjustable += line[num, default: 0]
            let countNum = count[num, default: 0]
            let adjusted = adjustable - countNum
            ans = max(ans, countNum + min(numOperations, adjusted))
        }
        
        return ans
    }
}
