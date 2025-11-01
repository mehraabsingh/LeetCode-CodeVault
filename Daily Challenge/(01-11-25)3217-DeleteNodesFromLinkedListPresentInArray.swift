class Solution {
    func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        var remove = Set(nums) // fast O(1) lookup

        let dummy = ListNode(0)
        dummy.next = head
        
        var prev: ListNode? = dummy
        var curr = head
        
        while curr != nil {
            if remove.contains(curr!.val) {
                // skip this node
                prev?.next = curr?.next
            } else {
                prev = curr
            }
            curr = curr?.next
        }
        
        return dummy.next
    }
}
