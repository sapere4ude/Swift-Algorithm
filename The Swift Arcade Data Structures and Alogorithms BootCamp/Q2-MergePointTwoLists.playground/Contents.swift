import UIKit

/*
 Find Merge Point of Two Lists

 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.

 Note: After the merge point, both lists will share the same node pointers.
 
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }
    var len = 0
    var current = head
    while current != nil {
        len += 1
        current = current?.next
    }
    return len
}

func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}

// solution 1
func findMergeBrute(headA: Node?, headB: Node?) -> Int? {   // O(m*n) > O(n^2)
    let m = length(headA)   // O(m)
    let n = length(headB)   // O(n)
    
    var currentA = headA
    
    for _ in 0 ... m-1 {        // O(m)
        var currentB = headB
        for _ in 0 ... n-1 {    // O(n)
            let A = currentA?.data
            let B = currentB?.data
            //print("A: \(A ?? 0) B: \(B ?? 0)")
            if A == B {
                return A
            }
            currentB = currentB?.next   // B 노드의 다음값으로 넘어가기 위한 작업
        }
        currentA = currentA?.next       // A 노드의 다음값으로 넘어가기 위한 작업
    }
    return nil
}

// soulution 2
func findMergeSpaceTime(headA: Node?, headB: Node?) -> Int? {   // O(2m + 2n) > O(m + n)
    let m = length(headA)   // O(m)
    let n = length(headB)   // O(n)
    
    var dict = [Int?: Bool]()
    
    var currentB = headB
    for _ in 0 ... n-1 {    // O(n)
        let B = currentB?.data
        dict[B] = true
        currentB = currentB?.next
    }
    
    var currentA = headA
    for _ in 0 ... m-1 {    // O(m)
        let A = currentA?.data
        if dict[A] == true {
            return A
        }
        currentA = currentA?.next
    }
    return nil
}

// soulution 3
func findMergeInsight(headA: Node?, headB: Node?) -> Int? {  // O(m + n)
    // Figure out which is longer
    // Swap if necessary
    
    // Calculate d
    // Walk d for longer
    // Walk remainder for both
    let m = length(headA)   // O(m)
    let n = length(headB)   // O(n)

    var currentA = headA
    var currentB = headB
    
    if n > m {
        let temp = currentA
        currentA = currentB
        currentB = temp
    }
    
    let d = abs(m - n)

    for _ in 1...d {    // O(n)
        currentA = currentA?.next
    }

    for _ in 1...n-1 {  // O(n)
        let A = currentA?.data
        let B = currentB?.data
        if A == B {
            return A
        }
        currentA = currentA?.next
        currentB = currentB?.next
    }
    return nil
}

// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// 10 11 12 13 4 5 6
let node11 = Node(11, node4)
let node10 = Node(10, node11)

printLinkedList(node1)
printLinkedList(node10)

findMergeBrute(headA: node1, headB: node10)
findMergeSpaceTime(headA: node1, headB: node10)
findMergeInsight(headA: node1, headB: node10)
