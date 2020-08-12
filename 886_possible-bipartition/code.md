# Possible Bipartition
# 可能的二分法

## Description
Given a set of N people (numbered 1, 2, ..., N), we would like to split everyone into two groups of any size.

Each person may dislike some other people, and they should not go into the same group. 

Formally, if dislikes[i] = [a, b], it means it is not allowed to put the people numbered a and b into the same group.

Return true if and only if it is possible to split everyone into two groups in this way.

## Description
给定一组 N 人（编号为 1, 2, ..., N）， 我们想把每个人分进任意大小的两组。

每个人都可能不喜欢其他人，那么他们不应该属于同一组。

形式上，如果 dislikes[i] = [a, b]，表示不允许将编号为 a 和 b 的人归入同一组。

当可以用这种方法将每个人分进两组时，返回 true；否则返回 false。


## Example
### Example 1:
    Input: N = 4, dislikes = [[1,2],[1,3],[2,4]]
    Output: true
    Explanation: group1 [1,4], group2 [2,3]

### Example 2:
    Input: N = 3, dislikes = [[1,2],[1,3],[2,3]]
    Output: false

### Example 3:
    Input: N = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
    Output: false

## 示例
### 示例 1：
    输入：N = 4, dislikes = [[1,2],[1,3],[2,4]]
    输出：true
    解释：group1 [1,4], group2 [2,3]
### 示例 2：
    输入：N = 3, dislikes = [[1,2],[1,3],[2,3]]
    输出：false

### 示例 3：
    输入：N = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
    输出：false

### Note:
* 1 <= N <= 2000
* 0 <= dislikes.length <= 10000
* dislikes[i].length == 2
* 1 <= dislikes[i][j] <= N
* dislikes[i][0] < dislikes[i][1]
* There does not exist i != j for which dislikes[i] == dislikes[j].

## 提示
* 1 <= N <= 2000
* 0 <= dislikes.length <= 10000
* dislikes[i].length == 2
* 1 <= dislikes[i][j] <= N
* dislikes[i][0] < dislikes[i][1]
* 对于dislikes[i] == dislikes[j] 不存在 i != j


## Solution
### 染色法+DFS
这个题目我们在解答的时候很容易的想要依次尝试将对应的人员放入某个分组中, 这里我们使用染色及DFS遍历的方法来解答

### Code

```java
       private int[][] graph;
    private HashMap<Integer, Integer> color;

    //T O(N + n)
    //S O(N + n)
    public boolean possibleBipartition(int N, int[][] dislikes) {
        //初始化数组和节点颜色信息
        graph = new int[N + 1][N + 1];
        color = new HashMap<>();


        //记录不能放在一组的人员信息
        for (int[] dislike : dislikes) {
            graph[dislike[0]][dislike[1]] = 1;
            graph[dislike[1]][dislike[0]] = 1;
        }

        //依次尝试将其中的某人加入到1组中
        for (int i = 1; i <= N; i++) {
            //如果当前人员以及加入到某组中则略过
            if (!color.containsKey(i) ) {
                //如果尝试加入失败则认为无可用分组
                if (!dfs(i, 1)) {
                    return false;
                }
            }
        }

        return true;
    }

    //深度优先尝试将某人加入到某组中
    public boolean dfs(int index, int c) {
        //判断当前尝试加入的分组和已分的组是否符合
        if (color.containsKey(index)) {
            return color.get(index) == c;
        }

        color.put(index, c);

        //尝试将其不能放在一组的其他人员放入-1组中
        for (int i = 1; i < graph[index].length; i++) {
            if (graph[index][i] == 1) {
                //这里通过1和-1将两人分组, 并能通过*-1的操作得到另一个的分组
                if (!dfs(i, c * -1)) {
                    return false;
                }
            }
        }

        return true;
    }
```