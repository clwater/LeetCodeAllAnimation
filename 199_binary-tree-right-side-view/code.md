# Binary Tree Right Side View
# 二叉树的右视图

## Description
Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

## Description
给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

## Example
### Example:
    Input: [1,2,3,null,5,null,4]
    Output: [1, 3, 4]
    Explanation:
    
       1            <---
     /   \
    2     3         <---
     \     \
      5     4       <---

## 示例
### 示例:
    输入: [1,2,3,null,5,null,4]
    输出: [1, 3, 4]
    解释:
    
       1            <---
     /   \
    2     3         <---
     \     \
      5     4       <---


## Solution
### DFS
我们对树进行深度优先搜索,在搜索过程中,我们总是先访问右子树。那么对于每一层来说,我们在这层见到的第一个结点一定是最右边的结点.


## Code 

```java
private List<Integer> result = new ArrayList<>();

    //T O(n)
    //S O(n)
    public List<Integer> rightSideView(TreeNode root) {
        //递归深度遍历
        dfs(root, 0);
        return result;
    }

    private void dfs(TreeNode root, int depth) {
        if (root == null) {
            return;
        }
        // 判断当前节点是否所在的深度是否存在
        if (depth == result.size()) {
            result.add(root.val);
        }

        //先递归右节点
        dfs(root.right, depth + 1);
        dfs(root.left, depth + 1);
    }
```