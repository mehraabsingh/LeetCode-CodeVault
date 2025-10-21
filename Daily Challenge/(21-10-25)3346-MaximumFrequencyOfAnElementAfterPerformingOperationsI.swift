class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int, _ numOperations: Int) -> Int {
        var ans = 1
        var adjustable = 0
        
        // Dictionaries for counting and line sweep events
        var count: [Int: Int] = [:]
        var line: [Int: Int] = [:]
        var candidates = Set<Int>()
        
        for num in nums {
            count[num, default: 0] += 1
            line[num - k, default: 0] += 1
            line[num + k + 1, default: 0] -= 1
            candidates.insert(num)
            candidates.insert(num - k)
            candidates.insert(num + k + 1)
        }
        
        // Iterate in sorted order
        for num in candidates.sorted() {
            adjustable += line[num] ?? 0
            let countNum = count[num] ?? 0
            let adjusted = adjustable - countNum
            ans = max(ans, countNum + min(numOperations, adjusted))
        }
        
        return ans
    }
}
