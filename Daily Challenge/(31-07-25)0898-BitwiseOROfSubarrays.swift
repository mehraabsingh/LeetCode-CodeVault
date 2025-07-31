class Solution {
    func subarrayBitwiseORs(_ arr: [Int]) -> Int {
        var result = Set<Int>()
        var prev = Set<Int>()
        
        for num in arr {
            var curr = Set<Int>()
            curr.insert(num)
            
            for val in prev {
                curr.insert(val | num)
            }
            
            for val in curr {
                result.insert(val)
            }
            
            prev = curr
        }
        
        return result.count
    }
}
