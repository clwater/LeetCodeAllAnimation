# Convert Sorted List to Binary Search Tree
# 有序链表转换二叉搜索树

## Description
Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.


## Description
给出一个所有元素以升序排序的单链表，将它转换成一棵高度平衡的二叉搜索树


## Example
### Example 1:
	Input: array = 1->2->3
	Output:
		 2  
		/ \
		1  3
		
### Example 2:
	Input: 2->3->6->7
	Output:
		 3
		/ \
	       2   6
		     \
		      7

	Explanation:
	There may be multi answers, and you could return any of them.

## 示例
### 样例 1:
	输入: array = 1->2->3
	输出:
		 2  
		/ \
		1  3
		
### 样例 2:
	输入: 2->3->6->7
	输出:
		 3
		/ \
	       2   6
		     \
		      7

	解释:
	可能会有多个符合要求的结果，返回任意一个即可。

## Solution
### 递归+LDR
这里的话我们实现的是对树的中序遍历, 我们可以通过将数组获取中心位置来分组.不过这里我们提供的是链表, 我们采用快慢指针的方法来寻找其中心的位置.

### Code

```java
      //T O(n*n)
    //S O(log(n))
    public TreeNode sortedListToBST(ListNode head) {
        if (head == null) {
            return null;
        }
        return findMiddle(head, null);

    }

    private TreeNode findMiddle(ListNode head, ListNode tail) {
        //判断当前是否为空
        if (head == tail) {
            return null;
        }

        //通过快慢的双指针找到中当前链表中心的位置
        ListNode slow = head;
        ListNode fast = head;
        while (fast != tail && fast.next != tail) {
            slow = slow.next;
            fast = fast.next.next;
        }

        TreeNode root = new TreeNode(slow.val);

        //插入左右节点的信息
        root.left = findMiddle(head, slow);
        root.right = findMiddle(slow.next, tail);
        return root;
    }


```