# House Robber III
# 打家劫舍 III

## Description
The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.
Determine the maximum amount of money the thief can rob tonight without alerting the police.

## Description
在上次打劫完一条街道之后和一圈房屋后，小偷又发现了一个新的可行窃的地区。这个地区只有一个入口，我们称之为“根”。 除了“根”之外，每栋房子有且只有一个“父“房子与之相连。一番侦察之后，聪明的小偷意识到“这个地方的所有房屋的排列类似于一棵二叉树”。 如果两个直接相连的房子在同一天晚上被打劫，房屋将自动报警。
计算在不触动警报的情况下，小偷一晚能够盗取的最高金额。

## Example
### Example 1:
    Input: [3,2,3,null,3,null,1]
    
         3
        / \
       2   3
        \   \ 
         3   1
    
    Output: 7 
    Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.

### Example 2:
    Input: [3,4,5,1,3,null,1]
    
         3
        / \
       4   5
      / \   \ 
     1   3   1
    
    Output: 9
    Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.

## 示例
### 示例 1:
    输入: [3,2,3,null,3,null,1]
    
         3
        / \
       2   3
        \   \ 
         3   1
    
    输出: 7 
    解释: 小偷一晚能够盗取的最高金额 = 3 + 3 + 1 = 7.

### 示例 2:
    输入: [3,4,5,1,3,null,1]
    
         3
        / \
       4   5
      / \   \ 
     1   3   1
    
    输出: 9
    解释: 小偷一晚能够盗取的最高金额 = 4 + 5 = 9.


## Solution
### dfs
这里我们采用之前的动态规划的思路, 这里我们可以看到每个节点的状态都是只和其左右两个子节点有关.


## Code 

```java
    //T O(n)
    //S O(n)
    public int rob(TreeNode root) {
        int[] rootStatus = dfs(root);
        return Math.max(rootStatus[0], rootStatus[1]);
    }

    //递归dfs遍历树
    public int[] dfs(TreeNode node) {
        //递归结束的情况
        if (node == null) {
            return new int[]{0, 0};
        }
        //获取左右子节点的情况
        int[] l = dfs(node.left);
        int[] r = dfs(node.right);
        //一次查看当前屋子是否被选择时的情况
        int selected = node.val + l[1] + r[1];
        int notSelected = Math.max(l[0], l[1]) + Math.max(r[0], r[1]);
        return new int[]{selected, notSelected};
    }
```