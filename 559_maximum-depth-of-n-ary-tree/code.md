# Maximum Depth of N-ary Tree
# N叉树的最大深度


## Description
Given a n-ary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

## Description
给定一个 N 叉树，找到其最大深度。

最大深度是指从根节点到最远叶子节点的最长路径上的节点总数。



## Example
### Example 1:
    Input: root = [1,null,3,2,4,null,5,6]
    Output: 3

### Example 2:
    Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
    Output: 5


## 示例
### 示例 1:
    例如，给定一个 3叉树 :
         1
       / | \
      2  3  4
     / \
    5   6
    我们应返回其最大深度，3。


## Note
* The depth of the n-ary tree is less than or equal to 1000.
* The total number of nodes is between [0, 10^4].

## 说明
1. 树的深度不会超过 1000。
2. 树的节点总不会超过 5000。



## Solution
### 树+DFS+递归
这里考察的是对树的遍历, 这里我们使用的是通过迭代(栈)实现的DFS(后序)遍历

### Code

```java
    //T O(n)
    //S O(n)
    //DFS-后序(迭代)
    public int maxDepth(Node root) {
        //特殊值处理

        if (root == null){
            return 0;
        }

        //通过栈实现同的深度优先遍历(后序遍历)
        Stack<AbstractMap.SimpleEntry<Node, Integer>> stack = new Stack<>();

        //插入根节点
        stack.add(new AbstractMap.SimpleEntry(root, 1));

        //定义返回的结果(当前的最大层级)
        int result = 0;
        //遍历栈的信息
        while (!stack.isEmpty()) {
            //获取栈顶元素
            AbstractMap.SimpleEntry<Node, Integer> current = stack.pop();
            //当前或者元素非空
            if (current.getKey() != null) {
                //更新当前树最大高度
                result = Math.max(result, current.getValue());
                //将其节点信息插入栈中(高度+1)
                for (Node node : current.getKey().children) {
                    stack.add(new AbstractMap.SimpleEntry(node, current.getValue() + 1));
                }
            }
        }
        return result;
    }
```