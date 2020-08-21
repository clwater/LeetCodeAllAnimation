# Balanced Binary Tree
# 平衡二叉树


## Description
Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as:

a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

 


## Description
给定一个二叉树，判断它是否是高度平衡的二叉树。

本题中，一棵高度平衡二叉树定义为：

一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。

## Example
### Example 1:
	Given the following tree [3,9,20,null,null,15,7]:

		3
	   / \
	   9  20
		/  \
	   15   7
	Return true.

### Example 2:
	Given the following tree [1,2,2,3,3,null,null,4,4]:

		1
	   / \
	  2   2
		 / \
	    3   3
	       / \
	      4   4
	Return false.

## 示例
### 示例 1:
	给定二叉树 [3,9,20,null,null,15,7]

		3
	   / \
	   9  20
		/  \
	   15   7
	返回 true 。

### 示例 2:
	给定二叉树 [1,2,2,3,3,null,null,4,4]

		1
	   / \
	  2   2
		 / \
	    3   3
	       / \
	      4   4
	返回 false 。


## Solution
### 递归+LDR
在这里, 我们依然考察的是平衡二叉树, 所以我们只要通过中序遍历来这棵树, 在遍历的过程的中需要校验两侧的树的高度

### Code

```java
    //T O(n)
    //S O(n)
    public boolean isBalanced(TreeNode root) {
        return getHeight(root) != -1;
    }

    private int getHeight(TreeNode root){
        //如果当前为空则此节点高度为1
        if (root == null){
            return 0;
        }

        //分别计算其左右节点的高度
        int leftHeight = getHeight(root.left);
        int rightHeight = getHeight(root.right);
        //如果左右节点为不平衡的或者其左右节点的高度差超过1则认为此节点为不平衡的
        if (leftHeight == -1 || rightHeight == -1 || Math.abs(leftHeight - rightHeight) > 1){
            return -1;
        }

        //返回左右节点中比较高的部分更新当前节点高度
        return Math.max(leftHeight, rightHeight) + 1;
    }
```