# Minimum Depth of Binary Tree
# 二叉树的最小深度



## Description
Given a binary tree, find its minimum depth.

The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.



## Description
给定一个二叉树，找出其最小深度。

最小深度是从根节点到最近叶子节点的最短路径上的节点数量。


## Example
### Example1:
	Given binary tree [3,9,20,null,null,15,7],

		3
	   / \
	  9  20
		/  \
	   15   7
	return its minimum depth = 2.

## 示例
### 示例:
	给定二叉树 [3,9,20,null,null,15,7],

		3
	   / \
	  9  20
		/  \
	   15   7
	返回它的最小深度  2.


## Note
A leaf is a node with no children.

## 说明
叶子节点是指没有子节点的节点。

## Solution
### 树+DFS+递归
这里考察的是对树的遍历, 这里我们使用的是通过递归实现的DFS(前序)遍历

### Code

```java
    //T O(n)
    //S O(n)
    //DFS-前序(递归)
    public int minDepth(TreeNode root) {
        //特殊值处理
        if (root == null){
            return 0;
        }
        //如果当前节点没有子节点, 则认为其高度为1
        if ((root.left == null) && (root.right == null)) {
            return 1;
        }

        //尝试获取其子节点的高度
        int leftHeight = Integer.MAX_VALUE, rightHeight = Integer.MAX_VALUE;

        if (root.left != null) {
            leftHeight = minDepth(root.left);
        }
        if (root.right != null) {
            rightHeight = minDepth(root.right);
        }

        //获取子节点高度较低的一个
        return Math.min(leftHeight, rightHeight) + 1;
    }
```