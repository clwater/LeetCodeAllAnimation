#  Maximum Depth of Binary Tree
# 二叉树的最大深度

## Description
Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.


## Description
给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。


## Example
### Example1:

    Given binary tree [3,9,20,null,null,15,7],
        3
       / \
      9  20
        /  \
       15   7
    return its depth = 3.

## 示例
### 示例1：
    给定二叉树 [3,9,20,null,null,15,7]，

         3
        / \
        9  20
          /  \
         15   7
    返回它的最大深度 3 。

## Note
A leaf is a node with no children.

## 说明
叶子节点是指没有子节点的节点。


## Solution
### 树+BFS+队列
这里考察的是对树的遍历, 这里我们使用的是通过队列实现的BFS遍历

### Code

```java
    //T O(n)
    //S O(n)
    //BFS
    public int maxDepth(TreeNode root) {
        //特殊值处理
        if (root == null) {
            return 0;
        }
        //通过队列实现同一级的广度优先遍历
        Queue<TreeNode> queue = new LinkedList<>();
        //插入根节点
        queue.add(root);

        //返回的结果
        int result = 0;
        //遍历队列信息
        while (!queue.isEmpty()) {
            //记录当前层级信息
            int size = queue.size();
            //遍历当前层级的内容
            while (size > 0) {
                //获取当前节点信息
                TreeNode node = queue.poll();
                //将该节点的子节点加入到队列中
                if (node.left != null) {
                    queue.add(node.left);
                }
                if (node.right != null) {
                    queue.add(node.right);
                }
                //更新处理数量
                size--;
            }
            //更新层级
            result++;
        }
        return result;

    }

```