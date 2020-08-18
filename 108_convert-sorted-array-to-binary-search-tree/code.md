# Convert Sorted Array to Binary Search Tree
# 

## Description
Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.


## Description
将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。

本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。


## Example
### Example 1:
    Given the sorted array: [-10,-3,0,5,9],

    One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

        0
        / \
      -3   9
      /   /
    -10  5


## 示例
### 示例1:
    给定有序数组: [-10,-3,0,5,9],

    一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：

        0
        / \
      -3   9
      /   /
    -10  5


## Solution
### 递归+LDR
这里的话我们实现的是对树的中序遍历, 我们可以通过将数组获取中心位置来分组.

### Code

```java
     //T O(n)
    //S O(lng(n))
    public TreeNode sortedArrayToBST(int[] nums) {
        //判断当前是否为空
        if (nums == null || nums.length == 0) {
            return null;
        }

        //获取中间的位置
        int middle = nums.length / 2;
        //将中间位置的信息放入节点中
        TreeNode node = new TreeNode(nums[middle]);

        //插入左节点的信息
        //判断左侧区间是否合法,
        //如果区间不合法则插入空节点
        node.left = sortedArrayToBST(
                middle - 1 >= 0 ?
                        Arrays.copyOfRange(nums, 0, middle)
                        :
                        null
        );

        //插入右节点的信息
        //判断右侧区间是否合法,
        //如果区间不合法则插入空节点
        node.right = sortedArrayToBST(
                nums.length - 1 >= middle + 1 ?
                        Arrays.copyOfRange(nums, middle + 1, nums.length)
                        :
                        null
        );

        return node;
    }

```