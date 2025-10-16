class Solution {
    func findSmallestInteger(_ nums: [Int], _ value: Int) -> Int {
        var count = [Int: Int]()
        
        // Step 1: Count remainders
        for num in nums {
            let remainder = ((num % value) + value) % value
            count[remainder, default: 0] += 1
        }
        
        // Step 2: Find the MEX
        var mex = 0
        while true {
            let remainder = mex % value
            if let c = count[remainder], c > 0 {
                count[remainder]! -= 1
                mex += 1
            } else {
                break
            }
        }
        
        return mex
    }
}
