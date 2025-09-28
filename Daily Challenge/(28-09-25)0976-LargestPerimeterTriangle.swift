class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        // Step 1: Sort descending
        let sortedNums = nums.sorted(by: >)
        
        // Step 2: Check triplets
        for i in 0..<(sortedNums.count - 2) {
            let a = sortedNums[i]
            let b = sortedNums[i + 1]
            let c = sortedNums[i + 2]
            
            if b + c > a { // triangle inequality
                return a + b + c
            }
        }
        
        // Step 3: No valid triangle
        return 0
    }
}
