-- Built-in challenge templates
local M = {}

M.challenges = {
  {
    name = "LRU Cache",
    difficulty = "medium",
    stub = [==[
/**
 * LRU Cache
 *
 * Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.
 *
 * Implement the LRUCache class:
 * - LRUCache(capacity: number) — Initialize the cache with positive size capacity.
 * - get(key: number): number — Return the value of the key if it exists, otherwise return -1.
 * - put(key: number, value: number): void — Update or insert the value. When the cache reaches
 *   capacity, evict the least recently used key before inserting a new item.
 *
 * Both get and put must run in O(1) average time complexity.
 */

export class LRUCache {
  constructor(capacity: number) {
    // YOUR CODE HERE
  }

  get(key: number): number {
    // YOUR CODE HERE
    return -1;
  }

  put(key: number, value: number): void {
    // YOUR CODE HERE
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { LRUCache } from './challenge';

describe('LRU Cache', () => {
  it('basic get and put', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    expect(cache.get(1)).toBe(1);
  });

  it('evicts least recently used', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.put(3, 3);
    expect(cache.get(2)).toBe(-1);
  });

  it('get refreshes usage', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.get(1);
    cache.put(3, 3);
    expect(cache.get(1)).toBe(1);
    expect(cache.get(2)).toBe(-1);
  });

  it('updates existing key', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(1, 10);
    expect(cache.get(1)).toBe(10);
  });

  it('returns -1 for missing keys', () => {
    const cache = new LRUCache(1);
    expect(cache.get(99)).toBe(-1);
  });

  it('capacity of 1', () => {
    const cache = new LRUCache(1);
    cache.put(1, 1);
    cache.put(2, 2);
    expect(cache.get(1)).toBe(-1);
    expect(cache.get(2)).toBe(2);
  });

  it('many operations', () => {
    const cache = new LRUCache(3);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.put(3, 3);
    cache.put(4, 4);
    expect(cache.get(1)).toBe(-1);
    expect(cache.get(2)).toBe(2);
    expect(cache.get(3)).toBe(3);
    expect(cache.get(4)).toBe(4);
  });

  it('put refreshes usage', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.put(1, 10);
    cache.put(3, 3);
    expect(cache.get(1)).toBe(10);
    expect(cache.get(2)).toBe(-1);
  });

  it('stress test', () => {
    const cache = new LRUCache(10);
    for (let i = 0; i < 100; i++) {
      cache.put(i, i * 2);
    }
    for (let i = 0; i < 90; i++) {
      expect(cache.get(i)).toBe(-1);
    }
    for (let i = 90; i < 100; i++) {
      expect(cache.get(i)).toBe(i * 2);
    }
  });
});
]==],
  },
  {
    name = "N-Queens Solver",
    difficulty = "hard",
    stub = [==[
/**
 * N-Queens Solver
 *
 * Implement the classic N-Queens backtracking problem.
 *
 * The N-Queens puzzle asks: place N queens on an N×N chessboard
 * such that no two queens attack each other.
 *
 * Queens can attack horizontally, vertically, and diagonally.
 *
 * Implement:
 * - solveNQueens(n: number): string[][][]
 *   Return all distinct solutions. Each solution is a 2D board
 *   where 'Q' represents a queen and '.' is empty.
 *
 * - countNQueens(n: number): number
 *   Return just the count of distinct solutions (more efficient).
 *
 * - solveNQueensOptimized(n: number): number[][]
 *   Return solutions as arrays of column positions (more compact).
 *   Example: [1, 3, 0, 2] means queen in row 0 is at col 1,
 *   row 1 at col 3, row 2 at col 0, row 3 at col 2.
 *
 * Constraints: 1 <= n <= 15
 *
 * Bonus: Implement solveNQueensWithSymmetry that only finds unique
 * solutions up to rotation/reflection.
 */

export function solveNQueens(n: number): string[][][] {
  // YOUR CODE HERE
  return [];
}

export function countNQueens(n: number): number {
  // YOUR CODE HERE
  return 0;
}

export function solveNQueensOptimized(n: number): number[][] {
  // YOUR CODE HERE
  return [];
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { solveNQueens, countNQueens, solveNQueensOptimized } from './challenge';

function isValidBoard(board: string[][]): boolean {
  const n = board.length;
  const queens: [number, number][] = [];
  
  for (let r = 0; r < n; r++) {
    for (let c = 0; c < n; c++) {
      if (board[r][c] === 'Q') {
        queens.push([r, c]);
      }
    }
  }
  
  if (queens.length !== n) return false;
  
  for (let i = 0; i < queens.length; i++) {
    for (let j = i + 1; j < queens.length; j++) {
      const [r1, c1] = queens[i];
      const [r2, c2] = queens[j];
      
      // Same row or column
      if (r1 === r2 || c1 === c2) return false;
      
      // Same diagonal
      if (Math.abs(r1 - r2) === Math.abs(c1 - c2)) return false;
    }
  }
  
  return true;
}

describe('solveNQueens', () => {
  it('n=1 has one solution', () => {
    const solutions = solveNQueens(1);
    expect(solutions).toHaveLength(1);
    expect(solutions[0]).toEqual([['Q']]);
  });

  it('n=2 has no solutions', () => {
    expect(solveNQueens(2)).toEqual([]);
  });

  it('n=3 has no solutions', () => {
    expect(solveNQueens(3)).toEqual([]);
  });

  it('n=4 has 2 solutions', () => {
    const solutions = solveNQueens(4);
    expect(solutions).toHaveLength(2);
    solutions.forEach(sol => expect(isValidBoard(sol)).toBe(true));
  });

  it('n=4 solutions are valid', () => {
    const solutions = solveNQueens(4);
    solutions.forEach(sol => {
      expect(sol).toHaveLength(4);
      sol.forEach(row => expect(row).toHaveLength(4));
      const qCount = sol.flat().filter(c => c === 'Q').length;
      expect(qCount).toBe(4);
    });
  });

  it('n=5 has 10 solutions', () => {
    const solutions = solveNQueens(5);
    expect(solutions).toHaveLength(10);
    solutions.forEach(sol => expect(isValidBoard(sol)).toBe(true));
  });

  it('n=8 has 92 solutions', () => {
    const solutions = solveNQueens(8);
    expect(solutions).toHaveLength(92);
  });

  it('all solutions have correct format', () => {
    const solutions = solveNQueens(4);
    solutions.forEach(sol => {
      sol.forEach(row => {
        row.forEach(cell => {
          expect(cell).toMatch(/^[Q.]$/);
        });
      });
    });
  });
});

describe('countNQueens', () => {
  it('n=1 count is 1', () => {
    expect(countNQueens(1)).toBe(1);
  });

  it('n=2 count is 0', () => {
    expect(countNQueens(2)).toBe(0);
  });

  it('n=3 count is 0', () => {
    expect(countNQueens(3)).toBe(0);
  });

  it('n=4 count is 2', () => {
    expect(countNQueens(4)).toBe(2);
  });

  it('n=5 count is 10', () => {
    expect(countNQueens(5)).toBe(10);
  });

  it('n=6 count is 4', () => {
    expect(countNQueens(6)).toBe(4);
  });

  it('n=7 count is 40', () => {
    expect(countNQueens(7)).toBe(40);
  });

  it('n=8 count is 92', () => {
    expect(countNQueens(8)).toBe(92);
  });

  it('n=9 count is 352', () => {
    expect(countNQueens(9)).toBe(352);
  });

  it('n=10 count is 724', () => {
    expect(countNQueens(10)).toBe(724);
  });

  it('count matches solveNQueens length', () => {
    for (let n = 1; n <= 8; n++) {
      expect(countNQueens(n)).toBe(solveNQueens(n).length);
    }
  });
});

describe('solveNQueensOptimized', () => {
  it('n=1 returns [[0]]', () => {
    expect(solveNQueensOptimized(1)).toEqual([[0]]);
  });

  it('n=4 returns 2 solutions', () => {
    const solutions = solveNQueensOptimized(4);
    expect(solutions).toHaveLength(2);
    // Solutions should be column positions
    expect(solutions[0]).toHaveLength(4);
    expect(solutions[1]).toHaveLength(4);
  });

  it('n=4 solutions are valid', () => {
    const solutions = solveNQueensOptimized(4);
    solutions.forEach(sol => {
      // Check each row has exactly one queen
      expect(sol).toHaveLength(4);
      // Check all columns are unique
      const uniqueCols = new Set(sol);
      expect(uniqueCols.size).toBe(4);
      // Check no diagonal attacks
      for (let i = 0; i < sol.length; i++) {
        for (let j = i + 1; j < sol.length; j++) {
          expect(Math.abs(sol[i] - sol[j])).not.toBe(j - i);
        }
      }
    });
  });

  it('n=8 returns 92 solutions', () => {
    expect(solveNQueensOptimized(8)).toHaveLength(92);
  });

  it('optimized matches regular solutions count', () => {
    for (let n = 1; n <= 8; n++) {
      expect(solveNQueensOptimized(n).length).toBe(countNQueens(n));
    }
  });
});

describe('edge cases', () => {
  it('n=0 returns empty', () => {
    expect(solveNQueens(0)).toEqual([]);
    expect(countNQueens(0)).toBe(0);
  });

  it('negative n returns empty', () => {
    expect(solveNQueens(-1)).toEqual([]);
  });
});

describe('performance', () => {
  it('n=12 completes in reasonable time', () => {
    const start = Date.now();
    const count = countNQueens(12);
    const elapsed = Date.now() - start;
    expect(count).toBe(14200);
    expect(elapsed).toBeLessThan(10000);
  });

  it('n=13 completes', () => {
    const count = countNQueens(13);
    expect(count).toBe(73712);
  });

  it('n=14 completes', () => {
    const count = countNQueens(14);
    expect(count).toBe(365596);
  });
});
]==],
  },
  {
    name = "Throttle and Debounce",
    difficulty = "medium",
    stub = [==[
/**
 * Throttle and Debounce
 *
 * Implement rate-limiting higher-order functions commonly used in event handling.
 *
 * Throttle: Ensure a function is called at most once every `wait` milliseconds.
 * - If called multiple times within the window, only the first invocation executes.
 * - Subsequent calls are ignored until the window passes.
 * - Use case: scroll handlers, resize events, API rate limiting.
 *
 * Debounce: Delay function execution until after `wait` milliseconds of inactivity.
 * - If called again before the timer expires, reset the timer.
 * - Only executes after the caller stops invoking it for the full duration.
 * - Use case: search input, form validation, window resize.
 *
 * Implement:
 * - throttle<T extends (...args: any[]) => any>(fn: T, wait: number): T
 * - debounce<T extends (...args: any[]) => any>(fn: T, wait: number): T
 * - debounceWithImmediate<T extends (...args: any[]) => any>(fn: T, wait: number): T
 *   (executes immediately on first call, then debounces subsequent calls)
 *
 * Bonus: Add options object support:
 * - throttle(fn, wait, { leading?: boolean, trailing?: boolean })
 * - debounce(fn, wait, { immediate?: boolean })
 */

export function throttle<T extends (...args: any[]) => any>(
  fn: T,
  wait: number
): T {
  // YOUR CODE HERE
  return (() => {}) as T;
}

export function debounce<T extends (...args: any[]) => any>(
  fn: T,
  wait: number
): T {
  // YOUR CODE HERE
  return (() => {}) as T;
}

export function debounceWithImmediate<T extends (...args: any[]) => any>(
  fn: T,
  wait: number
): T {
  // YOUR CODE HERE
  return (() => {}) as T;
}
]==],
    tests = [==[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { throttle, debounce, debounceWithImmediate } from './challenge';

describe('throttle', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('calls function immediately on first invocation', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('ignores calls within the wait window', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled();
    throttled();
    throttled();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('allows call after wait period', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled();
    vi.advanceTimersByTime(100);
    throttled();
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('passes arguments correctly', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled(1, 2, 3);
    expect(fn).toHaveBeenCalledWith(1, 2, 3);
  });

  it('preserves this context', () => {
    const obj = {
      value: 42,
      method: function() { return this.value; }
    };
    const throttled = throttle(obj.method, 100);
    expect(throttled.call(obj)).toBe(42);
  });

  it('returns value from function', () => {
    const fn = vi.fn(() => 'result');
    const throttled = throttle(fn, 100);
    expect(throttled()).toBe('result');
  });

  it('multiple throttled functions are independent', () => {
    const fn1 = vi.fn();
    const fn2 = vi.fn();
    const t1 = throttle(fn1, 100);
    const t2 = throttle(fn2, 100);
    t1();
    t2();
    t1();
    expect(fn1).toHaveBeenCalledTimes(1);
    expect(fn2).toHaveBeenCalledTimes(1);
  });

  it('works with different wait times', () => {
    const fn = vi.fn();
    const t50 = throttle(fn, 50);
    const t200 = throttle(fn, 200);
    t50();
    vi.advanceTimersByTime(50);
    t50();
    t200();
    vi.advanceTimersByTime(150);
    t200();
    expect(fn).toHaveBeenCalledTimes(3);
  });
});

describe('debounce', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('does not call function immediately', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    expect(fn).not.toHaveBeenCalled();
  });

  it('calls function after wait period of inactivity', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('resets timer on subsequent calls', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    vi.advanceTimersByTime(50);
    debounced();
    vi.advanceTimersByTime(50);
    debounced();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('passes arguments from last call', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced('first');
    debounced('second');
    debounced('third');
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledWith('third');
  });

  it('preserves this context', () => {
    const obj = {
      value: 42,
      method: function() { return this.value; }
    };
    const debounced = debounce(obj.method, 100);
    debounced.call(obj);
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('returns value from function', () => {
    const fn = vi.fn(() => 'result');
    const debounced = debounce(fn, 100);
    debounced();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveReturnedWith('result');
  });

  it('multiple debounced functions are independent', () => {
    const fn1 = vi.fn();
    const fn2 = vi.fn();
    const d1 = debounce(fn1, 100);
    const d2 = debounce(fn2, 100);
    d1();
    d2();
    vi.advanceTimersByTime(100);
    expect(fn1).toHaveBeenCalledTimes(1);
    expect(fn2).toHaveBeenCalledTimes(1);
  });

  it('can be called multiple times after execution', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    vi.advanceTimersByTime(100);
    debounced();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(2);
  });
});

describe('debounceWithImmediate', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('calls function immediately on first invocation', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('ignores calls within wait period', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced();
    debounced();
    debounced();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('allows call after wait period', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced();
    vi.advanceTimersByTime(100);
    debounced();
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('passes arguments correctly', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced(1, 2, 3);
    expect(fn).toHaveBeenCalledWith(1, 2, 3);
  });

  it('preserves this context', () => {
    const obj = {
      value: 42,
      method: function() { return this.value; }
    };
    const debounced = debounceWithImmediate(obj.method, 100);
    expect(debounced.call(obj)).toBe(42);
  });

  it('returns value from function', () => {
    const fn = vi.fn(() => 'result');
    const debounced = debounceWithImmediate(fn, 100);
    expect(debounced()).toBe('result');
  });

  it('works with rapid calls', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    for (let i = 0; i < 10; i++) {
      debounced(i);
    }
    expect(fn).toHaveBeenCalledTimes(1);
    expect(fn).toHaveBeenCalledWith(0);
  });

  it('resets after wait period', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced('first');
    vi.advanceTimersByTime(100);
    debounced('second');
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(2);
    expect(fn).toHaveBeenNthCalledWith(1, 'first');
    expect(fn).toHaveBeenNthCalledWith(2, 'second');
  });
});

describe('edge cases', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('wait of 0 still works', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 0);
    throttled();
    throttled();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('very large wait time', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 1000000);
    throttled();
    throttled();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('function that throws', () => {
    const fn = vi.fn(() => { throw new Error('test'); });
    const throttled = throttle(fn, 100);
    expect(() => throttled()).toThrow('test');
  });

  it('async function', async () => {
    const fn = vi.fn(async () => {
      await new Promise(resolve => setTimeout(resolve, 10));
      return 'async-result';
    });
    const throttled = throttle(fn, 100);
    const result = await throttled();
    expect(result).toBe('async-result');
  });
});
]==],
  },
  {
    name = "Binary Search Tree",
    difficulty = "medium",
    stub = [=[
/**
 * Binary Search Tree
 *
 * Implement a Binary Search Tree (BST) with insertion, search, and deletion.
 *
 * A BST is a binary tree where for each node:
 * - All values in the left subtree are less than the node's value
 * - All values in the right subtree are greater than the node's value
 * - No duplicate values are allowed
 *
 * Implement the BST class with:
 * - insert(value: number): void — Insert a value into the tree
 * - search(value: number): boolean — Return true if value exists
 * - delete(value: number): boolean — Remove a value, return true if found
 * - inOrder(): number[] — Return values in sorted order (in-order traversal)
 * - height(): number — Return the height of the tree (max depth)
 * - minValue(): number | null — Return the minimum value in the tree
 * - maxValue(): number | null — Return the maximum value in the tree
 *
 * For delete, handle all three cases:
 * 1. Node with no children (leaf)
 * 2. Node with one child
 * 3. Node with two children (use in-order successor)
 *
 * Bonus: Implement isBalanced(): boolean to check if the tree is height-balanced
 * (difference in height between left and right subtrees is at most 1 for all nodes)
 */

export class BST {
  constructor() {
    // YOUR CODE HERE
  }

  insert(value: number): void {
    // YOUR CODE HERE
  }

  search(value: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  delete(value: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  inOrder(): number[] {
    // YOUR CODE HERE
    return [];
  }

  height(): number {
    // YOUR CODE HERE
    return 0;
  }

  minValue(): number | null {
    // YOUR CODE HERE
    return null;
  }

  maxValue(): number | null {
    // YOUR CODE HERE
    return null;
  }

  isBalanced(): boolean {
    // YOUR CODE HERE
    return true;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { BST } from './challenge';

describe('BST', () => {
  it('creates empty tree', () => {
    const bst = new BST();
    expect(bst.inOrder()).toEqual([]);
    expect(bst.height()).toBe(0);
    expect(bst.minValue()).toBeNull();
    expect(bst.maxValue()).toBeNull();
  });

  it('inserts single value', () => {
    const bst = new BST();
    bst.insert(5);
    expect(bst.search(5)).toBe(true);
    expect(bst.inOrder()).toEqual([5]);
    expect(bst.height()).toBe(1);
  });

  it('inserts multiple values in order', () => {
    const bst = new BST();
    bst.insert(5);
    bst.insert(3);
    bst.insert(7);
    expect(bst.inOrder()).toEqual([3, 5, 7]);
    expect(bst.height()).toBe(2);
  });

  it('inserts multiple values randomly', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => bst.insert(v));
    expect(bst.inOrder()).toEqual([3, 5, 7, 10, 12, 15, 20]);
  });

  it('search finds existing values', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7].forEach(v => bst.insert(v));
    expect(bst.search(10)).toBe(true);
    expect(bst.search(5)).toBe(true);
    expect(bst.search(3)).toBe(true);
    expect(bst.search(7)).toBe(true);
    expect(bst.search(15)).toBe(true);
  });

  it('search returns false for missing values', () => {
    const bst = new BST();
    [10, 5, 15].forEach(v => bst.insert(v));
    expect(bst.search(1)).toBe(false);
    expect(bst.search(7)).toBe(false);
    expect(bst.search(12)).toBe(false);
    expect(bst.search(20)).toBe(false);
  });

  it('delete leaf node', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7].forEach(v => bst.insert(v));
    expect(bst.delete(3)).toBe(true);
    expect(bst.search(3)).toBe(false);
    expect(bst.inOrder()).toEqual([5, 7, 10, 15]);
  });

  it('delete node with one child', () => {
    const bst = new BST();
    [10, 5, 15, 3].forEach(v => bst.insert(v));
    expect(bst.delete(5)).toBe(true);
    expect(bst.search(5)).toBe(false);
    expect(bst.search(3)).toBe(true);
    expect(bst.inOrder()).toEqual([3, 10, 15]);
  });

  it('delete node with two children', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => bst.insert(v));
    expect(bst.delete(10)).toBe(true);
    expect(bst.search(10)).toBe(false);
    expect(bst.inOrder()).toEqual([3, 5, 7, 12, 15, 20]);
    // Tree should still be valid BST
    expect(bst.search(5)).toBe(true);
    expect(bst.search(15)).toBe(true);
  });

  it('delete root node', () => {
    const bst = new BST();
    bst.insert(10);
    bst.insert(5);
    bst.insert(15);
    expect(bst.delete(10)).toBe(true);
    expect(bst.search(10)).toBe(false);
    expect(bst.inOrder()).toEqual([5, 15]);
  });

  it('delete non-existent value', () => {
    const bst = new BST();
    [10, 5, 15].forEach(v => bst.insert(v));
    expect(bst.delete(99)).toBe(false);
  });

  it('minValue returns correct minimum', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 1, 20].forEach(v => bst.insert(v));
    expect(bst.minValue()).toBe(1);
  });

  it('maxValue returns correct maximum', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 1, 20].forEach(v => bst.insert(v));
    expect(bst.maxValue()).toBe(20);
  });

  it('height of balanced tree', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => bst.insert(v));
    expect(bst.height()).toBe(3);
  });

  it('height of skewed tree', () => {
    const bst = new BST();
    [1, 2, 3, 4, 5].forEach(v => bst.insert(v));
    expect(bst.height()).toBe(5);
  });

  it('isBalanced on balanced tree', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => bst.insert(v));
    expect(bst.isBalanced()).toBe(true);
  });

  it('isBalanced on skewed tree', () => {
    const bst = new BST();
    [1, 2, 3, 4, 5].forEach(v => bst.insert(v));
    expect(bst.isBalanced()).toBe(false);
  });

  it('inOrder on empty tree', () => {
    const bst = new BST();
    expect(bst.inOrder()).toEqual([]);
  });

  it('handles duplicate insertions', () => {
    const bst = new BST();
    bst.insert(5);
    bst.insert(5);
    bst.insert(5);
    expect(bst.inOrder()).toEqual([5]);
    expect(bst.search(5)).toBe(true);
  });

  it('stress test with many insertions', () => {
    const bst = new BST();
    const values = [50, 25, 75, 10, 30, 60, 90, 5, 15, 27, 35, 55, 65, 85, 95];
    values.forEach(v => bst.insert(v));
    expect(bst.inOrder()).toEqual(values.sort((a, b) => a - b));
    values.forEach(v => expect(bst.search(v)).toBe(true));
    expect(bst.height()).toBe(4);
  });

  it('delete all nodes', () => {
    const bst = new BST();
    [10, 5, 15].forEach(v => bst.insert(v));
    expect(bst.delete(10)).toBe(true);
    expect(bst.delete(5)).toBe(true);
    expect(bst.delete(15)).toBe(true);
    expect(bst.inOrder()).toEqual([]);
    expect(bst.height()).toBe(0);
  });
});

// Edge cases
describe('BST edge cases', () => {
  it('negative values', () => {
    const bst = new BST();
    [-5, -10, -3, 0, 5].forEach(v => bst.insert(v));
    expect(bst.inOrder()).toEqual([-10, -5, -3, 0, 5]);
    expect(bst.minValue()).toBe(-10);
    expect(bst.maxValue()).toBe(5);
  });

  it('large values', () => {
    const bst = new BST();
    [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 0].forEach(v => bst.insert(v));
    expect(bst.minValue()).toBe(Number.MIN_SAFE_INTEGER);
    expect(bst.maxValue()).toBe(Number.MAX_SAFE_INTEGER);
  });
});
]=],
  },
  {
    name = "Rate Limiter",
    difficulty = "medium",
    stub = [=[
/**
 * Rate Limiter
 *
 * Implement a rate limiter that restricts the number of requests
 * within a sliding time window.
 *
 * Rate limiting is commonly used to:
 * - Prevent API abuse
 * - Control resource consumption
 * - Enforce usage quotas
 *
 * Implement the RateLimiter class with:
 * - constructor(limit: number, windowMs: number) — Initialize with max requests
 *   allowed per time window (in milliseconds)
 * - allowRequest(clientId: string): boolean — Return true if request is allowed,
 *   false if rate limit exceeded. Does NOT record the request.
 * - recordRequest(clientId: string): void — Record a request for the client.
 * - checkAndRecord(clientId: string): boolean — Atomic check + record. Returns true
 *   if allowed and records it; returns false if limit exceeded.
 * - getRemainingRequests(clientId: string): number — Return how many requests
 *   the client can still make in the current window.
 * - reset(clientId: string): void — Reset the rate limit for a specific client.
 * - resetAll(): void — Reset rate limits for all clients.
 *
 * Use a sliding window algorithm: track timestamps of recent requests and
 * remove expired ones when checking.
 *
 * Bonus: Implement getTokenBucket(clientId: string, tokens: number): boolean
 * for a token bucket algorithm variant where requests can consume multiple tokens.
 */

export class RateLimiter {
  constructor(limit: number, windowMs: number) {
    // YOUR CODE HERE
  }

  allowRequest(clientId: string): boolean {
    // YOUR CODE HERE
    return true;
  }

  recordRequest(clientId: string): void {
    // YOUR CODE HERE
  }

  checkAndRecord(clientId: string): boolean {
    // YOUR CODE HERE
    return true;
  }

  getRemainingRequests(clientId: string): number {
    // YOUR CODE HERE
    return 0;
  }

  reset(clientId: string): void {
    // YOUR CODE HERE
  }

  resetAll(): void {
    // YOUR CODE HERE
  }

  getTokenBucket(clientId: string, tokens: number): boolean {
    // YOUR CODE HERE
    return true;
  }
}
]=],
    tests = [=[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { RateLimiter } from './challenge';

describe('RateLimiter', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('allows requests under limit', () => {
    const limiter = new RateLimiter(3, 1000);
    expect(limiter.checkAndRecord('client1')).toBe(true);
    expect(limiter.checkAndRecord('client1')).toBe(true);
    expect(limiter.checkAndRecord('client1')).toBe(true);
  });

  it('blocks requests over limit', () => {
    const limiter = new RateLimiter(3, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.checkAndRecord('client1')).toBe(false);
  });

  it('allows requests after window expires', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.checkAndRecord('client1')).toBe(false);
    vi.advanceTimersByTime(1000);
    expect(limiter.checkAndRecord('client1')).toBe(true);
  });

  it('tracks different clients independently', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.checkAndRecord('client1')).toBe(false);
    expect(limiter.checkAndRecord('client2')).toBe(true);
    expect(limiter.checkAndRecord('client2')).toBe(true);
    expect(limiter.checkAndRecord('client2')).toBe(false);
  });

  it('allowRequest does not record', () => {
    const limiter = new RateLimiter(2, 1000);
    expect(limiter.allowRequest('client1')).toBe(true);
    expect(limiter.allowRequest('client1')).toBe(true);
    expect(limiter.allowRequest('client1')).toBe(true);
    expect(limiter.getRemainingRequests('client1')).toBe(2);
  });

  it('recordRequest records without checking', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.recordRequest('client1');
    limiter.recordRequest('client1');
    expect(limiter.getRemainingRequests('client1')).toBe(0);
    expect(limiter.allowRequest('client1')).toBe(false);
  });

  it('getRemainingRequests returns correct count', () => {
    const limiter = new RateLimiter(5, 1000);
    expect(limiter.getRemainingRequests('client1')).toBe(5);
    limiter.checkAndRecord('client1');
    expect(limiter.getRemainingRequests('client1')).toBe(4);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.getRemainingRequests('client1')).toBe(2);
  });

  it('reset clears client history', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.checkAndRecord('client1')).toBe(false);
    limiter.reset('client1');
    expect(limiter.checkAndRecord('client1')).toBe(true);
    expect(limiter.getRemainingRequests('client1')).toBe(1);
  });

  it('resetAll clears all clients', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client2');
    limiter.resetAll();
    expect(limiter.getRemainingRequests('client1')).toBe(2);
    expect(limiter.getRemainingRequests('client2')).toBe(2);
  });

  it('sliding window removes old requests', () => {
    const limiter = new RateLimiter(3, 1000);
    limiter.checkAndRecord('client1');
    vi.advanceTimersByTime(500);
    limiter.checkAndRecord('client1');
    vi.advanceTimersByTime(600);
    // First request is now expired (1100ms old)
    expect(limiter.getRemainingRequests('client1')).toBe(2);
  });

  it('multiple requests at boundary', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    vi.advanceTimersByTime(999);
    limiter.checkAndRecord('client1');
    expect(limiter.getRemainingRequests('client1')).toBe(0);
    vi.advanceTimersByTime(1);
    // First request expires
    expect(limiter.getRemainingRequests('client1')).toBe(1);
  });

  it('getTokenBucket consumes tokens', () => {
    const limiter = new RateLimiter(10, 1000);
    expect(limiter.getTokenBucket('client1', 3)).toBe(true);
    expect(limiter.getRemainingRequests('client1')).toBe(7);
    expect(limiter.getTokenBucket('client1', 5)).toBe(true);
    expect(limiter.getRemainingRequests('client1')).toBe(2);
    expect(limiter.getTokenBucket('client1', 3)).toBe(false);
  });

  it('getTokenBucket respects limit', () => {
    const limiter = new RateLimiter(5, 1000);
    expect(limiter.getTokenBucket('client1', 10)).toBe(false);
    expect(limiter.getRemainingRequests('client1')).toBe(5);
  });

  it('getTokenBucket with window expiry', () => {
    const limiter = new RateLimiter(5, 1000);
    limiter.getTokenBucket('client1', 3);
    vi.advanceTimersByTime(1000);
    expect(limiter.getTokenBucket('client1', 4)).toBe(true);
  });

  it('zero limit blocks all', () => {
    const limiter = new RateLimiter(0, 1000);
    expect(limiter.checkAndRecord('client1')).toBe(false);
    expect(limiter.allowRequest('client1')).toBe(false);
  });

  it('large window works correctly', () => {
    const limiter = new RateLimiter(100, 60000);
    for (let i = 0; i < 100; i++) {
      expect(limiter.checkAndRecord('client1')).toBe(true);
    }
    expect(limiter.checkAndRecord('client1')).toBe(false);
  });

  it('stress test with many clients', () => {
    const limiter = new RateLimiter(10, 1000);
    for (let i = 0; i < 50; i++) {
      for (let j = 0; j < 10; j++) {
        expect(limiter.checkAndRecord(`client${i}`)).toBe(true);
      }
      expect(limiter.checkAndRecord(`client${i}`)).toBe(false);
    }
  });
});
]=],
  },
  {
    name = "Pub/Sub Event Bus",
    difficulty = "medium",
    stub = [=[
/**
 * Pub/Sub Event Bus
 *
 * Implement a publish-subscribe event bus for decoupled event handling.
 *
 * The Pub/Sub pattern allows objects (publishers) to emit events without
 * knowing which objects (subscribers) will receive them. This enables
 * loose coupling and is widely used in:
 * - Event-driven architectures
 * - Message queues
 * - Reactive programming
 * - Plugin systems
 *
 * Implement the EventBus class with:
 * - subscribe(event: string, callback: (...args: any[]) => void): Subscription
 *   Register a callback for an event. Return a Subscription object with
 *   an unsubscribe() method to remove the listener.
 * - unsubscribe(event: string, callback: (...args: any[]) => void): boolean
 *   Remove a specific callback from an event. Return true if found and removed.
 * - publish(event: string, ...args: any[]): void
 *   Emit an event with optional arguments. All subscribers receive the args.
 * - publishAsync(event: string, ...args: any[]): Promise<void>
 *   Async version that awaits all async callbacks. Collects and rethrows errors.
 * - once(event: string, callback: (...args: any[]) => void): Subscription
 *   Subscribe for a single event firing. Auto-unsubscribes after first publish.
 * - clearEvent(event: string): void
 *   Remove all subscribers for a specific event.
 * - clearAll(): void
 *   Remove all subscribers for all events.
 * - getSubscriberCount(event: string): number
 *   Return how many subscribers are listening to an event.
 * - hasSubscribers(event: string): boolean
 *   Check if an event has any subscribers.
 *
 * Bonus: Implement wildcard subscriptions:
 * - subscribePattern(pattern: string, callback: (...args: any[]) => void): Subscription
 *   Support patterns like "user.*" or "user.created" or "user.*.deleted"
 *   Use glob-style matching where * matches any single segment.
 */

export interface Subscription {
  unsubscribe(): void;
  readonly event: string;
  readonly callback: (...args: any[]) => void;
}

export class EventBus {
  constructor() {
    // YOUR CODE HERE
  }

  subscribe(event: string, callback: (...args: any[]) => void): Subscription {
    // YOUR CODE HERE
    return { unsubscribe: () => {}, event, callback };
  }

  unsubscribe(event: string, callback: (...args: any[]) => void): boolean {
    // YOUR CODE HERE
    return false;
  }

  publish(event: string, ...args: any[]): void {
    // YOUR CODE HERE
  }

  publishAsync(event: string, ...args: any[]): Promise<void> {
    // YOUR CODE HERE
    return Promise.resolve();
  }

  once(event: string, callback: (...args: any[]) => void): Subscription {
    // YOUR CODE HERE
    return { unsubscribe: () => {}, event, callback };
  }

  clearEvent(event: string): void {
    // YOUR CODE HERE
  }

  clearAll(): void {
    // YOUR CODE HERE
  }

  getSubscriberCount(event: string): number {
    // YOUR CODE HERE
    return 0;
  }

  hasSubscribers(event: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  subscribePattern(pattern: string, callback: (...args: any[]) => void): Subscription {
    // YOUR CODE HERE
    return { unsubscribe: () => {}, event: pattern, callback };
  }
}
]=],
    tests = [=[
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { EventBus } from './challenge';

describe('EventBus', () => {
  let bus: EventBus;

  beforeEach(() => {
    bus = new EventBus();
  });

  it('subscribes and publishes events', () => {
    const callback = vi.fn();
    bus.subscribe('test', callback);
    bus.publish('test', 'hello', 42);
    expect(callback).toHaveBeenCalledWith('hello', 42);
    expect(callback).toHaveBeenCalledTimes(1);
  });

  it('subscribes multiple listeners to same event', () => {
    const cb1 = vi.fn();
    const cb2 = vi.fn();
    bus.subscribe('test', cb1);
    bus.subscribe('test', cb2);
    bus.publish('test', 'data');
    expect(cb1).toHaveBeenCalledWith('data');
    expect(cb2).toHaveBeenCalledWith('data');
    expect(cb1).toHaveBeenCalledTimes(1);
    expect(cb2).toHaveBeenCalledTimes(1);
  });

  it('unsubscribe removes listener', () => {
    const callback = vi.fn();
    const subscription = bus.subscribe('test', callback);
    bus.publish('test', 'first');
    subscription.unsubscribe();
    bus.publish('test', 'second');
    expect(callback).toHaveBeenCalledWith('first');
    expect(callback).not.toHaveBeenCalledWith('second');
    expect(callback).toHaveBeenCalledTimes(1);
  });

  it('unsubscribe returns boolean', () => {
    const callback = vi.fn();
    bus.subscribe('test', callback);
    expect(bus.unsubscribe('test', callback)).toBe(true);
    expect(bus.unsubscribe('test', callback)).toBe(false);
    expect(bus.unsubscribe('nonexistent', callback)).toBe(false);
  });

  it('once fires only once', () => {
    const callback = vi.fn();
    bus.once('test', callback);
    bus.publish('test', 'first');
    bus.publish('test', 'second');
    bus.publish('test', 'third');
    expect(callback).toHaveBeenCalledTimes(1);
    expect(callback).toHaveBeenCalledWith('first');
  });

  it('once returns subscription with unsubscribe', () => {
    const callback = vi.fn();
    const subscription = bus.once('test', callback);
    subscription.unsubscribe();
    bus.publish('test', 'data');
    expect(callback).not.toHaveBeenCalled();
  });

  it('getSubscriberCount returns correct count', () => {
    expect(bus.getSubscriberCount('test')).toBe(0);
    const cb1 = vi.fn();
    const cb2 = vi.fn();
    bus.subscribe('test', cb1);
    expect(bus.getSubscriberCount('test')).toBe(1);
    bus.subscribe('test', cb2);
    expect(bus.getSubscriberCount('test')).toBe(2);
    bus.unsubscribe('test', cb1);
    expect(bus.getSubscriberCount('test')).toBe(1);
  });

  it('hasSubscribers returns boolean', () => {
    expect(bus.hasSubscribers('test')).toBe(false);
    bus.subscribe('test', vi.fn());
    expect(bus.hasSubscribers('test')).toBe(true);
  });

  it('clearEvent removes all listeners for event', () => {
    const cb1 = vi.fn();
    const cb2 = vi.fn();
    const cb3 = vi.fn();
    bus.subscribe('test', cb1);
    bus.subscribe('test', cb2);
    bus.subscribe('other', cb3);
    bus.clearEvent('test');
    expect(bus.getSubscriberCount('test')).toBe(0);
    expect(bus.getSubscriberCount('other')).toBe(1);
    bus.publish('test', 'data');
    expect(cb1).not.toHaveBeenCalled();
    expect(cb2).not.toHaveBeenCalled();
  });

  it('clearAll removes all listeners', () => {
    bus.subscribe('test1', vi.fn());
    bus.subscribe('test2', vi.fn());
    bus.subscribe('test3', vi.fn());
    bus.clearAll();
    expect(bus.getSubscriberCount('test1')).toBe(0);
    expect(bus.getSubscriberCount('test2')).toBe(0);
    expect(bus.getSubscriberCount('test3')).toBe(0);
  });

  it('publish with no listeners does not throw', () => {
    expect(() => bus.publish('nonexistent', 'data')).not.toThrow();
  });

  it('publish passes all arguments', () => {
    const callback = vi.fn();
    bus.subscribe('test', callback);
    bus.publish('test', 1, 'two', true, null, { key: 'value' });
    expect(callback).toHaveBeenCalledWith(1, 'two', true, null, { key: 'value' });
  });

  it('publishAsync awaits async callbacks', async () => {
    const results: number[] = [];
    const asyncCb1 = async () => {
      await new Promise(resolve => setTimeout(resolve, 10));
      results.push(1);
    };
    const asyncCb2 = async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      results.push(2);
    };
    bus.subscribe('test', asyncCb1);
    bus.subscribe('test', asyncCb2);
    await bus.publishAsync('test');
    expect(results).toEqual([1, 2]);
  });

  it('publishAsync collects errors', async () => {
    const error = new Error('test error');
    const asyncCb = async () => {
      throw error;
    };
    bus.subscribe('test', asyncCb);
    await expect(bus.publishAsync('test')).rejects.toThrow('test error');
  });

  it('different events are independent', () => {
    const cb1 = vi.fn();
    const cb2 = vi.fn();
    bus.subscribe('event1', cb1);
    bus.subscribe('event2', cb2);
    bus.publish('event1', 'data1');
    bus.publish('event2', 'data2');
    expect(cb1).toHaveBeenCalledWith('data1');
    expect(cb1).not.toHaveBeenCalledWith('data2');
    expect(cb2).toHaveBeenCalledWith('data2');
    expect(cb2).not.toHaveBeenCalledWith('data1');
  });

  it('subscription has correct event and callback', () => {
    const callback = vi.fn();
    const subscription = bus.subscribe('myevent', callback);
    expect(subscription.event).toBe('myevent');
    expect(subscription.callback).toBe(callback);
  });

  it('unsubscribe via subscription object', () => {
    const callback = vi.fn();
    const subscription = bus.subscribe('test', callback);
    bus.publish('test', 'first');
    subscription.unsubscribe();
    bus.publish('test', 'second');
    expect(callback).toHaveBeenCalledTimes(1);
    expect(callback).toHaveBeenCalledWith('first');
  });

  it('multiple unsubscribe calls are safe', () => {
    const callback = vi.fn();
    bus.subscribe('test', callback);
    expect(bus.unsubscribe('test', callback)).toBe(true);
    expect(bus.unsubscribe('test', callback)).toBe(false);
    expect(bus.unsubscribe('test', callback)).toBe(false);
  });

  it('subscribePattern with wildcard matches', () => {
    const cb = vi.fn();
    bus.subscribePattern('user.*', cb);
    bus.publish('user.created', { id: 1 });
    bus.publish('user.deleted', { id: 2 });
    bus.publish('user.updated', { id: 3 });
    expect(cb).toHaveBeenCalledTimes(3);
  });

  it('subscribePattern does not match unrelated events', () => {
    const cb = vi.fn();
    bus.subscribePattern('user.*', cb);
    bus.publish('product.created', { id: 1 });
    bus.publish('order.created', { id: 2 });
    expect(cb).not.toHaveBeenCalled();
  });

  it('subscribePattern with multiple wildcards', () => {
    const cb = vi.fn();
    bus.subscribePattern('*.*.deleted', cb);
    bus.publish('user.account.deleted', { id: 1 });
    bus.publish('product.item.deleted', { id: 2 });
    bus.publish('user.account.created', { id: 3 });
    expect(cb).toHaveBeenCalledTimes(2);
  });

  it('pattern subscription can be unsubscribed', () => {
    const cb = vi.fn();
    const subscription = bus.subscribePattern('test.*', cb);
    bus.publish('test.event', 'data');
    subscription.unsubscribe();
    bus.publish('test.other', 'data');
    expect(cb).toHaveBeenCalledTimes(1);
  });

  it('getSubscriberCount includes pattern subscribers', () => {
    bus.subscribe('user.created', vi.fn());
    bus.subscribePattern('user.*', vi.fn());
    expect(bus.getSubscriberCount('user.created')).toBe(2);
  });

  it('stress test with many events and subscribers', () => {
    const callbacks: ReturnType<typeof vi.fn>[] = [];
    for (let i = 0; i < 100; i++) {
      const cb = vi.fn();
      callbacks.push(cb);
      bus.subscribe(`event${i % 10}`, cb);
    }
    for (let i = 0; i < 10; i++) {
      bus.publish(`event${i}`, 'data');
    }
    callbacks.forEach(cb => {
      expect(cb).toHaveBeenCalledTimes(1);
    });
  });
});
]=],
  },
  {
    name = "Memoize with Cache Key Generator",
    difficulty = "easy",
    stub = [=[
/**
 * Memoize with Cache Key Generator
 *
 * Implement a memoization higher-order function with customizable cache key generation.
 *
 * Memoization is an optimization technique that caches function results based on
 * input arguments, returning the cached result when the same inputs occur again.
 *
 * The challenge is to implement:
 * - A generic memoize function that wraps any function
 * - A cache key generator that converts arguments to a stable string key
 * - Support for custom key generators per function
 * - Cache inspection and management methods
 *
 * Implement:
 * - createCacheKey(args: any[]): string — Default key generator using JSON.stringify
 * - memoize<T extends (...args: any[]) => any>(
 *     fn: T,
 *     options?: { keyGenerator?: (...args: any[]) => string, maxCacheSize?: number }
 *   ): T & { cache: Map<string, any>, hits: number, misses: number, clear(): void, size(): number }
 *
 * The memoized function should:
 * - Cache results based on arguments
 * - Track hit/miss statistics
 * - Support max cache size with LRU eviction when exceeded
 * - Provide cache management methods
 *
 * Edge cases to handle:
 * - Functions with no arguments
 * - Functions with many arguments
 * - Arguments that are objects/arrays (need stable serialization)
 * - Circular references in arguments (should not crash)
 */

export function createCacheKey(args: any[]): string {
  // YOUR CODE HERE
  return '';
}

export function memoize<T extends (...args: any[]) => any>(
  fn: T,
  options?: {
    keyGenerator?: (...args: any[]) => string;
    maxCacheSize?: number;
  }
): T & {
  cache: Map<string, any>;
  hits: number;
  misses: number;
  clear(): void;
  size(): number;
} {
  // YOUR CODE HERE
  const memoized = (() => {}) as T;
  return Object.assign(memoized, {
    cache: new Map(),
    hits: 0,
    misses: 0,
    clear() {},
    size() { return 0; }
  });
}
]=],
    tests = [=[
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { memoize, createCacheKey } from './challenge';

describe('createCacheKey', () => {
  it('creates key for no arguments', () => {
    expect(createCacheKey([])).toBe('[]');
  });

  it('creates key for primitive arguments', () => {
    expect(createCacheKey([1, 2, 3])).toBe('[1,2,3]');
    expect(createCacheKey(['a', 'b', 'c'])).toBe('["a","b","c"]');
  });

  it('creates key for mixed arguments', () => {
    expect(createCacheKey([1, 'hello', true, null])).toBe('[1,"hello",true,null]');
  });

  it('creates key for object arguments', () => {
    const key = createCacheKey([{ a: 1, b: 2 }]);
    expect(key).toContain('"a":1');
    expect(key).toContain('"b":2');
  });

  it('creates consistent keys for same objects', () => {
    const obj = { x: 10, y: 20 };
    const key1 = createCacheKey([obj]);
    const key2 = createCacheKey([obj]);
    expect(key1).toBe(key2);
  });

  it('handles nested objects', () => {
    const key = createCacheKey([{ user: { name: 'Alice', age: 30 } }]);
    expect(key).toContain('"user"');
    expect(key).toContain('"name":"Alice"');
  });
});

describe('memoize', () => {
  beforeEach(() => {
    vi.clearAllMocks();
  });

  it('caches function results', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    expect(memoized(5)).toBe(10);
    expect(memoized(5)).toBe(10);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('tracks hits and misses', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    memoized(5);
    expect(memoized.misses).toBe(1);
    expect(memoized.hits).toBe(0);
    
    memoized(5);
    expect(memoized.hits).toBe(1);
    expect(memoized.misses).toBe(1);
    
    memoized(10);
    expect(memoized.hits).toBe(1);
    expect(memoized.misses).toBe(2);
  });

  it('exposes cache', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    memoized(5);
    expect(memoized.cache.size).toBe(1);
    expect(memoized.cache.has('[5]')).toBe(true);
  });

  it('clear method empties cache', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    memoized(5);
    memoized(10);
    expect(memoized.cache.size).toBe(2);
    
    memoized.clear();
    expect(memoized.cache.size).toBe(0);
    expect(memoized.hits).toBe(0);
    expect(memoized.misses).toBe(0);
  });

  it('size method returns cache size', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    expect(memoized.size()).toBe(0);
    memoized(5);
    expect(memoized.size()).toBe(1);
    memoized(10);
    expect(memoized.size()).toBe(2);
  });

  it('handles functions with no arguments', () => {
    let counter = 0;
    const fn = vi.fn(() => ++counter);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(1);
    expect(memoized()).toBe(1);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions with multiple arguments', () => {
    const fn = vi.fn((a: number, b: number, c: number) => a + b + c);
    const memoized = memoize(fn);
    
    expect(memoized(1, 2, 3)).toBe(6);
    expect(memoized(1, 2, 3)).toBe(6);
    expect(memoized(3, 2, 1)).toBe(6);
    expect(memoized(3, 2, 1)).toBe(6);
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('handles object arguments', () => {
    const fn = vi.fn((obj: { x: number }) => obj.x * 2);
    const memoized = memoize(fn);
    
    expect(memoized({ x: 5 })).toBe(10);
    expect(memoized({ x: 5 })).toBe(10);
    expect(fn).toHaveBeenCalledTimes(2); // Different object references
  });

  it('same object reference is cached', () => {
    const fn = vi.fn((obj: { x: number }) => obj.x * 2);
    const memoized = memoize(fn);
    const obj = { x: 5 };
    
    expect(memoized(obj)).toBe(10);
    expect(memoized(obj)).toBe(10);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('custom key generator', () => {
    const fn = vi.fn((x: number) => x * 2);
    const keyGen = (x: number) => `custom:${x}`;
    const memoized = memoize(fn, { keyGenerator: keyGen });
    

    memoized(5);
    expect(memoized.cache.has('custom:5')).toBe(true);
  });

  it('maxCacheSize triggers LRU eviction', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn, { maxCacheSize: 2 });
    
    memoized(1);
    memoized(2);
    expect(memoized.size()).toBe(2);
    
    memoized(3); // Should evict oldest (1)
    expect(memoized.size()).toBe(2);
    expect(memoized.cache.has('[1]')).toBe(false);
    expect(memoized.cache.has('[2]')).toBe(true);
    expect(memoized.cache.has('[3]')).toBe(true);
  });

  it('LRU eviction on access refresh', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn, { maxCacheSize: 2 });
    
    memoized(1);
    memoized(2);
    memoized(1); // Access 1, making 2 the oldest
    memoized(3); // Should evict 2, not 1
    
    expect(memoized.cache.has('[1]')).toBe(true);
    expect(memoized.cache.has('[2]')).toBe(false);
    expect(memoized.cache.has('[3]')).toBe(true);
  });

  it('preserves function context', () => {
    const obj = {
      multiplier: 2,
      multiply(x: number) { return x * this.multiplier; }
    };
    const memoized = memoize(obj.multiply.bind(obj));
    
    expect(memoized(5)).toBe(10);
    expect(memoized(5)).toBe(10);
  });

  it('handles async functions', async () => {
    const fn = vi.fn(async (x: number) => {
      await new Promise(resolve => setTimeout(resolve, 10));
      return x * 2;
    });
    const memoized = memoize(fn);
    
    const result1 = await memoized(5);
    const result2 = await memoized(5);
    
    expect(result1).toBe(10);
    expect(result2).toBe(10);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning undefined', () => {
    const fn = vi.fn(() => undefined);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(undefined);
    expect(memoized()).toBe(undefined);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning null', () => {
    const fn = vi.fn(() => null);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(null);
    expect(memoized()).toBe(null);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning 0', () => {
    const fn = vi.fn(() => 0);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(0);
    expect(memoized()).toBe(0);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning false', () => {
    const fn = vi.fn(() => false);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(false);
    expect(memoized()).toBe(false);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning empty string', () => {
    const fn = vi.fn(() => '');
    const memoized = memoize(fn);
    
    expect(memoized()).toBe('');
    expect(memoized()).toBe('');
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('stress test with many calls', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    for (let i = 0; i < 1000; i++) {
      memoized(i % 10);
    }
    
    expect(fn).toHaveBeenCalledTimes(10); // Only 10 unique inputs
    expect(memoized.hits).toBe(990);
    expect(memoized.misses).toBe(10);
  });

  it('maxCacheSize of 1', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn, { maxCacheSize: 1 });
    
    memoized(1);
    expect(memoized.size()).toBe(1);
    memoized(2);
    expect(memoized.size()).toBe(1);
    expect(memoized.cache.has('[1]')).toBe(false);
    expect(memoized.cache.has('[2]')).toBe(true);
  });

  it('maxCacheSize equals cache growth without eviction', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn, { maxCacheSize: 100 });
    
    for (let i = 0; i < 50; i++) {
      memoized(i);
    }
    
    expect(memoized.size()).toBe(50);
  });
});

describe('edge cases', () => {
  it('circular reference in arguments', () => {
    const fn = vi.fn((obj: any) => obj);
    const memoized = memoize(fn);
    
    const obj: any = { x: 1 };
    obj.self = obj;
    
    // Should not crash, but may not cache properly
    expect(() => memoized(obj)).not.toThrow();
  });

  it('symbol arguments', () => {
    const fn = vi.fn((sym: symbol) => sym.description);
    const memoized = memoize(fn);
    
    const sym = Symbol('test');
    expect(memoized(sym)).toBe('test');
  });

  it('function arguments', () => {
    const fn = vi.fn((cb: () => void) => cb());
    const memoized = memoize(fn);
    
    const cb = () => 42;
    expect(memoized(cb)).toBe(42);
  });
});
]=],
  },
  {
    name = "Min-Heap Priority Queue",
    difficulty = "medium",
    stub = [=[
/**
 * Min-Heap Priority Queue
 *
 * Implement a binary min-heap based priority queue.
 *
 * A min-heap is a complete binary tree where each node is smaller than
 * or equal to its children. This structure enables efficient retrieval
 * of the minimum element and is commonly used for:
 * - Priority queues
 * - Heap sort
 * - Finding k smallest/largest elements
 * - Dijkstra's shortest path algorithm
 * - Merge k sorted lists
 *
 * Implement the MinHeap class with:
 * - constructor(initialValues?: number[]) — Optionally initialize with an array
 * - insert(value: number): void — Add a value to the heap (O(log n))
 * - extractMin(): number | null — Remove and return the minimum value (O(log n))
 * - peek(): number | null — Return the minimum value without removing (O(1))
 * - size(): number — Return the number of elements in the heap
 * - isEmpty(): boolean — Check if the heap is empty
 * - heapify(): void — Convert an arbitrary array into a heap (O(n))
 * - decreaseKey(index: number, newValue: number): boolean — Decrease the value
 *   at a given index (useful for Dijkstra's). Return false if index invalid or
 *   newValue > currentValue.
 * - delete(index: number): boolean — Delete element at index (O(log n))
 *
 * Bonus: Implement a generic MinHeap<T> that accepts a custom comparator:
 * - constructor(compareFn?: (a: T, b: T) => number)
 */

export class MinHeap {
  constructor(initialValues?: number[]) {
    // YOUR CODE HERE
  }

  insert(value: number): void {
    // YOUR CODE HERE
  }

  extractMin(): number | null {
    // YOUR CODE HERE
    return null;
  }

  peek(): number | null {
    // YOUR CODE HERE
    return null;
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }

  isEmpty(): boolean {
    // YOUR CODE HERE
    return true;
  }

  heapify(): void {
    // YOUR CODE HERE
  }

  decreaseKey(index: number, newValue: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  delete(index: number): boolean {
    // YOUR CODE HERE
    return false;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { MinHeap } from './challenge';

describe('MinHeap', () => {
  it('creates empty heap', () => {
    const heap = new MinHeap();
    expect(heap.isEmpty()).toBe(true);
    expect(heap.size()).toBe(0);
    expect(heap.peek()).toBeNull();
  });

  it('inserts single value', () => {
    const heap = new MinHeap();
    heap.insert(5);
    expect(heap.size()).toBe(1);
    expect(heap.peek()).toBe(5);
    expect(heap.isEmpty()).toBe(false);
  });

  it('inserts multiple values in order', () => {
    const heap = new MinHeap();
    heap.insert(1);
    heap.insert(2);
    heap.insert(3);
    expect(heap.peek()).toBe(1);
    expect(heap.size()).toBe(3);
  });

  it('inserts multiple values in reverse order', () => {
    const heap = new MinHeap();
    heap.insert(5);
    heap.insert(4);
    heap.insert(3);
    heap.insert(2);
    heap.insert(1);
    expect(heap.peek()).toBe(1);
    expect(heap.size()).toBe(5);
  });

  it('extractMin returns values in sorted order', () => {
    const heap = new MinHeap();
    [5, 3, 7, 1, 9, 2, 8].forEach(v => heap.insert(v));
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([1, 2, 3, 5, 7, 8, 9]);
  });

  it('extractMin from empty heap returns null', () => {
    const heap = new MinHeap();
    expect(heap.extractMin()).toBeNull();
  });

  it('peek from empty heap returns null', () => {
    const heap = new MinHeap();
    expect(heap.peek()).toBeNull();
  });

  it('initializes with array', () => {
    const heap = new MinHeap([5, 3, 7, 1, 9]);
    expect(heap.size()).toBe(5);
    expect(heap.peek()).toBe(1);
  });

  it('heapify converts array to heap', () => {
    const heap = new MinHeap([9, 7, 5, 3, 1]);
    heap.heapify();
    expect(heap.peek()).toBe(1);
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([1, 3, 5, 7, 9]);
  });

  it('heapify on already sorted array', () => {
    const heap = new MinHeap([1, 2, 3, 4, 5]);
    heap.heapify();
    expect(heap.peek()).toBe(1);
  });

  it('decreaseKey reduces value and bubbles up', () => {
    const heap = new MinHeap([10, 20, 30, 40, 50]);
    heap.heapify();
    
    // Decrease 50 to 5, should bubble to root
    expect(heap.decreaseKey(4, 5)).toBe(true);
    expect(heap.peek()).toBe(5);
  });

  it('decreaseKey returns false for invalid index', () => {
    const heap = new MinHeap([1, 2, 3]);
    expect(heap.decreaseKey(10, 0)).toBe(false);
    expect(heap.decreaseKey(-1, 0)).toBe(false);
  });

  it('decreaseKey returns false if newValue > currentValue', () => {
    const heap = new MinHeap([1, 2, 3]);
    expect(heap.decreaseKey(0, 5)).toBe(false); // Can't increase 1 to 5
  });

  it('delete removes element at index', () => {
    const heap = new MinHeap([5, 3, 7, 1, 9]);
    heap.heapify();
    
    // Delete element at index 2 (should be 5 after heapify)
    expect(heap.delete(2)).toBe(true);
    expect(heap.size()).toBe(4);
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([1, 3, 7, 9]);
  });

  it('delete returns false for invalid index', () => {
    const heap = new MinHeap([1, 2, 3]);
    expect(heap.delete(10)).toBe(false);
    expect(heap.delete(-1)).toBe(false);
  });

  it('delete last element', () => {
    const heap = new MinHeap([1, 2, 3]);
    heap.heapify();
    expect(heap.delete(2)).toBe(true);
    expect(heap.size()).toBe(2);
    expect(heap.peek()).toBe(1);
  });

  it('delete root element', () => {
    const heap = new MinHeap([3, 1, 2]);
    heap.heapify();
    expect(heap.delete(0)).toBe(true);
    expect(heap.size()).toBe(2);
    expect(heap.peek()).toBe(2);
  });

  it('maintains heap property after many operations', () => {
    const heap = new MinHeap();
    
    // Insert random values
    [42, 17, 73, 9, 55, 31, 8, 64, 22, 11].forEach(v => heap.insert(v));
    
    // Extract all and verify sorted order
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([8, 9, 11, 17, 22, 31, 42, 55, 64, 73]);
  });

  it('stress test with many insertions', () => {
    const heap = new MinHeap();
    const values = Array.from({ length: 1000 }, (_, i) => Math.random() * 10000);
    values.forEach(v => heap.insert(v));
    
    expect(heap.size()).toBe(1000);
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    
    // Verify sorted
    for (let i = 1; i < result.length; i++) {
      expect(result[i]).toBeGreaterThanOrEqual(result[i - 1]);
    }
  });

  it('handles duplicate values', () => {
    const heap = new MinHeap();
    [5, 3, 5, 1, 3, 1].forEach(v => heap.insert(v));
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([1, 1, 3, 3, 5, 5]);
  });

  it('handles negative values', () => {
    const heap = new MinHeap();
    [-5, -10, 0, 10, -1].forEach(v => heap.insert(v));
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([-10, -5, -1, 0, 10]);
  });

  it('single element operations', () => {
    const heap = new MinHeap();
    heap.insert(42);
    expect(heap.peek()).toBe(42);
    expect(heap.extractMin()).toBe(42);
    expect(heap.isEmpty()).toBe(true);
  });

  it('heap property invariant', () => {
    const heap = new MinHeap([50, 30, 40, 10, 20, 35, 45]);
    heap.heapify();
    
    // Verify heap property: parent <= children
    function verifyHeapProperty(arr: number[], i: number): boolean {
      if (i >= arr.length) return true;
      const left = 2 * i + 1;
      const right = 2 * i + 2;
      
      if (left < arr.length && arr[i] > arr[left]) return false;
      if (right < arr.length && arr[i] > arr[right]) return false;
      
      return verifyHeapProperty(arr, left) && verifyHeapProperty(arr, right);
    }
    
    // This is a structural check - we verify by extracting in order
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    for (let i = 1; i < result.length; i++) {
      expect(result[i]).toBeGreaterThanOrEqual(result[i - 1]);
    }
  });
});
]=],
  },
  {
    name = "Trie (Prefix Tree)",
    difficulty = "medium",
    stub = [=[
/**
 * Trie (Prefix Tree)
 *
 * Implement a Trie data structure for efficient string operations.
 *
 * A Trie is a tree-like structure where each node represents a character,
 * and paths from root to nodes represent strings. Commonly used for:
 * - Autocomplete and search suggestions
 * - Spell checkers
 * - IP routing (longest prefix match)
 * - Dictionary implementations
 *
 * Implement the Trie class with:
 * - constructor() — Initialize an empty trie
 * - insert(word: string): void — Insert a word into the trie
 * - search(word: string): boolean — Return true if word exists in trie
 * - startsWith(prefix: string): boolean — Return true if any word starts with prefix
 * - delete(word: string): boolean — Remove a word, return true if found
 * - findWordsWithPrefix(prefix: string, limit?: number): string[] — Return all
 *   words with given prefix, optionally limited to N results
 * - countWords(): number — Return total number of words in trie
 * - isEmpty(): boolean — Check if trie has no words
 *
 * Bonus methods:
 * - findShortestPrefixOf(word: string): string | null — Find shortest prefix
 *   that matches any word in trie
 * - longestCommonPrefix(): string — Find longest common prefix of all words
 * - autoComplete(prefix: string, limit?: number): Array<{word: string, score: number}>
 *   with scoring based on word frequency or length
 */

export class Trie {
  constructor() {
    // YOUR CODE HERE
  }

  insert(word: string): void {
    // YOUR CODE HERE
  }

  search(word: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  startsWith(prefix: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  delete(word: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  findWordsWithPrefix(prefix: string, limit?: number): string[] {
    // YOUR CODE HERE
    return [];
  }

  countWords(): number {
    // YOUR CODE HERE
    return 0;
  }

  isEmpty(): boolean {
    // YOUR CODE HERE
    return true;
  }

  findShortestPrefixOf(word: string): string | null {
    // YOUR CODE HERE
    return null;
  }

  longestCommonPrefix(): string {
    // YOUR CODE HERE
    return '';
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { Trie } from './challenge';

describe('Trie', () => {
  it('creates empty trie', () => {
    const trie = new Trie();
    expect(trie.isEmpty()).toBe(true);
    expect(trie.countWords()).toBe(0);
    expect(trie.search('')).toBe(false);
  });

  it('inserts single word', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.search('hello')).toBe(true);
    expect(trie.countWords()).toBe(1);
    expect(trie.isEmpty()).toBe(false);
  });

  it('inserts multiple words', () => {
    const trie = new Trie();
    trie.insert('cat');
    trie.insert('car');
    trie.insert('dog');
    expect(trie.search('cat')).toBe(true);
    expect(trie.search('car')).toBe(true);
    expect(trie.search('dog')).toBe(true);
    expect(trie.countWords()).toBe(3);
  });

  it('search returns false for non-existent words', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.search('hell')).toBe(false);
    expect(trie.search('helloo')).toBe(false);
    expect(trie.search('help')).toBe(false);
  });

  it('startsWith checks prefixes', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.startsWith('h')).toBe(true);
    expect(trie.startsWith('he')).toBe(true);
    expect(trie.startsWith('hel')).toBe(true);
    expect(trie.startsWith('hell')).toBe(true);
    expect(trie.startsWith('hello')).toBe(true);
    expect(trie.startsWith('x')).toBe(false);
  });

  it('startsWith after partial insert', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.startsWith('hello')).toBe(true);
    expect(trie.startsWith('help')).toBe(false);
  });

  it('handles common prefixes', () => {
    const trie = new Trie();
    trie.insert('apple');
    trie.insert('app');
    trie.insert('application');
    expect(trie.search('app')).toBe(true);
    expect(trie.search('apple')).toBe(true);
    expect(trie.search('application')).toBe(true);
    expect(trie.startsWith('app')).toBe(true);
    expect(trie.startsWith('appl')).toBe(true);
  });

  it('delete existing word', () => {
    const trie = new Trie();
    trie.insert('test');
    expect(trie.delete('test')).toBe(true);
    expect(trie.search('test')).toBe(false);
    expect(trie.countWords()).toBe(0);
  });

  it('delete non-existent word', () => {
    const trie = new Trie();
    trie.insert('test');
    expect(trie.delete('other')).toBe(false);
  });

  it('delete preserves shared prefixes', () => {
    const trie = new Trie();
    trie.insert('hello');
    trie.insert('hell');
    trie.delete('hell');
    expect(trie.search('hell')).toBe(false);
    expect(trie.search('hello')).toBe(true);
    expect(trie.startsWith('hell')).toBe(true);
  });

  it('delete word with longer word sharing prefix', () => {
    const trie = new Trie();
    trie.insert('app');
    trie.insert('apple');
    trie.delete('apple');
    expect(trie.search('apple')).toBe(false);
    expect(trie.search('app')).toBe(true);
  });

  it('findWordsWithPrefix returns matching words', () => {
    const trie = new Trie();
    trie.insert('cat');
    trie.insert('car');
    trie.insert('card');
    trie.insert('dog');
    
    const words = trie.findWordsWithPrefix('ca');
    expect(words).toContain('cat');
    expect(words).toContain('car');
    expect(words).toContain('card');
    expect(words).not.toContain('dog');
  });

  it('findWordsWithPrefix with limit', () => {
    const trie = new Trie();
    trie.insert('test1');
    trie.insert('test2');
    trie.insert('test3');
    trie.insert('test4');
    
    const words = trie.findWordsWithPrefix('test', 2);
    expect(words.length).toBeLessThanOrEqual(2);
  });

  it('findWordsWithPrefix returns empty for non-existent prefix', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.findWordsWithPrefix('x')).toEqual([]);
  });

  it('countWords tracks total words', () => {
    const trie = new Trie();
    expect(trie.countWords()).toBe(0);
    trie.insert('one');
    expect(trie.countWords()).toBe(1);
    trie.insert('two');
    expect(trie.countWords()).toBe(2);
    trie.insert('three');
    expect(trie.countWords()).toBe(3);
  });

  it('handles empty string insert', () => {
    const trie = new Trie();
    trie.insert('');
    expect(trie.search('')).toBe(true);
    expect(trie.countWords()).toBe(1);
  });

  it('handles single character words', () => {
    const trie = new Trie();
    trie.insert('a');
    trie.insert('b');
    trie.insert('c');
    expect(trie.search('a')).toBe(true);
    expect(trie.search('b')).toBe(true);
    expect(trie.search('c')).toBe(true);
    expect(trie.search('ab')).toBe(false);
  });

  it('findShortestPrefixOf finds matching prefix', () => {
    const trie = new Trie();
    trie.insert('app');
    trie.insert('apple');
    
    expect(trie.findShortestPrefixOf('application')).toBe('app');
    expect(trie.findShortestPrefixOf('applepie')).toBe('app');
  });

  it('findShortestPrefixOf returns null for no match', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.findShortestPrefixOf('world')).toBeNull();
  });

  it('longestCommonPrefix with single word', () => {
    const trie = new Trie();
    trie.insert('testing');
    expect(trie.longestCommonPrefix()).toBe('testing');
  });

  it('longestCommonPrefix with multiple words', () => {
    const trie = new Trie();
    trie.insert('flower');
    trie.insert('flow');
    trie.insert('flight');
    expect(trie.longestCommonPrefix()).toBe('fl');
  });

  it('longestCommonPrefix with no common prefix', () => {
    const trie = new Trie();
    trie.insert('dog');
    trie.insert('cat');
    expect(trie.longestCommonPrefix()).toBe('');
  });

  it('longestCommonPrefix on empty trie', () => {
    const trie = new Trie();
    expect(trie.longestCommonPrefix()).toBe('');
  });

  it('stress test with many words', () => {
    const trie = new Trie();
    const words = ['apple', 'application', 'apply', 'app', 'banana', 'band', 'bandana', 'cat', 'car', 'card'];
    words.forEach(w => trie.insert(w));
    
    expect(trie.countWords()).toBe(10);
    words.forEach(w => expect(trie.search(w)).toBe(true));
    expect(trie.startsWith('app')).toBe(true);
    expect(trie.startsWith('ban')).toBe(true);
    expect(trie.startsWith('ca')).toBe(true);
  });

  it('insert and search with special characters', () => {
    const trie = new Trie();
    trie.insert('hello-world');
    trie.insert('hello_world');
    expect(trie.search('hello-world')).toBe(true);
    expect(trie.search('hello_world')).toBe(true);
    expect(trie.search('hello')).toBe(false);
  });

  it('case sensitivity', () => {
    const trie = new Trie();
    trie.insert('Hello');
    expect(trie.search('Hello')).toBe(true);
    expect(trie.search('hello')).toBe(false);
    expect(trie.search('HELLO')).toBe(false);
  });

  it('duplicate insertions', () => {
    const trie = new Trie();
    trie.insert('test');
    trie.insert('test');
    trie.insert('test');
    expect(trie.search('test')).toBe(true);
    // Depending on implementation, count might be 1 or 3
    expect(trie.countWords()).toBeGreaterThanOrEqual(1);
  });

  it('delete all words', () => {
    const trie = new Trie();
    trie.insert('a');
    trie.insert('b');
    trie.insert('c');
    trie.delete('a');
    trie.delete('b');
    trie.delete('c');
    expect(trie.isEmpty()).toBe(true);
    expect(trie.countWords()).toBe(0);
  });

  it('complex prefix tree', () => {
    const trie = new Trie();
    const words = ['de', 'ded', 'deer', 'deal', 'des', 'desk'];
    words.forEach(w => trie.insert(w));
    
    expect(trie.startsWith('de')).toBe(true);
    expect(trie.startsWith('dea')).toBe(true);
    expect(trie.startsWith('dee')).toBe(true);
    expect(trie.startsWith('des')).toBe(true);
    
    const deWords = trie.findWordsWithPrefix('de');
    expect(deWords.length).toBe(6);
    words.forEach(w => expect(deWords).toContain(w));
  });
});
]=],
  },
  {
    name = "Edit Distance",
    difficulty = "medium",
    stub = [=[
/**
 * Edit Distance (Levenshtein Distance)
 *
 * Implement the classic edit distance algorithm using dynamic programming.
 *
 * The edit distance between two strings is the minimum number of operations
 * required to transform one string into the other. Allowed operations:
 * - Insert a character
 * - Delete a character
 * - Replace a character
 *
 * This is a fundamental algorithm used in:
 * - Spell checkers and autocorrect
 * - DNA sequence alignment
 * - Plagiarism detection
 * - Fuzzy string matching
 * - Natural language processing
 *
 * Implement:
 * - editDistance(word1: string, word2: string): number
 *   Return the minimum number of operations to convert word1 to word2.
 *
 * - editDistanceWithOps(word1: string, word2: string): { distance: number, operations: Operation[] }
 *   Return both the distance and the actual sequence of operations.
 *   Operation types: { type: 'insert' | 'delete' | 'replace', index: number, char?: string }
 *
 * - editDistanceWithLimit(word1: string, word2: string, maxDistance: number): number
 *   Optimized version that returns early if distance exceeds maxDistance.
 *   Useful for fuzzy search where you only care about "close enough" matches.
 *   Return -1 if the actual distance exceeds maxDistance.
 *
 * Approach: Use a 2D DP table where dp[i][j] represents the edit distance
 * between word1[0..i-1] and word2[0..j-1].
 *
 * Base cases:
 * - dp[0][j] = j (insert j characters)
 * - dp[i][0] = i (delete i characters)
 *
 * Recurrence:
 * - If word1[i-1] === word2[j-1]: dp[i][j] = dp[i-1][j-1]
 * - Otherwise: dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
 *   (delete, insert, replace)
 *
 * Bonus: Implement editDistanceWithWeights that accepts custom costs:
 * - insertCost: number (default: 1)
 * - deleteCost: number (default: 1)
 * - replaceCost: number (default: 1)
 */

export function editDistance(word1: string, word2: string): number {
  // YOUR CODE HERE
  return 0;
}

export interface Operation {
  type: 'insert' | 'delete' | 'replace';
  index: number;
  char?: string;
}

export function editDistanceWithOps(
  word1: string,
  word2: string
): { distance: number; operations: Operation[] } {
  // YOUR CODE HERE
  return { distance: 0, operations: [] };
}

export function editDistanceWithLimit(
  word1: string,
  word2: string,
  maxDistance: number
): number {
  // YOUR CODE HERE
  return 0;
}

export function editDistanceWithWeights(
  word1: string,
  word2: string,
  costs?: { insertCost?: number; deleteCost?: number; replaceCost?: number }
): number {
  // YOUR CODE HERE
  return 0;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { editDistance, editDistanceWithOps, editDistanceWithLimit, editDistanceWithWeights } from './challenge';

describe('editDistance', () => {
  it('identical strings have distance 0', () => {
    expect(editDistance('hello', 'hello')).toBe(0);
    expect(editDistance('', '')).toBe(0);
    expect(editDistance('a', 'a')).toBe(0);
  });

  it('empty to non-empty requires insertions', () => {
    expect(editDistance('', 'abc')).toBe(3);
    expect(editDistance('', 'hello')).toBe(5);
  });

  it('non-empty to empty requires deletions', () => {
    expect(editDistance('abc', '')).toBe(3);
    expect(editDistance('hello', '')).toBe(5);
  });

  it('single character replacement', () => {
    expect(editDistance('cat', 'bat')).toBe(1);
    expect(editDistance('dog', 'log')).toBe(1);
  });

  it('single character insertion', () => {
    expect(editDistance('cat', 'cart')).toBe(1);
    expect(editDistance('hello', 'heillo')).toBe(1);
  });

  it('single character deletion', () => {
    expect(editDistance('cart', 'cat')).toBe(1);
    expect(editDistance('heillo', 'hello')).toBe(1);
  });

  it('multiple operations needed', () => {
    expect(editDistance('kitten', 'sitting')).toBe(3);
  });

  it('completely different strings', () => {
    expect(editDistance('abc', 'xyz')).toBe(3);
    expect(editDistance('abcd', 'wxyz')).toBe(4);
  });

  it('same length different chars', () => {
    expect(editDistance('abc', 'def')).toBe(3);
    expect(editDistance('hello', 'world')).toBe(4);
  });

  it('one char difference in length', () => {
    expect(editDistance('abc', 'abcd')).toBe(1);
    expect(editDistance('test', 'testing')).toBe(3);
  });

  it('case sensitive', () => {
    expect(editDistance('Hello', 'hello')).toBe(1);
    expect(editDistance('ABC', 'abc')).toBe(3);
  });

  it('unicode characters', () => {
    expect(editDistance('café', 'cafe')).toBe(1);
    expect(editDistance('你好', '你好')).toBe(0);
  });

  it('longer strings', () => {
    expect(editDistance('algorithm', 'altruistic')).toBe(6);
  });

  it('palindrome transformation', () => {
    expect(editDistance('race', 'care')).toBe(2);
  });

  it('anagram transformation', () => {
    expect(editDistance('listen', 'silent')).toBe(4);
  });
});

describe('editDistanceWithOps', () => {
  it('identical strings have no operations', () => {
    const result = editDistanceWithOps('hello', 'hello');
    expect(result.distance).toBe(0);
    expect(result.operations).toEqual([]);
  });

  it('single replacement', () => {
    const result = editDistanceWithOps('cat', 'bat');
    expect(result.distance).toBe(1);
    expect(result.operations).toHaveLength(1);
    expect(result.operations[0].type).toBe('replace');
  });

  it('single insertion', () => {
    const result = editDistanceWithOps('cat', 'cart');
    expect(result.distance).toBe(1);
    expect(result.operations).toHaveLength(1);
    expect(result.operations[0].type).toBe('insert');
  });

  it('single deletion', () => {
    const result = editDistanceWithOps('cart', 'cat');
    expect(result.distance).toBe(1);
    expect(result.operations).toHaveLength(1);
    expect(result.operations[0].type).toBe('delete');
  });

  it('kitten to sitting with operations', () => {
    const result = editDistanceWithOps('kitten', 'sitting');
    expect(result.distance).toBe(3);
    expect(result.operations).toHaveLength(3);
  });

  it('empty to non-empty', () => {
    const result = editDistanceWithOps('', 'abc');
    expect(result.distance).toBe(3);
    expect(result.operations.every(op => op.type === 'insert')).toBe(true);
  });

  it('non-empty to empty', () => {
    const result = editDistanceWithOps('abc', '');
    expect(result.distance).toBe(3);
    expect(result.operations.every(op => op.type === 'delete')).toBe(true);
  });
});

describe('editDistanceWithLimit', () => {
  it('returns distance when under limit', () => {
    expect(editDistanceWithLimit('cat', 'bat', 5)).toBe(1);
    expect(editDistanceWithLimit('kitten', 'sitting', 5)).toBe(3);
  });

  it('returns -1 when exceeds limit', () => {
    expect(editDistanceWithLimit('algorithm', 'altruistic', 3)).toBe(-1);
    expect(editDistanceWithLimit('hello', 'world', 2)).toBe(-1);
  });

  it('returns exact value at limit', () => {
    expect(editDistanceWithLimit('cat', 'bat', 1)).toBe(1);
    expect(editDistanceWithLimit('kitten', 'sitting', 3)).toBe(3);
  });

  it('limit of 0', () => {
    expect(editDistanceWithLimit('hello', 'hello', 0)).toBe(0);
    expect(editDistanceWithLimit('hello', 'world', 0)).toBe(-1);
  });

  it('early termination optimization', () => {
    const start = Date.now();
    const result = editDistanceWithLimit('a'.repeat(1000), 'b'.repeat(1000), 5);
    const elapsed = Date.now() - start;
    expect(result).toBe(-1);
    expect(elapsed).toBeLessThan(100);
  });
});

describe('editDistanceWithWeights', () => {
  it('default weights match editDistance', () => {
    expect(editDistanceWithWeights('cat', 'bat')).toBe(editDistance('cat', 'bat'));
    expect(editDistanceWithWeights('kitten', 'sitting')).toBe(editDistance('kitten', 'sitting'));
  });

  it('custom insert cost', () => {
    expect(editDistanceWithWeights('', 'abc', { insertCost: 2 })).toBe(6);
    expect(editDistanceWithWeights('abc', '', { insertCost: 2 })).toBe(3);
  });

  it('custom delete cost', () => {
    expect(editDistanceWithWeights('abc', '', { deleteCost: 2 })).toBe(6);
    expect(editDistanceWithWeights('', 'abc', { deleteCost: 2 })).toBe(3);
  });

  it('custom replace cost', () => {
    expect(editDistanceWithWeights('cat', 'bat', { replaceCost: 2 })).toBe(2);
    expect(editDistanceWithWeights('abc', 'xyz', { replaceCost: 0.5 })).toBe(1.5);
  });

  it('mixed custom costs', () => {
    const result = editDistanceWithWeights('kitten', 'sitting', {
      insertCost: 1,
      deleteCost: 1,
      replaceCost: 2
    });
    expect(result).toBeGreaterThanOrEqual(3);
  });

  it('zero cost operations', () => {
    expect(editDistanceWithWeights('cat', 'bat', { replaceCost: 0 })).toBe(0);
  });

  it('fractional costs', () => {
    expect(editDistanceWithWeights('abc', 'xyz', { replaceCost: 0.5 })).toBe(1.5);
  });
});

describe('edge cases', () => {
  it('very long strings', () => {
    const s1 = 'a'.repeat(100);
    const s2 = 'b'.repeat(100);
    expect(editDistance(s1, s2)).toBe(100);
  });

  it('one very long, one short', () => {
    expect(editDistance('a'.repeat(100), 'b')).toBe(100);
    expect(editDistance('a', 'b'.repeat(100))).toBe(100);
  });

  it('special characters', () => {
    expect(editDistance('a!@#', 'a!@#')).toBe(0);
    expect(editDistance('a!@#', 'b!@#')).toBe(1);
  });

  it('whitespace', () => {
    expect(editDistance('hello world', 'hello  world')).toBe(1);
    expect(editDistance('hello', 'hello ')).toBe(1);
  });

  it('newlines', () => {
    expect(editDistance('hello\nworld', 'hello world')).toBe(1);
  });
});

describe('performance', () => {
  it('handles 500 char strings in reasonable time', () => {
    const s1 = Array.from({ length: 500 }, () => 
      String.fromCharCode(97 + Math.floor(Math.random() * 26))
    ).join('');
    const s2 = Array.from({ length: 500 }, () => 
      String.fromCharCode(97 + Math.floor(Math.random() * 26))
    ).join('');
    
    const start = Date.now();
    const result = editDistance(s1, s2);
    const elapsed = Date.now() - start;
    
    expect(result).toBeLessThan(500);
    expect(elapsed).toBeLessThan(1000);
  });
});
]=],
  },
  {
    name = "Binary Search",
    difficulty = "medium",
    stub = [=[
/**
 * Binary Search
 *
 * Implement binary search and its variations.
 *
 * Binary search is a fundamental algorithm for finding a target value
 * in a sorted array by repeatedly dividing the search interval in half.
 * Time complexity: O(log n)
 *
 * Implement:
 * - binarySearch(arr: number[], target: number): number
 *   Return the index of target if found, -1 otherwise.
 *
 * - binarySearchLeft(arr: number[], target: number): number
 *   Return the leftmost index where target could be inserted
 *   while maintaining sorted order (first occurrence if exists).
 *
 * - binarySearchRight(arr: number[], target: number): number
 *   Return the rightmost index where target could be inserted
 *   while maintaining sorted order (index after last occurrence if exists).
 *
 * - findFirstOccurrence(arr: number[], target: number): number
 *   Return the index of the first occurrence of target, or -1 if not found.
 *
 * - findLastOccurrence(arr: number[], target: number): number
 *   Return the index of the last occurrence of target, or -1 if not found.
 *
 * - countOccurrences(arr: number[], target: number): number
 *   Return how many times target appears in the array.
 *
 * - findMinInRotatedSorted(arr: number[]): number
 *   Find the minimum element in a rotated sorted array.
 *   Example: [4,5,6,7,0,1,2] → 0
 *
 * - searchInRotatedSorted(arr: number[], target: number): number
 *   Search for target in a rotated sorted array. Return index or -1.
 *
 * Edge cases to handle:
 * - Empty array
 * - Single element array
 * - Target smaller/larger than all elements
 * - Duplicate elements
 * - All elements the same
 */

export function binarySearch(arr: number[], target: number): number {
  // YOUR CODE HERE
  return -1;
}

export function binarySearchLeft(arr: number[], target: number): number {
  // YOUR CODE HERE
  return 0;
}

export function binarySearchRight(arr: number[], target: number): number {
  // YOUR CODE HERE
  return 0;
}

export function findFirstOccurrence(arr: number[], target: number): number {
  // YOUR CODE HERE
  return -1;
}

export function findLastOccurrence(arr: number[], target: number): number {
  // YOUR CODE HERE
  return -1;
}

export function countOccurrences(arr: number[], target: number): number {
  // YOUR CODE HERE
  return 0;
}

export function findMinInRotatedSorted(arr: number[]): number {
  // YOUR CODE HERE
  return 0;
}

export function searchInRotatedSorted(arr: number[], target: number): number {
  // YOUR CODE HERE
  return -1;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import {
  binarySearch,
  binarySearchLeft,
  binarySearchRight,
  findFirstOccurrence,
  findLastOccurrence,
  countOccurrences,
  findMinInRotatedSorted,
  searchInRotatedSorted
} from './challenge';

describe('binarySearch', () => {
  it('finds element in middle', () => {
    expect(binarySearch([1, 3, 5, 7, 9], 5)).toBe(2);
  });

  it('finds element at start', () => {
    expect(binarySearch([1, 3, 5, 7, 9], 1)).toBe(0);
  });

  it('finds element at end', () => {
    expect(binarySearch([1, 3, 5, 7, 9], 9)).toBe(4);
  });

  it('returns -1 for missing element smaller than all', () => {
    expect(binarySearch([1, 3, 5], 0)).toBe(-1);
  });

  it('returns -1 for missing element larger than all', () => {
    expect(binarySearch([1, 3, 5], 10)).toBe(-1);
  });

  it('returns -1 for missing element in middle', () => {
    expect(binarySearch([1, 3, 5, 7], 4)).toBe(-1);
  });

  it('works with single element array found', () => {
    expect(binarySearch([5], 5)).toBe(0);
  });

  it('works with single element array not found', () => {
    expect(binarySearch([5], 3)).toBe(-1);
  });

  it('works with empty array', () => {
    expect(binarySearch([], 5)).toBe(-1);
  });

  it('works with two elements', () => {
    expect(binarySearch([1, 2], 1)).toBe(0);
    expect(binarySearch([1, 2], 2)).toBe(1);
    expect(binarySearch([1, 2], 3)).toBe(-1);
  });

  it('works with duplicates returns any occurrence', () => {
    const arr = [1, 2, 2, 2, 3];
    const result = binarySearch(arr, 2);
    expect(result).toBeGreaterThanOrEqual(1);
    expect(result).toBeLessThanOrEqual(3);
  });

  it('works with negative numbers', () => {
    expect(binarySearch([-5, -3, -1, 0, 2], -3)).toBe(1);
    expect(binarySearch([-5, -3, -1, 0, 2], -4)).toBe(-1);
  });

  it('large array', () => {
    const arr = Array.from({ length: 10000 }, (_, i) => i * 2);
    expect(binarySearch(arr, 5000)).toBe(2500);
    expect(binarySearch(arr, 5001)).toBe(-1);
  });
});

describe('binarySearchLeft', () => {
  it('returns index of first occurrence', () => {
    expect(binarySearchLeft([1, 2, 2, 2, 3], 2)).toBe(1);
  });

  it('returns insertion point for missing element', () => {
    expect(binarySearchLeft([1, 3, 5], 2)).toBe(1);
  });

  it('returns 0 for element smaller than all', () => {
    expect(binarySearchLeft([1, 3, 5], 0)).toBe(0);
  });

  it('returns array.length for element larger than all', () => {
    expect(binarySearchLeft([1, 3, 5], 10)).toBe(3);
  });

  it('works with empty array', () => {
    expect(binarySearchLeft([], 5)).toBe(0);
  });

  it('works with single element', () => {
    expect(binarySearchLeft([5], 5)).toBe(0);
    expect(binarySearchLeft([5], 3)).toBe(0);
    expect(binarySearchLeft([5], 7)).toBe(1);
  });

  it('all elements same', () => {
    expect(binarySearchLeft([2, 2, 2, 2], 2)).toBe(0);
    expect(binarySearchLeft([2, 2, 2, 2], 1)).toBe(0);
    expect(binarySearchLeft([2, 2, 2, 2], 3)).toBe(4);
  });
});

describe('binarySearchRight', () => {
  it('returns index after last occurrence', () => {
    expect(binarySearchRight([1, 2, 2, 2, 3], 2)).toBe(4);
  });

  it('returns insertion point for missing element', () => {
    expect(binarySearchRight([1, 3, 5], 2)).toBe(1);
  });

  it('returns 0 for element smaller than all', () => {
    expect(binarySearchRight([1, 3, 5], 0)).toBe(0);
  });

  it('returns array.length for element larger than all', () => {
    expect(binarySearchRight([1, 3, 5], 10)).toBe(3);
  });

  it('works with empty array', () => {
    expect(binarySearchRight([], 5)).toBe(0);
  });

  it('all elements same', () => {
    expect(binarySearchRight([2, 2, 2, 2], 2)).toBe(4);
  });
});

describe('findFirstOccurrence', () => {
  it('finds first occurrence with duplicates', () => {
    expect(findFirstOccurrence([1, 2, 2, 2, 3], 2)).toBe(1);
  });

  it('returns -1 for missing element', () => {
    expect(findFirstOccurrence([1, 3, 5], 2)).toBe(-1);
  });

  it('works with single occurrence', () => {
    expect(findFirstOccurrence([1, 2, 3], 2)).toBe(1);
  });

  it('works with empty array', () => {
    expect(findFirstOccurrence([], 5)).toBe(-1);
  });

  it('first of many duplicates', () => {
    expect(findFirstOccurrence([2, 2, 2, 2, 2], 2)).toBe(0);
  });
});

describe('findLastOccurrence', () => {
  it('finds last occurrence with duplicates', () => {
    expect(findLastOccurrence([1, 2, 2, 2, 3], 2)).toBe(3);
  });

  it('returns -1 for missing element', () => {
    expect(findLastOccurrence([1, 3, 5], 2)).toBe(-1);
  });

  it('works with single occurrence', () => {
    expect(findLastOccurrence([1, 2, 3], 2)).toBe(1);
  });

  it('works with empty array', () => {
    expect(findLastOccurrence([], 5)).toBe(-1);
  });

  it('last of many duplicates', () => {
    expect(findLastOccurrence([2, 2, 2, 2, 2], 2)).toBe(4);
  });
});

describe('countOccurrences', () => {
  it('counts duplicates correctly', () => {
    expect(countOccurrences([1, 2, 2, 2, 3], 2)).toBe(3);
  });

  it('returns 0 for missing element', () => {
    expect(countOccurrences([1, 3, 5], 2)).toBe(0);
  });

  it('returns 1 for single occurrence', () => {
    expect(countOccurrences([1, 2, 3], 2)).toBe(1);
  });

  it('works with empty array', () => {
    expect(countOccurrences([], 5)).toBe(0);
  });

  it('all elements same', () => {
    expect(countOccurrences([2, 2, 2, 2, 2], 2)).toBe(5);
  });

  it('large array with many duplicates', () => {
    const arr = [1, ...Array(1000).fill(2), 3];
    expect(countOccurrences(arr, 2)).toBe(1000);
  });
});

describe('findMinInRotatedSorted', () => {
  it('finds min in rotated array', () => {
    expect(findMinInRotatedSorted([4, 5, 6, 7, 0, 1, 2])).toBe(0);
  });

  it('works with no rotation', () => {
    expect(findMinInRotatedSorted([1, 2, 3, 4, 5])).toBe(1);
  });

  it('works with single element', () => {
    expect(findMinInRotatedSorted([5])).toBe(5);
  });

  it('works with two elements rotated', () => {
    expect(findMinInRotatedSorted([2, 1])).toBe(1);
  });

  it('works with two elements not rotated', () => {
    expect(findMinInRotatedSorted([1, 2])).toBe(1);
  });

  it('works with empty array', () => {
    expect(findMinInRotatedSorted([])).toBe(0);
  });

  it('all elements same', () => {
    expect(findMinInRotatedSorted([3, 3, 3, 3])).toBe(3);
  });

  it('rotation at different positions', () => {
    expect(findMinInRotatedSorted([3, 4, 5, 1, 2])).toBe(1);
    expect(findMinInRotatedSorted([5, 1, 2, 3, 4])).toBe(1);
  });
});

describe('searchInRotatedSorted', () => {
  it('finds element in rotated array', () => {
    expect(searchInRotatedSorted([4, 5, 6, 7, 0, 1, 2], 0)).toBe(4);
  });

  it('returns -1 for missing element', () => {
    expect(searchInRotatedSorted([4, 5, 6, 7, 0, 1, 2], 3)).toBe(-1);
  });

  it('works with no rotation', () => {
    expect(searchInRotatedSorted([1, 2, 3, 4, 5], 3)).toBe(2);
  });

  it('works with single element found', () => {
    expect(searchInRotatedSorted([5], 5)).toBe(0);
  });

  it('works with single element not found', () => {
    expect(searchInRotatedSorted([5], 3)).toBe(-1);
  });

  it('works with empty array', () => {
    expect(searchInRotatedSorted([], 5)).toBe(-1);
  });

  it('search at pivot point', () => {
    const arr = [4, 5, 6, 7, 0, 1, 2];
    expect(searchInRotatedSorted(arr, 7)).toBe(3);
    expect(searchInRotatedSorted(arr, 0)).toBe(4);
  });

  it('duplicates in rotated array', () => {
    expect(searchInRotatedSorted([2, 2, 2, 0, 2], 0)).toBe(3);
    expect(searchInRotatedSorted([2, 2, 2, 0, 2], 3)).toBe(-1);
  });
});

describe('edge cases', () => {
  it('negative numbers in binary search', () => {
    expect(binarySearch([-10, -5, -2, 0, 3], -5)).toBe(1);
  });

  it('floating point numbers', () => {
    expect(binarySearch([1.5, 2.5, 3.5, 4.5], 3.5)).toBe(2);
  });

  it('very large numbers', () => {
    expect(binarySearch([Number.MAX_SAFE_INTEGER - 2, Number.MAX_SAFE_INTEGER - 1, Number.MAX_SAFE_INTEGER], Number.MAX_SAFE_INTEGER - 1)).toBe(1);
  });

  it('min in rotated with duplicates', () => {
    expect(findMinInRotatedSorted([2, 2, 2, 0, 1, 2])).toBe(0);
  });
});

describe('performance', () => {
  it('binary search on 1 million elements completes quickly', () => {
    const arr = Array.from({ length: 1000000 }, (_, i) => i);
    const start = Date.now();
    const result = binarySearch(arr, 500000);
    const elapsed = Date.now() - start;
    expect(result).toBe(500000);
    expect(elapsed).toBeLessThan(100);
  });

  it('findMinInRotatedSorted on large array', () => {
    const arr = [...Array(500000).keys()].slice(250000).concat([...Array(500000).keys()].slice(0, 250000));
    const start = Date.now();
    const result = findMinInRotatedSorted(arr);
    const elapsed = Date.now() - start;
    expect(result).toBe(0);
    expect(elapsed).toBeLessThan(100);
  });
});
]=],
  },
  {
    name = "Segment Tree",
    difficulty = "hard",
    stub = [=[
/**
 * Segment Tree
 *
 * Implement a Segment Tree for efficient range queries and updates.
 *
 * A Segment Tree is a binary tree data structure that allows answering
 * range queries over an array in O(log n) time while supporting
 * point updates in O(log n) time. It's commonly used for:
 * - Range sum queries
 * - Range minimum/maximum queries
 * - Range product queries
 * - Any associative operation over ranges
 *
 * Implement the SegmentTree class with:
 * - constructor(arr: number[]) — Initialize with an array
 * - update(index: number, value: number): void — Update value at index (O(log n))
 * - queryRange(left: number, right: number): number — Query sum in range [left, right] (O(log n))
 * - queryMin(left: number, right: number): number — Query minimum in range (O(log n))
 * - queryMax(left: number, right: number): number — Query maximum in range (O(log n))
 *
 * The tree should be built in O(n) time during construction.
 * Use 0-based indexing for the public API.
 *
 * Bonus: Implement rangeUpdate(left: number, right: number, delta: number): void
 * using lazy propagation for O(log n) range updates.
 */

export class SegmentTree {
  constructor(arr: number[]) {
    // YOUR CODE HERE
  }

  update(index: number, value: number): void {
    // YOUR CODE HERE
  }

  queryRange(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }

  queryMin(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }

  queryMax(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }

  rangeUpdate(left: number, right: number, delta: number): void {
    // YOUR CODE HERE
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { SegmentTree } from './challenge';

describe('SegmentTree', () => {
  it('creates tree from array', () => {
    const arr = [1, 3, 5, 7, 9, 11];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 5)).toBe(36);
  });

  it('queryRange returns sum of range', () => {
    const arr = [1, 2, 3, 4, 5];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 4)).toBe(15);
    expect(tree.queryRange(1, 3)).toBe(9);
    expect(tree.queryRange(2, 2)).toBe(3);
  });

  it('queryRange on single element', () => {
    const arr = [10, 20, 30, 40, 50];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 0)).toBe(10);
    expect(tree.queryRange(4, 4)).toBe(50);
  });

  it('update changes value', () => {
    const arr = [1, 2, 3, 4, 5];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 4)).toBe(15);
    tree.update(2, 10);
    expect(tree.queryRange(0, 4)).toBe(22);
    expect(tree.queryRange(2, 2)).toBe(10);
  });

  it('multiple updates', () => {
    const arr = [1, 1, 1, 1, 1];
    const tree = new SegmentTree(arr);
    tree.update(0, 5);
    tree.update(1, 5);
    tree.update(2, 5);
    expect(tree.queryRange(0, 4)).toBe(17);
  });

  it('queryMin returns minimum in range', () => {
    const arr = [5, 2, 8, 1, 9, 3];
    const tree = new SegmentTree(arr);
    expect(tree.queryMin(0, 5)).toBe(1);
    expect(tree.queryMin(0, 2)).toBe(2);
    expect(tree.queryMin(3, 5)).toBe(1);
  });

  it('queryMin after update', () => {
    const arr = [5, 2, 8, 1, 9];
    const tree = new SegmentTree(arr);
    expect(tree.queryMin(0, 4)).toBe(1);
    tree.update(3, 10);
    expect(tree.queryMin(0, 4)).toBe(2);
  });

  it('queryMax returns maximum in range', () => {
    const arr = [5, 2, 8, 1, 9, 3];
    const tree = new SegmentTree(arr);
    expect(tree.queryMax(0, 5)).toBe(9);
    expect(tree.queryMax(0, 2)).toBe(8);
    expect(tree.queryMax(3, 5)).toBe(9);
  });

  it('queryMax after update', () => {
    const arr = [5, 2, 8, 1, 9];
    const tree = new SegmentTree(arr);
    expect(tree.queryMax(0, 4)).toBe(9);
    tree.update(4, 3);
    expect(tree.queryMax(0, 4)).toBe(8);
  });

  it('works with negative numbers', () => {
    const arr = [-5, -2, -8, -1, -9];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 4)).toBe(-25);
    expect(tree.queryMin(0, 4)).toBe(-9);
    expect(tree.queryMax(0, 4)).toBe(-1);
  });

  it('works with mixed positive and negative', () => {
    const arr = [-3, 5, -2, 8, -1];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 4)).toBe(7);
    expect(tree.queryMin(0, 4)).toBe(-3);
    expect(tree.queryMax(0, 4)).toBe(8);
  });

  it('single element array', () => {
    const tree = new SegmentTree([42]);
    expect(tree.queryRange(0, 0)).toBe(42);
    expect(tree.queryMin(0, 0)).toBe(42);
    expect(tree.queryMax(0, 0)).toBe(42);
    tree.update(0, 100);
    expect(tree.queryRange(0, 0)).toBe(100);
  });

  it('two element array', () => {
    const tree = new SegmentTree([10, 20]);
    expect(tree.queryRange(0, 1)).toBe(30);
    expect(tree.queryMin(0, 1)).toBe(10);
    expect(tree.queryMax(0, 1)).toBe(20);
    tree.update(0, 5);
    expect(tree.queryRange(0, 1)).toBe(25);
    expect(tree.queryMin(0, 1)).toBe(5);
  });

  it('large array', () => {
    const arr = Array.from({ length: 1000 }, (_, i) => i + 1);
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 999)).toBe(500500);
    expect(tree.queryRange(0, 9)).toBe(55);
    expect(tree.queryRange(990, 999)).toBe(9955);
  });

  it('update on large array', () => {
    const arr = Array.from({ length: 100 }, (_, i) => i);
    const tree = new SegmentTree(arr);
    tree.update(50, 1000);
    expect(tree.queryRange(50, 50)).toBe(1000);
    expect(tree.queryRange(0, 99)).toBe(4950 + 1000 - 50);
  });

  it('query entire range', () => {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 7)).toBe(36);
  });

  it('query partial ranges', () => {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 3)).toBe(10);
    expect(tree.queryRange(4, 7)).toBe(26);
    expect(tree.queryRange(2, 5)).toBe(18);
  });

  it('all elements same value', () => {
    const arr = [5, 5, 5, 5, 5];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 4)).toBe(25);
    expect(tree.queryMin(0, 4)).toBe(5);
    expect(tree.queryMax(0, 4)).toBe(5);
  });

  it('zeros in array', () => {
    const arr = [0, 1, 0, 2, 0];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 4)).toBe(3);
    expect(tree.queryMin(0, 4)).toBe(0);
    expect(tree.queryMax(0, 4)).toBe(2);
  });

  it('rangeUpdate adds delta to range', () => {
    const arr = [1, 2, 3, 4, 5];
    const tree = new SegmentTree(arr);
    tree.rangeUpdate(1, 3, 10);
    expect(tree.queryRange(0, 4)).toBe(45);
    expect(tree.queryRange(1, 3)).toBe(39);
  });

  it('rangeUpdate with negative delta', () => {
    const arr = [10, 20, 30, 40, 50];
    const tree = new SegmentTree(arr);
    tree.rangeUpdate(0, 2, -5);
    expect(tree.queryRange(0, 4)).toBe(135);
    expect(tree.queryRange(0, 2)).toBe(45);
  });

  it('multiple rangeUpdates', () => {
    const arr = [1, 1, 1, 1, 1];
    const tree = new SegmentTree(arr);
    tree.rangeUpdate(0, 4, 1);
    tree.rangeUpdate(0, 4, 1);
    expect(tree.queryRange(0, 4)).toBe(15);
  });

  it('rangeUpdate and point update combination', () => {
    const arr = [1, 2, 3, 4, 5];
    const tree = new SegmentTree(arr);
    tree.rangeUpdate(0, 2, 10);
    tree.update(1, 100);
    expect(tree.queryRange(0, 4)).toBe(129);
  });

  it('queryMin after rangeUpdate', () => {
    const arr = [5, 3, 8, 2, 9];
    const tree = new SegmentTree(arr);
    tree.rangeUpdate(0, 4, -3);
    expect(tree.queryMin(0, 4)).toBe(-1);
  });

  it('queryMax after rangeUpdate', () => {
    const arr = [5, 3, 8, 2, 9];
    const tree = new SegmentTree(arr);
    tree.rangeUpdate(0, 4, 10);
    expect(tree.queryMax(0, 4)).toBe(19);
  });

  it('stress test with many operations', () => {
    const arr = Array.from({ length: 100 }, (_, i) => i);
    const tree = new SegmentTree(arr);
    
    for (let i = 0; i < 100; i++) {
      tree.update(i, i * 2);
    }
    
    expect(tree.queryRange(0, 99)).toBe(9900);
    expect(tree.queryMin(0, 99)).toBe(0);
    expect(tree.queryMax(0, 99)).toBe(198);
  });
});

describe('edge cases', () => {
  it('empty array throws or handles gracefully', () => {
    expect(() => new SegmentTree([])).not.toThrow();
  });

  it('query with left > right', () => {
    const arr = [1, 2, 3, 4, 5];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(3, 1)).toBe(0);
  });

  it('query with out of bounds indices', () => {
    const arr = [1, 2, 3];
    const tree = new SegmentTree(arr);
    expect(tree.queryRange(0, 10)).toBe(6);
  });
});
]=],
  },
  {
    name = "Topological Sort",
    difficulty = "medium",
    stub = [=[
/**
 * Topological Sort
 *
 * Implement topological sorting for a directed acyclic graph (DAG).
 *
 * Topological sorting orders vertices such that for every directed edge (u, v),
 * vertex u comes before v in the ordering. This is essential for:
 * - Task scheduling with dependencies
 * - Build system dependency resolution
 * - Course prerequisite ordering
 * - Package dependency installation
 *
 * Implement the TopologicalSorter class with:
 * - constructor() — Initialize an empty graph
 * - addEdge(from: number, to: number): void — Add a directed edge
 * - addNode(node: number): void — Add an isolated node
 * - sort(): number[] | null — Return topological order, or null if cycle detected
 * - hasCycle(): boolean — Check if the graph contains a cycle
 * - clear(): void — Reset the graph to empty state
 *
 * Use Kahn's algorithm (BFS-based) or DFS-based approach.
 * Handle disconnected components and isolated nodes correctly.
 *
 * Bonus: Implement sortWithGroups(): number[][] that groups nodes
 * that can be processed in parallel (same topological level).
 */

export class TopologicalSorter {
  constructor() {
    // YOUR CODE HERE
  }

  addEdge(from: number, to: number): void {
    // YOUR CODE HERE
  }

  addNode(node: number): void {
    // YOUR CODE HERE
  }

  sort(): number[] | null {
    // YOUR CODE HERE
    return null;
  }

  hasCycle(): boolean {
    // YOUR CODE HERE
    return false;
  }

  clear(): void {
    // YOUR CODE HERE
  }

  sortWithGroups(): number[][] | null {
    // YOUR CODE HERE
    return null;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { TopologicalSorter } from './challenge';

describe('TopologicalSorter', () => {
  it('sorts empty graph', () => {
    const sorter = new TopologicalSorter();
    expect(sorter.sort()).toEqual([]);
    expect(sorter.hasCycle()).toBe(false);
  });

  it('sorts single node', () => {
    const sorter = new TopologicalSorter();
    sorter.addNode(1);
    expect(sorter.sort()).toEqual([1]);
  });

  it('sorts two nodes with one edge', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 2);
    const result = sorter.sort();
    expect(result).not.toBeNull();
    expect(result!.indexOf(1)).toBeLessThan(result!.indexOf(2));
  });

  it('sorts linear chain', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 2);
    sorter.addEdge(2, 3);
    sorter.addEdge(3, 4);
    const result = sorter.sort();
    expect(result).toEqual([1, 2, 3, 4]);
  });

  it('detects simple cycle', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 2);
    sorter.addEdge(2, 3);
    sorter.addEdge(3, 1);
    expect(sorter.sort()).toBeNull();
    expect(sorter.hasCycle()).toBe(true);
  });

  it('detects self-loop', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 1);
    expect(sorter.sort()).toBeNull();
    expect(sorter.hasCycle()).toBe(true);
  });

  it('sorts DAG with multiple valid orderings', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 3);
    sorter.addEdge(2, 3);
    const result = sorter.sort();
    expect(result).not.toBeNull();
    expect(result!.indexOf(1)).toBeLessThan(result!.indexOf(3));
    expect(result!.indexOf(2)).toBeLessThan(result!.indexOf(3));
  });

  it('handles disconnected components', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 2);
    sorter.addEdge(3, 4);
    const result = sorter.sort();
    expect(result).not.toBeNull();
    expect(result!.length).toBe(4);
    expect(result!.indexOf(1)).toBeLessThan(result!.indexOf(2));
    expect(result!.indexOf(3)).toBeLessThan(result!.indexOf(4));
  });

  it('handles isolated nodes', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 2);
    sorter.addNode(3);
    sorter.addNode(4);
    const result = sorter.sort();
    expect(result).not.toBeNull();
    expect(result!.length).toBe(4);
    expect(result!.indexOf(1)).toBeLessThan(result!.indexOf(2));
  });

  it('sorts complex DAG', () => {
    const sorter = new TopologicalSorter();
    // Build a more complex DAG
    sorter.addEdge(1, 2);
    sorter.addEdge(1, 3);
    sorter.addEdge(2, 4);
    sorter.addEdge(3, 4);
    sorter.addEdge(4, 5);
    const result = sorter.sort();
    expect(result).not.toBeNull();
    expect(result!.indexOf(1)).toBeLessThan(result!.indexOf(2));
    expect(result!.indexOf(1)).toBeLessThan(result!.indexOf(3));
    expect(result!.indexOf(2)).toBeLessThan(result!.indexOf(4));
    expect(result!.indexOf(3)).toBeLessThan(result!.indexOf(4));
    expect(result!.indexOf(4)).toBeLessThan(result!.indexOf(5));
  });

  it('clear resets graph', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 2);
    sorter.clear();
    expect(sorter.sort()).toEqual([]);
    expect(sorter.hasCycle()).toBe(false);
  });

  it('cycle in part of graph detected', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 2);
    sorter.addEdge(2, 3);
    sorter.addEdge(3, 2); // Cycle between 2 and 3
    sorter.addEdge(4, 5); // Separate component
    expect(sorter.sort()).toBeNull();
    expect(sorter.hasCycle()).toBe(true);
  });

  it('large DAG sorts correctly', () => {
    const sorter = new TopologicalSorter();
    // Create a DAG: 1 -> 2 -> 3 -> ... -> 100
    for (let i = 1; i < 100; i++) {
      sorter.addEdge(i, i + 1);
    }
    const result = sorter.sort();
    expect(result).not.toBeNull();
    expect(result!.length).toBe(100);
    for (let i = 0; i < 99; i++) {
      expect(result![i]).toBeLessThan(result![i + 1]);
    }
  });

  it('sortWithGroups returns parallel levels', () => {
    const sorter = new TopologicalSorter();
    // Level 0: 1
    // Level 1: 2, 3 (both depend on 1)
    // Level 2: 4 (depends on 2 and 3)
    sorter.addEdge(1, 2);
    sorter.addEdge(1, 3);
    sorter.addEdge(2, 4);
    sorter.addEdge(3, 4);
    const groups = sorter.sortWithGroups();
    expect(groups).not.toBeNull();
    expect(groups!.length).toBe(3);
    expect(groups![0]).toEqual([1]);
    expect(groups![1].sort((a, b) => a - b)).toEqual([2, 3]);
    expect(groups![2]).toEqual([4]);
  });

  it('sortWithGroups detects cycle', () => {
    const sorter = new TopologicalSorter();
    sorter.addEdge(1, 2);
    sorter.addEdge(2, 1);
    expect(sorter.sortWithGroups()).toBeNull();
  });

  it('stress test with many nodes', () => {
    const sorter = new TopologicalSorter();
    const n = 500;
    // Create a DAG with random edges (no cycles)
    for (let i = 1; i <= n; i++) {
      sorter.addNode(i);
      // Add edges only to higher-numbered nodes to avoid cycles
      for (let j = i + 1; j <= n && j < i + 5; j++) {
        if (Math.random() > 0.5) {
          sorter.addEdge(i, j);
        }
      }
    }
    const result = sorter.sort();
    expect(result).not.toBeNull();
    expect(result!.length).toBe(n);
    // Verify all edges are respected
    // (simplified check - just ensure no duplicates)
    const unique = new Set(result!);
    expect(unique.size).toBe(n);
  });
});
]=],
  },
  {
    name = "Dijkstra's Shortest Path",
    difficulty = "hard",
    stub = [=[
/**
 * Dijkstra's Shortest Path
 *
 * Implement Dijkstra's algorithm for finding the shortest path in a weighted graph.
 *
 * Dijkstra's algorithm finds the shortest path from a source node to all other
 * nodes in a graph with non-negative edge weights. It's fundamental for:
 * - GPS navigation and routing
 * - Network routing protocols
 * - Social network analysis
 * - Game pathfinding
 *
 * Implement the Graph class with:
 * - constructor(numNodes: number) — Initialize graph with n nodes (0 to n-1)
 * - addEdge(from: number, to: number, weight: number): void — Add directed edge
 * - addUndirectedEdge(a: number, b: number, weight: number): void — Add bidirectional edge
 * - dijkstra(source: number): number[] — Return array of shortest distances from source
 *   to all nodes. Use Infinity for unreachable nodes.
 * - shortestPath(source: number, target: number): number[] — Return the actual path
 *   (array of node indices) from source to target. Empty array if no path exists.
 * - getPathDistance(path: number[]): number — Calculate total distance of a given path
 *
 * Requirements:
 * - Use a min-heap/priority queue for O((V + E) log V) complexity
 * - Handle disconnected graphs (return Infinity for unreachable nodes)
 * - Handle graphs with single nodes
 * - Validate node indices are in valid range
 *
 * Bonus: Implement dijkstraWithEarlyStop(source: number, target: number): number
 * that stops as soon as the target is reached (more efficient for single-target queries).
 */

export class Graph {
  constructor(numNodes: number) {
    // YOUR CODE HERE
  }

  addEdge(from: number, to: number, weight: number): void {
    // YOUR CODE HERE
  }

  addUndirectedEdge(a: number, b: number, weight: number): void {
    // YOUR CODE HERE
  }

  dijkstra(source: number): number[] {
    // YOUR CODE HERE
    return [];
  }

  shortestPath(source: number, target: number): number[] {
    // YOUR CODE HERE
    return [];
  }

  getPathDistance(path: number[]): number {
    // YOUR CODE HERE
    return 0;
  }

  dijkstraWithEarlyStop(source: number, target: number): number {
    // YOUR CODE HERE
    return -1;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { Graph } from './challenge';

describe('Graph', () => {
  it('creates empty graph', () => {
    const graph = new Graph(5);
    expect(graph.dijkstra(0)).toEqual([0, Infinity, Infinity, Infinity, Infinity]);
  });

  it('single node graph', () => {
    const graph = new Graph(1);
    expect(graph.dijkstra(0)).toEqual([0]);
    expect(graph.shortestPath(0, 0)).toEqual([0]);
  });

  it('simple linear graph', () => {
    const graph = new Graph(4);
    graph.addEdge(0, 1, 5);
    graph.addEdge(1, 2, 3);
    graph.addEdge(2, 3, 1);
    
    expect(graph.dijkstra(0)).toEqual([0, 5, 8, 9]);
    expect(graph.shortestPath(0, 3)).toEqual([0, 1, 2, 3]);
  });

  it('graph with multiple paths', () => {
    const graph = new Graph(4);
    graph.addEdge(0, 1, 10);
    graph.addEdge(0, 2, 5);
    graph.addEdge(1, 2, 2);
    graph.addEdge(1, 3, 1);
    graph.addEdge(2, 1, 3);
    graph.addEdge(2, 3, 9);
    
    // Shortest: 0->2->1->3 = 5+3+1 = 9
    expect(graph.dijkstra(0)).toEqual([0, 8, 5, 9]);
    expect(graph.shortestPath(0, 3)).toEqual([0, 2, 1, 3]);
  });

  it('disconnected graph', () => {
    const graph = new Graph(4);
    graph.addEdge(0, 1, 5);
    graph.addEdge(2, 3, 10);
    
    expect(graph.dijkstra(0)).toEqual([0, 5, Infinity, Infinity]);
    expect(graph.shortestPath(0, 3)).toEqual([]);
  });

  it('undirected edges', () => {
    const graph = new Graph(3);
    graph.addUndirectedEdge(0, 1, 4);
    graph.addUndirectedEdge(1, 2, 3);
    
    expect(graph.dijkstra(0)).toEqual([0, 4, 7]);
    expect(graph.dijkstra(2)).toEqual([7, 3, 0]);
  });

  it('shortestPath returns empty for unreachable', () => {
    const graph = new Graph(3);
    graph.addEdge(0, 1, 5);
    expect(graph.shortestPath(0, 2)).toEqual([]);
    expect(graph.shortestPath(2, 0)).toEqual([]);
  });

  it('shortestPath with same source and target', () => {
    const graph = new Graph(3);
    graph.addEdge(0, 1, 5);
    expect(graph.shortestPath(1, 1)).toEqual([1]);
  });

  it('getPathDistance calculates correctly', () => {
    const graph = new Graph(4);
    graph.addEdge(0, 1, 5);
    graph.addEdge(1, 2, 3);
    graph.addEdge(2, 3, 1);
    
    expect(graph.getPathDistance([0, 1, 2, 3])).toBe(9);
    expect(graph.getPathDistance([0, 1])).toBe(5);
    expect(graph.getPathDistance([0])).toBe(0);
  });

  it('getPathDistance with invalid path', () => {
    const graph = new Graph(3);
    graph.addEdge(0, 1, 5);
    expect(graph.getPathDistance([0, 2])).toBe(Infinity);
  });

  it('dijkstraWithEarlyStop returns correct distance', () => {
    const graph = new Graph(4);
    graph.addEdge(0, 1, 10);
    graph.addEdge(0, 2, 5);
    graph.addEdge(2, 1, 3);
    graph.addEdge(1, 3, 1);
    
    expect(graph.dijkstraWithEarlyStop(0, 3)).toBe(9);
    expect(graph.dijkstraWithEarlyStop(0, 2)).toBe(5);
  });

  it('dijkstraWithEarlyStop for unreachable target', () => {
    const graph = new Graph(3);
    graph.addEdge(0, 1, 5);
    expect(graph.dijkstraWithEarlyStop(0, 2)).toBe(-1);
  });

  it('graph with zero weight edges', () => {
    const graph = new Graph(3);
    graph.addEdge(0, 1, 0);
    graph.addEdge(1, 2, 0);
    
    expect(graph.dijkstra(0)).toEqual([0, 0, 0]);
  });

  it('graph with large weights', () => {
    const graph = new Graph(3);
    graph.addEdge(0, 1, 1000000);
    graph.addEdge(1, 2, 999999);
    
    expect(graph.dijkstra(0)).toEqual([0, 1000000, 1999999]);
  });

  it('complete graph', () => {
    const graph = new Graph(4);
    // All pairs connected
    for (let i = 0; i < 4; i++) {
      for (let j = 0; j < 4; j++) {
        if (i !== j) {
          graph.addEdge(i, j, i + j + 1);
        }
      }
    }
    
    const distances = graph.dijkstra(0);
    expect(distances[0]).toBe(0);
    expect(distances[1]).toBe(2); // direct 0->1 = 1
    expect(distances[2]).toBe(3); // direct 0->2 = 3
    expect(distances[3]).toBe(4); // direct 0->3 = 4
  });

  it('cycle in graph', () => {
    const graph = new Graph(3);
    graph.addEdge(0, 1, 1);
    graph.addEdge(1, 2, 1);
    graph.addEdge(2, 0, 1);
    
    expect(graph.dijkstra(0)).toEqual([0, 1, 2]);
  });

  it('self-loop does not affect shortest path', () => {
    const graph = new Graph(3);
    graph.addEdge(0, 0, 5); // self-loop
    graph.addEdge(0, 1, 3);
    graph.addEdge(1, 2, 2);
    
    expect(graph.dijkstra(0)).toEqual([0, 3, 5]);
  });

  it('multiple edges between same nodes (uses first added)', () => {
    const graph = new Graph(2);
    graph.addEdge(0, 1, 10);
    graph.addEdge(0, 1, 1); // This creates parallel edge
    
    // Dijkstra should find the shortest
    expect(graph.dijkstra(0)).toEqual([0, 1]);
  });

  it('stress test with larger graph', () => {
    const graph = new Graph(100);
    // Create a line graph
    for (let i = 0; i < 99; i++) {
      graph.addEdge(i, i + 1, 1);
    }
    
    const distances = graph.dijkstra(0);
    expect(distances[0]).toBe(0);
    expect(distances[99]).toBe(99);
    expect(distances[50]).toBe(50);
  });

  it('path reconstruction accuracy', () => {
    const graph = new Graph(6);
    graph.addEdge(0, 1, 7);
    graph.addEdge(0, 2, 9);
    graph.addEdge(0, 5, 14);
    graph.addEdge(1, 2, 10);
    graph.addEdge(1, 3, 15);
    graph.addEdge(2, 3, 11);
    graph.addEdge(2, 5, 2);
    graph.addEdge(3, 4, 6);
    graph.addEdge(4, 5, 9);
    
    const path = graph.shortestPath(0, 4);
    expect(path[0]).toBe(0);
    expect(path[path.length - 1]).toBe(4);
    expect(graph.getPathDistance(path)).toBe(graph.dijkstra(0)[4]);
  });
});

describe('edge cases', () => {
  it('invalid source node', () => {
    const graph = new Graph(3);
    expect(graph.dijkstra(5)).toEqual([]);
    expect(graph.dijkstra(-1)).toEqual([]);
  });

  it('invalid target in shortestPath', () => {
    const graph = new Graph(3);
    expect(graph.shortestPath(0, 10)).toEqual([]);
  });

  it('empty path distance', () => {
    const graph = new Graph(3);
    expect(graph.getPathDistance([])).toBe(0);
  });
});
]=],
  },
  {
    name = "Trie (Prefix Tree)",
    difficulty = "medium",
    stub = [=[
/**
 * Trie (Prefix Tree)
 *
 * Implement a Trie data structure for efficient string storage and retrieval.
 *
 * A Trie is a tree-like structure where each node represents a character,
 * and paths from root to nodes form strings. Commonly used for:
 * - Autocomplete systems
 * - Spell checkers
 * - IP routing tables
 * - Dictionary implementations
 *
 * Implement the Trie class with:
 * - constructor() — Initialize an empty trie
 * - insert(word: string): void — Insert a word into the trie
 * - search(word: string): boolean — Return true if word exists in trie
 * - startsWith(prefix: string): boolean — Return true if any word starts with prefix
 * - delete(word: string): boolean — Remove a word, return true if found
 * - countWords(): number — Return total number of words stored
 * - countPrefixes(prefix: string): number — Count words with given prefix
 * - findWithPrefix(prefix: string, limit?: number): string[] — Find all words
 *   with given prefix, optionally limited to N results
 * - longestCommonPrefix(): string — Find longest common prefix of all words
 * - autoComplete(prefix: string, limit?: number): string[] — Get autocomplete
 *   suggestions (words with prefix, sorted alphabetically)
 *
 * Each node should track:
 * - children: Map<char, TrieNode>
 * - isEndOfWord: boolean
 * - (optional) wordCount: number for subtree counting
 */

export class Trie {
  constructor() {
    // YOUR CODE HERE
  }

  insert(word: string): void {
    // YOUR CODE HERE
  }

  search(word: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  startsWith(prefix: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  delete(word: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  countWords(): number {
    // YOUR CODE HERE
    return 0;
  }

  countPrefixes(prefix: string): number {
    // YOUR CODE HERE
    return 0;
  }

  findWithPrefix(prefix: string, limit?: number): string[] {
    // YOUR CODE HERE
    return [];
  }

  longestCommonPrefix(): string {
    // YOUR CODE HERE
    return "";
  }

  autoComplete(prefix: string, limit?: number): string[] {
    // YOUR CODE HERE
    return [];
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { Trie } from './challenge';

describe('Trie', () => {
  it('creates empty trie', () => {
    const trie = new Trie();
    expect(trie.countWords()).toBe(0);
    expect(trie.search('')).toBe(false);
  });

  it('inserts single word', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.search('hello')).toBe(true);
    expect(trie.countWords()).toBe(1);
  });

  it('inserts multiple words', () => {
    const trie = new Trie();
    trie.insert('cat');
    trie.insert('car');
    trie.insert('dog');
    expect(trie.search('cat')).toBe(true);
    expect(trie.search('car')).toBe(true);
    expect(trie.search('dog')).toBe(true);
    expect(trie.countWords()).toBe(3);
  });

  it('search returns false for non-existent words', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.search('hell')).toBe(false);
    expect(trie.search('helloo')).toBe(false);
    expect(trie.search('world')).toBe(false);
  });

  it('startsWith finds prefixes', () => {
    const trie = new Trie();
    trie.insert('hello');
    trie.insert('world');
    expect(trie.startsWith('hel')).toBe(true);
    expect(trie.startsWith('he')).toBe(true);
    expect(trie.startsWith('h')).toBe(true);
    expect(trie.startsWith('hello')).toBe(true);
    expect(trie.startsWith('wor')).toBe(true);
    expect(trie.startsWith('xyz')).toBe(false);
  });

  it('startsWith vs search distinction', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.startsWith('hell')).toBe(true);
    expect(trie.search('hell')).toBe(false);
    expect(trie.startsWith('hello')).toBe(true);
    expect(trie.search('hello')).toBe(true);
  });

  it('handles common prefixes', () => {
    const trie = new Trie();
    trie.insert('app');
    trie.insert('apple');
    trie.insert('application');
    expect(trie.search('app')).toBe(true);
    expect(trie.search('apple')).toBe(true);
    expect(trie.search('application')).toBe(true);
    expect(trie.startsWith('appl')).toBe(true);
  });

  it('delete existing word', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.delete('hello')).toBe(true);
    expect(trie.search('hello')).toBe(false);
    expect(trie.countWords()).toBe(0);
  });

  it('delete non-existent word', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.delete('world')).toBe(false);
  });

  it('delete preserves shared prefixes', () => {
    const trie = new Trie();
    trie.insert('hello');
    trie.insert('hell');
    expect(trie.delete('hello')).toBe(true);
    expect(trie.search('hello')).toBe(false);
    expect(trie.search('hell')).toBe(true);
  });

  it('countPrefixes counts words with prefix', () => {
    const trie = new Trie();
    trie.insert('cat');
    trie.insert('car');
    trie.insert('card');
    trie.insert('dog');
    expect(trie.countPrefixes('ca')).toBe(3);
    expect(trie.countPrefixes('car')).toBe(2);
    expect(trie.countPrefixes('card')).toBe(1);
    expect(trie.countPrefixes('do')).toBe(1);
    expect(trie.countPrefixes('x')).toBe(0);
  });

  it('findWithPrefix returns matching words', () => {
    const trie = new Trie();
    trie.insert('cat');
    trie.insert('car');
    trie.insert('card');
    trie.insert('dog');
    const results = trie.findWithPrefix('ca');
    expect(results).toHaveLength(3);
    expect(results).toContain('cat');
    expect(results).toContain('car');
    expect(results).toContain('card');
  });

  it('findWithPrefix with limit', () => {
    const trie = new Trie();
    trie.insert('apple');
    trie.insert('apply');
    trie.insert('applied');
    trie.insert('application');
    const results = trie.findWithPrefix('app', 2);
    expect(results.length).toBeLessThanOrEqual(2);
  });

  it('findWithPrefix returns empty for non-existent prefix', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.findWithPrefix('xyz')).toEqual([]);
  });

  it('longestCommonPrefix with single word', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.longestCommonPrefix()).toBe('hello');
  });

  it('longestCommonPrefix with common prefix', () => {
    const trie = new Trie();
    trie.insert('flower');
    trie.insert('flow');
    trie.insert('flight');
    expect(trie.longestCommonPrefix()).toBe('fl');
  });

  it('longestCommonPrefix with no common prefix', () => {
    const trie = new Trie();
    trie.insert('dog');
    trie.insert('racecar');
    trie.insert('car');
    expect(trie.longestCommonPrefix()).toBe('');
  });

  it('longestCommonPrefix on empty trie', () => {
    const trie = new Trie();
    expect(trie.longestCommonPrefix()).toBe('');
  });

  it('autoComplete returns suggestions', () => {
    const trie = new Trie();
    trie.insert('cat');
    trie.insert('car');
    trie.insert('card');
    const suggestions = trie.autoComplete('ca');
    expect(suggestions).toHaveLength(3);
    expect(suggestions).toEqual(['car', 'card', 'cat']); // alphabetically sorted
  });

  it('autoComplete with limit', () => {
    const trie = new Trie();
    ['banana', 'band', 'bandana', 'bandanna', 'bank'].forEach(w => trie.insert(w));
    const suggestions = trie.autoComplete('ban', 3);
    expect(suggestions.length).toBeLessThanOrEqual(3);
  });

  it('handles empty string insert', () => {
    const trie = new Trie();
    trie.insert('');
    expect(trie.search('')).toBe(true);
    expect(trie.countWords()).toBe(1);
  });

  it('handles single character words', () => {
    const trie = new Trie();
    trie.insert('a');
    trie.insert('b');
    trie.insert('c');
    expect(trie.search('a')).toBe(true);
    expect(trie.search('b')).toBe(true);
    expect(trie.startsWith('a')).toBe(true);
  });

  it('stress test with many words', () => {
    const trie = new Trie();
    const words = ['apple', 'application', 'apply', 'banana', 'band', 'bandana',
      'cat', 'car', 'card', 'dog', 'door', 'double', 'download'];
    words.forEach(w => trie.insert(w));
    expect(trie.countWords()).toBe(words.length);
    words.forEach(w => expect(trie.search(w)).toBe(true));
  });

  it('delete then re-insert', () => {
    const trie = new Trie();
    trie.insert('hello');
    trie.delete('hello');
    trie.insert('hello');
    expect(trie.search('hello')).toBe(true);
    expect(trie.countWords()).toBe(1);
  });

  it('case sensitivity', () => {
    const trie = new Trie();
    trie.insert('Hello');
    expect(trie.search('Hello')).toBe(true);
    expect(trie.search('hello')).toBe(false);
    expect(trie.search('HELLO')).toBe(false);
  });

  it('special characters in words', () => {
    const trie = new Trie();
    trie.insert('hello-world');
    trie.insert('test_case');
    expect(trie.search('hello-world')).toBe(true);
    expect(trie.search('test_case')).toBe(true);
  });

  it('very long words', () => {
    const trie = new Trie();
    const longWord = 'a'.repeat(1000);
    trie.insert(longWord);
    expect(trie.search(longWord)).toBe(true);
    expect(trie.startsWith('a'.repeat(500))).toBe(true);
  });

  it('autocomplete returns sorted results', () => {
    const trie = new Trie();
    ['zebra', 'apple', 'ant', 'apricot', 'banana'].forEach(w => trie.insert(w));
    const all = trie.autoComplete('a');
    expect(all).toEqual(all.slice().sort());
  });
});
]=],
  },
  {
    name = "Bloom Filter",
    difficulty = "medium",
    stub = [=[
/**
 * Bloom Filter
 *
 * Implement a space-efficient probabilistic data structure for membership testing.
 *
 * A Bloom filter can tell you definitively if an element is NOT in a set,
 * or probably if an element IS in the set. False positives are possible,
 * but false negatives are not.
 *
 * Use cases:
 * - Web crawlers checking if a URL has been visited
 * - Databases checking if a key exists before disk lookup
 * - Spell checkers with large dictionaries
 * - Network routers filtering malicious IPs
 *
 * Implement the BloomFilter class with:
 * - constructor(expectedItems: number, falsePositiveRate?: number)
 *   Initialize with expected number of items and optional false positive rate (default 0.01)
 * - add(item: string): void — Add an item to the filter
 * - has(item: string): boolean — Check if item might be in the set
 * - size(): number — Return the number of items added (approximate)
 * - estimatedFalsePositiveRate(): number — Return current estimated FPR based on fill
 *
 * The filter should automatically calculate:
 * - Optimal bit array size: m = -(n * ln(p)) / (ln(2)^2)
 * - Optimal number of hash functions: k = (m/n) * ln(2)
 *
 * Use multiple hash functions by combining two base hashes:
 * h_i(x) = h1(x) + i * h2(x) for i = 0 to k-1
 *
 * Bonus: Implement a counting bloom filter that supports deletion:
 * - remove(item: string): boolean — Remove an item (may cause false negatives)
 */

export class BloomFilter {
  constructor(expectedItems: number, falsePositiveRate: number = 0.01) {
    // YOUR CODE HERE
  }

  add(item: string): void {
    // YOUR CODE HERE
  }

  has(item: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }

  estimatedFalsePositiveRate(): number {
    // YOUR CODE HERE
    return 0;
  }

  remove(item: string): boolean {
    // YOUR CODE HERE
    return false;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { BloomFilter } from './challenge';

describe('BloomFilter', () => {
  it('creates filter with default FPR', () => {
    const filter = new BloomFilter(100);
    expect(filter.size()).toBe(0);
  });

  it('add and has work for single item', () => {
    const filter = new BloomFilter(100);
    filter.add('hello');
    expect(filter.has('hello')).toBe(true);
  });

  it('has returns false for never-added item', () => {
    const filter = new BloomFilter(100);
    expect(filter.has('notadded')).toBe(false);
  });

  it('multiple items all return true', () => {
    const filter = new BloomFilter(100);
    const items = ['apple', 'banana', 'cherry', 'date', 'elderberry'];
    items.forEach(item => filter.add(item));
    items.forEach(item => expect(filter.has(item)).toBe(true));
  });

  it('size tracks number of additions', () => {
    const filter = new BloomFilter(100);
    expect(filter.size()).toBe(0);
    filter.add('one');
    expect(filter.size()).toBe(1);
    filter.add('two');
    expect(filter.size()).toBe(2);
    filter.add('three');
    expect(filter.size()).toBe(3);
  });

  it('no false negatives', () => {
    const filter = new BloomFilter(1000);
    const items = Array.from({ length: 100 }, (_, i) => `item${i}`);
    items.forEach(item => filter.add(item));
    // All added items must return true (no false negatives)
    items.forEach(item => expect(filter.has(item)).toBe(true));
  });

  it('false positive rate is reasonable', () => {
    const filter = new BloomFilter(100, 0.01);
    const items = Array.from({ length: 100 }, (_, i) => `item${i}`);
    items.forEach(item => filter.add(item));
    
    // Test 1000 non-added items
    let falsePositives = 0;
    for (let i = 0; i < 1000; i++) {
      if (filter.has(`notreal${i}`)) {
        falsePositives++;
      }
    }
    
    // FPR should be roughly around 1% (allow 0.5% to 3% for statistical variance)
    const observedFPR = falsePositives / 1000;
    expect(observedFPR).toBeLessThan(0.05); // Lenient upper bound
  });

  it('estimatedFalsePositiveRate increases with fill', () => {
    const filter = new BloomFilter(100, 0.01);
    const initialFPR = filter.estimatedFalsePositiveRate();
    
    for (let i = 0; i < 50; i++) {
      filter.add(`item${i}`);
    }
    
    const laterFPR = filter.estimatedFalsePositiveRate();
    expect(laterFPR).toBeGreaterThan(initialFPR);
  });

  it('handles empty strings', () => {
    const filter = new BloomFilter(100);
    filter.add('');
    expect(filter.has('')).toBe(true);
    expect(filter.has('nonempty')).toBe(false);
  });

  it('handles unicode strings', () => {
    const filter = new BloomFilter(100);
    const unicode = ['你好', '世界', '🚀', 'émojis', '日本語'];
    unicode.forEach(item => filter.add(item));
    unicode.forEach(item => expect(filter.has(item)).toBe(true));
    expect(filter.has('notunicode')).toBe(false);
  });

  it('handles very long strings', () => {
    const filter = new BloomFilter(100);
    const longString = 'a'.repeat(10000);
    filter.add(longString);
    expect(filter.has(longString)).toBe(true);
  });

  it('different filters are independent', () => {
    const filter1 = new BloomFilter(100);
    const filter2 = new BloomFilter(100);
    
    filter1.add('only-in-filter1');
    filter2.add('only-in-filter2');
    
    expect(filter1.has('only-in-filter1')).toBe(true);
    expect(filter1.has('only-in-filter2')).toBe(false);
    expect(filter2.has('only-in-filter1')).toBe(false);
    expect(filter2.has('only-in-filter2')).toBe(true);
  });

  it('custom FPR affects bit array size', () => {
    const filter1 = new BloomFilter(100, 0.001); // Lower FPR = larger array
    const filter2 = new BloomFilter(100, 0.1);   // Higher FPR = smaller array
    
    // Both should work correctly
    filter1.add('test');
    filter2.add('test');
    expect(filter1.has('test')).toBe(true);
    expect(filter2.has('test')).toBe(true);
  });

  it('remove works for counting bloom filter', () => {
    const filter = new BloomFilter(100);
    filter.add('to-remove');
    expect(filter.has('to-remove')).toBe(true);
    
    const removed = filter.remove('to-remove');
    // Remove may or may not be supported; if supported, should return true
    if (removed) {
      expect(filter.has('to-remove')).toBe(false);
    }
  });

  it('remove returns false for non-existent item', () => {
    const filter = new BloomFilter(100);
    expect(filter.remove('never-added')).toBe(false);
  });

  it('stress test with many items', () => {
    const filter = new BloomFilter(1000, 0.01);
    const items = Array.from({ length: 1000 }, (_, i) => `stress-item-${i}`);
    
    items.forEach(item => filter.add(item));
    
    // All should be present (no false negatives)
    items.forEach(item => expect(filter.has(item)).toBe(true));
    
    expect(filter.size()).toBe(1000);
  });

  it('hash distribution is reasonable', () => {
    const filter = new BloomFilter(10000);
    for (let i = 0; i < 1000; i++) {
      filter.add(`item${i}`);
    }
    
    // After adding 1000 items to a filter sized for 10000,
    // FPR should still be very low
    expect(filter.estimatedFalsePositiveRate()).toBeLessThan(0.001);
  });

  it('handles special characters', () => {
    const filter = new BloomFilter(100);
    const special = ['hello\nworld', 'tab\there', 'null\u0000byte', 'emoji🎉test'];
    special.forEach(item => filter.add(item));
    special.forEach(item => expect(filter.has(item)).toBe(true));
  });

  it('case sensitivity', () => {
    const filter = new BloomFilter(100);
    filter.add('Hello');
    expect(filter.has('Hello')).toBe(true);
    // Different hash for different case
    expect(filter.has('hello')).toBe(false);
    expect(filter.has('HELLO')).toBe(false);
  });
});
]=],
  },
  {
    name = "Fenwick Tree",
    difficulty = "medium",
    stub = [=[
/**
 * Fenwick Tree (Binary Indexed Tree)
 *
 * Implement a Fenwick Tree for efficient prefix sum queries and point updates.
 *
 * A Fenwick Tree is a data structure that provides O(log n) prefix sum queries
 * and O(log n) point updates on an array. It is more space-efficient than a
 * Segment Tree and often faster in practice due to better cache locality.
 *
 * Common use cases:
 * - Cumulative frequency tables
 * - Range sum queries on mutable arrays
 * - Counting inversions
 * - 2D range sums (with 2D Fenwick Tree)
 *
 * Implement the FenwickTree class with:
 * - constructor(size: number) — Initialize a tree for indices 0..size-1
 * - update(index: number, delta: number): void — Add delta to element at index
 * - query(index: number): number — Return prefix sum from index 0 to index (inclusive)
 * - queryRange(l: number, r: number): number — Return sum from index l to r (inclusive)
 * - set(index: number, value: number): void — Set element at index to value
 *
 * The internal array is 1-indexed (standard Fenwick implementation).
 * External API should be 0-indexed for consistency.
 *
 * Constraints: 1 <= size <= 100000
 *
 * Bonus: Implement a 2D Fenwick Tree for matrix range sum queries.
 */

export class FenwickTree {
  constructor(size: number) {
    // YOUR CODE HERE
  }

  update(index: number, delta: number): void {
    // YOUR CODE HERE
  }

  query(index: number): number {
    // YOUR CODE HERE
    return 0;
  }

  queryRange(l: number, r: number): number {
    // YOUR CODE HERE
    return 0;
  }

  set(index: number, value: number): void {
    // YOUR CODE HERE
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { FenwickTree } from './challenge';

describe('FenwickTree', () => {
  it('creates empty tree', () => {
    const ft = new FenwickTree(5);
    expect(ft.query(0)).toBe(0);
    expect(ft.query(4)).toBe(0);
  });

  it('update and query single element', () => {
    const ft = new FenwickTree(5);
    ft.update(2, 10);
    expect(ft.query(2)).toBe(10);
    expect(ft.query(1)).toBe(0);
    expect(ft.query(4)).toBe(10);
  });

  it('multiple updates accumulate', () => {
    const ft = new FenwickTree(10);
    ft.update(0, 5);
    ft.update(3, 7);
    ft.update(7, 2);
    expect(ft.query(0)).toBe(5);
    expect(ft.query(3)).toBe(12);
    expect(ft.query(6)).toBe(12);
    expect(ft.query(7)).toBe(14);
    expect(ft.query(9)).toBe(14);
  });

  it('queryRange returns correct sum', () => {
    const ft = new FenwickTree(10);
    for (let i = 0; i < 10; i++) {
      ft.update(i, i + 1);
    }
    expect(ft.queryRange(0, 9)).toBe(55);
    expect(ft.queryRange(2, 5)).toBe(3 + 4 + 5 + 6);
    expect(ft.queryRange(0, 0)).toBe(1);
    expect(ft.queryRange(9, 9)).toBe(10);
  });

  it('set replaces value', () => {
    const ft = new FenwickTree(5);
    ft.update(2, 10);
    expect(ft.query(2)).toBe(10);
    ft.set(2, 20);
    expect(ft.query(2)).toBe(20);
    expect(ft.queryRange(0, 4)).toBe(20);
  });

  it('negative values', () => {
    const ft = new FenwickTree(5);
    ft.update(0, 10);
    ft.update(1, -3);
    ft.update(2, 7);
    expect(ft.query(2)).toBe(14);
    expect(ft.query(1)).toBe(7);
  });

  it('update with negative delta', () => {
    const ft = new FenwickTree(5);
    ft.update(2, 10);
    expect(ft.query(2)).toBe(10);
    ft.update(2, -4);
    expect(ft.query(2)).toBe(6);
  });

  it('large array', () => {
    const ft = new FenwickTree(1000);
    for (let i = 0; i < 1000; i++) {
      ft.update(i, i + 1);
    }
    expect(ft.query(999)).toBe(1000 * 1001 / 2);
    expect(ft.queryRange(0, 999)).toBe(1000 * 1001 / 2);
  });

  it('single element tree', () => {
    const ft = new FenwickTree(1);
    ft.update(0, 42);
    expect(ft.query(0)).toBe(42);
    expect(ft.queryRange(0, 0)).toBe(42);
  });

  it('set to zero', () => {
    const ft = new FenwickTree(5);
    ft.update(2, 10);
    ft.set(2, 0);
    expect(ft.queryRange(0, 4)).toBe(0);
  });

  it('interleaved operations', () => {
    const ft = new FenwickTree(10);
    ft.update(0, 1);
    expect(ft.queryRange(0, 0)).toBe(1);
    ft.update(5, 5);
    expect(ft.queryRange(0, 5)).toBe(6);
    ft.set(0, 10);
    expect(ft.queryRange(0, 5)).toBe(15);
    ft.update(3, -2);
    expect(ft.queryRange(0, 5)).toBe(13);
  });

  it('stress test', () => {
    const ft = new FenwickTree(10000);
    for (let i = 0; i < 10000; i++) {
      ft.update(i, 1);
    }
    expect(ft.query(9999)).toBe(10000);
    expect(ft.queryRange(5000, 9999)).toBe(5000);

    ft.set(0, 100);
    expect(ft.query(9999)).toBe(10099);
  });

  it('edge: query before any update', () => {
    const ft = new FenwickTree(100);
    for (let i = 0; i < 100; i++) {
      expect(ft.query(i)).toBe(0);
    }
  });

  it('powers of 2 indices', () => {
    const ft = new FenwickTree(16);
    ft.update(0, 1);
    ft.update(1, 2);
    ft.update(3, 4);
    ft.update(7, 8);
    ft.update(15, 16);
    expect(ft.query(15)).toBe(31);
  });

  it('repeated updates same index', () => {
    const ft = new FenwickTree(5);
    for (let i = 0; i < 100; i++) {
      ft.update(2, 1);
    }
    expect(ft.query(2)).toBe(100);
    expect(ft.query(4)).toBe(100);
  });
});
]=],
  },
  {
    name = "Expression Evaluator",
    difficulty = "medium",
    stub = [=[
/**
 * Expression Evaluator
 *
 * Implement an arithmetic expression evaluator that handles +, -, *, /,
 * parentheses, and operator precedence.
 *
 * The evaluator should process infix notation with the standard precedence rules:
 * - Parentheses have highest precedence
 * - * and / have higher precedence than + and -
 * - Operators of equal precedence are evaluated left-to-right
 * - Division should perform integer division (truncate toward zero)
 * - Whitespace should be ignored
 *
 * Examples:
 *   evaluate("3 + 4 * 2") → 11
 *   evaluate("(3 + 4) * 2") → 14
 *   evaluate("10 / 3") → 3
 *   evaluate("2 * (3 + 4) - 1") → 13
 *   evaluate("-5 + 3") → -2
 *
 * Implement the ExpressionEvaluator class:
 * - constructor()
 * - evaluate(expression: string): number
 *
 * Constraints:
 * - Operands are integers (may be negative)
 * - Expression is always valid (no error handling required)
 * - Numbers: -2^31 to 2^31 - 1
 */

export class ExpressionEvaluator {
  evaluate(expression: string): number {
    // YOUR CODE HERE
    return 0;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { ExpressionEvaluator } from './challenge';

describe('ExpressionEvaluator', () => {
  it('simple addition', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('3 + 4')).toBe(7);
  });

  it('simple multiplication', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('3 * 4')).toBe(12);
  });

  it('operator precedence: multiply before add', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('3 + 4 * 2')).toBe(11);
  });

  it('parentheses override precedence', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('(3 + 4) * 2')).toBe(14);
  });

  it('integer division truncates toward zero', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('10 / 3')).toBe(3);
    expect(ev.evaluate('-10 / 3')).toBe(-3);
  });

  it('mixed operations', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('2 * 3 + 4 * 5')).toBe(26);
  });

  it('nested parentheses', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('(2 + (3 * 4)) - 1')).toBe(13);
  });

  it('single number', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('42')).toBe(42);
  });

  it('negative leading number', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('-5 + 3')).toBe(-2);
  });

  it('whitespace handling', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('  1  +  2  *  3  ')).toBe(7);
  });

  it('deeply nested expression', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('(((2 + 3) * 4) - 1) / 2')).toBe(9);
  });

  it('division by one', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('100 / 1')).toBe(100);
  });

  it('multiple divisions', () => {
    const ev = new ExpressionEvaluator();
    expect(ev.evaluate('100 / 2 / 5')).toBe(10);
  });
});
]=],
  },
  {
    name = "Segment Tree",
    difficulty = "medium",
    stub = [=[
/**
 * Segment Tree
 *
 * Implement a segment tree for efficient range queries on arrays.
 *
 * A segment tree is a binary tree where each node represents a range
 * of indices in the original array. It enables O(log n) range queries
 * and point updates, making it ideal for:
 * - Range sum/min/max queries
 * - Real-time analytics dashboards
 * - Competitive programming
 *
 * Implement the SegmentTree class with:
 * - constructor(arr: number[]) — Build the tree from an array
 * - query(left: number, right: number): number — Range sum query
 * - update(index: number, value: number): void — Update a single element
 * - rangeMin(left: number, right: number): number — Range minimum query
 * - rangeMax(left: number, right: number): number — Range maximum query
 *
 * Bonus: Support range updates with lazy propagation.
 */

export class SegmentTree {
  constructor(arr: number[]) {
    // YOUR CODE HERE
  }

  query(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }

  update(index: number, value: number): void {
    // YOUR CODE HERE
  }

  rangeMin(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }

  rangeMax(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { SegmentTree } from './challenge';

describe('SegmentTree', () => {
  it('creates tree from single element', () => {
    const tree = new SegmentTree([5]);
    expect(tree.query(0, 0)).toBe(5);
  });

  it('creates tree from multiple elements', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 4)).toBe(15);
    expect(tree.query(1, 3)).toBe(9);
  });

  it('query single element', () => {
    const tree = new SegmentTree([10, 20, 30]);
    expect(tree.query(0, 0)).toBe(10);
    expect(tree.query(1, 1)).toBe(20);
    expect(tree.query(2, 2)).toBe(30);
  });

  it('query full range', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5, 6, 7, 8]);
    expect(tree.query(0, 7)).toBe(36);
  });

  it('query partial ranges', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5, 6, 7, 8]);
    expect(tree.query(2, 5)).toBe(18);
    expect(tree.query(0, 2)).toBe(6);
    expect(tree.query(5, 7)).toBe(21);
  });

  it('update single element', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    tree.update(2, 10);
    expect(tree.query(0, 4)).toBe(22);
    expect(tree.query(2, 2)).toBe(10);
  });

  it('update multiple elements', () => {
    const tree = new SegmentTree([1, 1, 1, 1, 1]);
    tree.update(0, 10);
    tree.update(4, 10);
    expect(tree.query(0, 4)).toBe(23);
  });

  it('update and query alternating', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 4)).toBe(15);
    tree.update(0, 100);
    expect(tree.query(0, 4)).toBe(114);
    tree.update(4, 100);
    expect(tree.query(0, 4)).toBe(213);
  });

  it('rangeMin returns minimum', () => {
    const tree = new SegmentTree([5, 2, 8, 1, 9, 3]);
    expect(tree.rangeMin(0, 5)).toBe(1);
    expect(tree.rangeMin(1, 3)).toBe(1);
    expect(tree.rangeMin(0, 1)).toBe(2);
  });

  it('rangeMin after update', () => {
    const tree = new SegmentTree([5, 2, 8, 1, 9]);
    expect(tree.rangeMin(0, 4)).toBe(1);
    tree.update(3, 100);
    expect(tree.rangeMin(0, 4)).toBe(2);
  });

  it('rangeMax returns maximum', () => {
    const tree = new SegmentTree([5, 2, 8, 1, 9, 3]);
    expect(tree.rangeMax(0, 5)).toBe(9);
    expect(tree.rangeMax(0, 2)).toBe(8);
    expect(tree.rangeMax(3, 5)).toBe(9);
  });

  it('rangeMax after update', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.rangeMax(0, 4)).toBe(5);
    tree.update(0, 100);
    expect(tree.rangeMax(0, 4)).toBe(100);
  });

  it('handles negative values', () => {
    const tree = new SegmentTree([-5, -10, -3, -7, -1]);
    expect(tree.query(0, 4)).toBe(-26);
    expect(tree.rangeMin(0, 4)).toBe(-10);
    expect(tree.rangeMax(0, 4)).toBe(-1);
  });

  it('handles zeros', () => {
    const tree = new SegmentTree([0, 0, 0, 0]);
    expect(tree.query(0, 3)).toBe(0);
    expect(tree.rangeMin(0, 3)).toBe(0);
    expect(tree.rangeMax(0, 3)).toBe(0);
  });

  it('stress test with many updates', () => {
    const arr = Array.from({ length: 100 }, (_, i) => i + 1);
    const tree = new SegmentTree(arr);
    
    expect(tree.query(0, 99)).toBe(5050);
    
    for (let i = 0; i < 100; i += 2) {
      tree.update(i, 0);
    }
    
    expect(tree.query(0, 99)).toBe(2500);
  });

  it('large array performance', () => {
    const arr = Array.from({ length: 10000 }, (_, i) => i + 1);
    const tree = new SegmentTree(arr);
    expect(tree.query(0, 9999)).toBe(50005000);
    tree.update(5000, 100000);
    expect(tree.query(0, 9999)).toBe(50050000);
  });
});

describe('edge cases', () => {
  it('empty array', () => {
    const tree = new SegmentTree([]);
    expect(tree.query(0, 0)).toBe(0);
  });

  it('out of bounds query returns 0', () => {
    const tree = new SegmentTree([1, 2, 3]);
    expect(tree.query(10, 20)).toBe(0);
  });
});
]=],
  },
  {
    name = "Doubly Linked List",
    difficulty = "easy",
    stub = [==[
/**
 * Doubly Linked List
 *
 * Implement a doubly linked list with forward and backward traversal.
 *
 * A doubly linked list is a linear data structure where each node contains:
 * - A value
 * - A pointer to the next node
 * - A pointer to the previous node
 *
 * This enables O(1) insertion/deletion at both ends and O(n) traversal
 * in either direction.
 *
 * Implement the DoublyLinkedList class with:
 * - constructor() — Initialize an empty list
 * - append(value: any): void — Add a value to the end (O(1))
 * - prepend(value: any): void — Add a value to the beginning (O(1))
 * - insertAt(index: number, value: any): boolean — Insert at index (O(n))
 * - deleteAt(index: number): any | null — Remove and return value at index (O(n))
 * - deleteValue(value: any): boolean — Remove first occurrence of value (O(n))
 * - get(index: number): any | null — Get value at index (O(n))
 * - set(index: number, value: any): boolean — Update value at index (O(n))
 * - indexOf(value: any): number — Find first index of value, -1 if not found (O(n))
 * - contains(value: any): boolean — Check if value exists (O(n))
 * - size(): number — Return the number of elements (O(1))
 * - isEmpty(): boolean — Check if list is empty (O(1))
 * - clear(): void — Remove all elements (O(1))
 * - toArray(): any[] — Convert to array (forward order) (O(n))
 * - toArrayReverse(): any[] — Convert to array (reverse order) (O(n))
 * - headValue(): any | null — Get head value without removing (O(1))
 * - tailValue(): any | null — Get tail value without removing (O(1))
 *
 * Bonus: Implement iterator protocol for for...of loops
 */

export class DoublyLinkedList {
  constructor() {
    // YOUR CODE HERE
  }

  append(value: any): void {
    // YOUR CODE HERE
  }

  prepend(value: any): void {
    // YOUR CODE HERE
  }

  insertAt(index: number, value: any): boolean {
    // YOUR CODE HERE
    return false;
  }

  deleteAt(index: number): any | null {
    // YOUR CODE HERE
    return null;
  }

  deleteValue(value: any): boolean {
    // YOUR CODE HERE
    return false;
  }

  get(index: number): any | null {
    // YOUR CODE HERE
    return null;
  }

  set(index: number, value: any): boolean {
    // YOUR CODE HERE
    return false;
  }

  indexOf(value: any): number {
    // YOUR CODE HERE
    return -1;
  }

  contains(value: any): boolean {
    // YOUR CODE HERE
    return false;
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }

  isEmpty(): boolean {
    // YOUR CODE HERE
    return true;
  }

  clear(): void {
    // YOUR CODE HERE
  }

  toArray(): any[] {
    // YOUR CODE HERE
    return [];
  }

  toArrayReverse(): any[] {
    // YOUR CODE HERE
    return [];
  }

  headValue(): any | null {
    // YOUR CODE HERE
    return null;
  }

  tailValue(): any | null {
    // YOUR CODE HERE
    return null;
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { DoublyLinkedList } from './challenge';

describe('DoublyLinkedList', () => {
  it('creates empty list', () => {
    const list = new DoublyLinkedList();
    expect(list.isEmpty()).toBe(true);
    expect(list.size()).toBe(0);
    expect(list.headValue()).toBeNull();
    expect(list.tailValue()).toBeNull();
  });

  it('appends single value', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.size()).toBe(1);
    expect(list.headValue()).toBe(1);
    expect(list.tailValue()).toBe(1);
    expect(list.toArray()).toEqual([1]);
  });

  it('appends multiple values', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.size()).toBe(3);
    expect(list.headValue()).toBe(1);
    expect(list.tailValue()).toBe(3);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('prepends values', () => {
    const list = new DoublyLinkedList();
    list.prepend(1);
    list.prepend(2);
    list.prepend(3);
    expect(list.size()).toBe(3);
    expect(list.headValue()).toBe(3);
    expect(list.tailValue()).toBe(1);
    expect(list.toArray()).toEqual([3, 2, 1]);
  });

  it('mix of append and prepend', () => {
    const list = new DoublyLinkedList();
    list.append(2);
    list.prepend(1);
    list.append(3);
    list.prepend(0);
    expect(list.toArray()).toEqual([0, 1, 2, 3]);
    expect(list.size()).toBe(4);
  });

  it('get returns correct values', () => {
    const list = new DoublyLinkedList();
    ['a', 'b', 'c', 'd'].forEach(v => list.append(v));
    expect(list.get(0)).toBe('a');
    expect(list.get(1)).toBe('b');
    expect(list.get(2)).toBe('c');
    expect(list.get(3)).toBe('d');
    expect(list.get(-1)).toBeNull();
    expect(list.get(10)).toBeNull();
  });

  it('set updates values', () => {
    const list = new DoublyLinkedList();
    [1, 2, 3].forEach(v => list.append(v));
    expect(list.set(1, 20)).toBe(true);
    expect(list.get(1)).toBe(20);
    expect(list.toArray()).toEqual([1, 20, 3]);
    expect(list.set(-1, 0)).toBe(false);
    expect(list.set(10, 0)).toBe(false);
  });

  it('insertAt inserts at position', () => {
    const list = new DoublyLinkedList();
    [1, 3].forEach(v => list.append(v));
    expect(list.insertAt(1, 2)).toBe(true);
    expect(list.toArray()).toEqual([1, 2, 3]);
    expect(list.insertAt(0, 0)).toBe(true);
    expect(list.toArray()).toEqual([0, 1, 2, 3]);
    expect(list.insertAt(4, 4)).toBe(true);
    expect(list.toArray()).toEqual([0, 1, 2, 3, 4]);
  });

  it('insertAt at invalid indices', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.insertAt(-1, 0)).toBe(false);
    expect(list.insertAt(5, 0)).toBe(false);
  });

  it('deleteAt removes and returns value', () => {
    const list = new DoublyLinkedList();
    ['a', 'b', 'c', 'd'].forEach(v => list.append(v));
    expect(list.deleteAt(1)).toBe('b');
    expect(list.toArray()).toEqual(['a', 'c', 'd']);
    expect(list.deleteAt(0)).toBe('a');
    expect(list.toArray()).toEqual(['c', 'd']);
    expect(list.deleteAt(1)).toBe('d');
    expect(list.toArray()).toEqual(['c']);
  });

  it('deleteAt from empty list', () => {
    const list = new DoublyLinkedList();
    expect(list.deleteAt(0)).toBeNull();
  });

  it('deleteAt invalid index', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.deleteAt(-1)).toBeNull();
    expect(list.deleteAt(10)).toBeNull();
  });

  it('deleteValue removes first occurrence', () => {
    const list = new DoublyLinkedList();
    [1, 2, 3, 2, 4].forEach(v => list.append(v));
    expect(list.deleteValue(2)).toBe(true);
    expect(list.toArray()).toEqual([1, 3, 2, 4]);
    expect(list.deleteValue(2)).toBe(true);
    expect(list.toArray()).toEqual([1, 3, 4]);
    expect(list.deleteValue(5)).toBe(false);
  });

  it('indexOf finds correct index', () => {
    const list = new DoublyLinkedList();
    ['a', 'b', 'c', 'd'].forEach(v => list.append(v));
    expect(list.indexOf('a')).toBe(0);
    expect(list.indexOf('c')).toBe(2);
    expect(list.indexOf('d')).toBe(3);
    expect(list.indexOf('z')).toBe(-1);
  });

  it('contains checks existence', () => {
    const list = new DoublyLinkedList();
    [1, 2, 3].forEach(v => list.append(v));
    expect(list.contains(2)).toBe(true);
    expect(list.contains(5)).toBe(false);
  });

  it('toArrayReverse returns reverse order', () => {
    const list = new DoublyLinkedList();
    [1, 2, 3, 4].forEach(v => list.append(v));
    expect(list.toArrayReverse()).toEqual([4, 3, 2, 1]);
  });

  it('toArrayReverse on empty list', () => {
    const list = new DoublyLinkedList();
    expect(list.toArrayReverse()).toEqual([]);
  });

  it('clear empties the list', () => {
    const list = new DoublyLinkedList();
    [1, 2, 3].forEach(v => list.append(v));
    list.clear();
    expect(list.isEmpty()).toBe(true);
    expect(list.size()).toBe(0);
    expect(list.toArray()).toEqual([]);
    expect(list.headValue()).toBeNull();
    expect(list.tailValue()).toBeNull();
  });

  it('handles duplicate values', () => {
    const list = new DoublyLinkedList();
    [5, 3, 5, 1, 3].forEach(v => list.append(v));
    expect(list.toArray()).toEqual([5, 3, 5, 1, 3]);
    expect(list.indexOf(5)).toBe(0);
    expect(list.contains(5)).toBe(true);
  });

  it('handles various types', () => {
    const list = new DoublyLinkedList();
    list.append(42);
    list.append('hello');
    list.append(true);
    list.append(null);
    list.append({ key: 'value' });
    list.append([1, 2, 3]);
    expect(list.size()).toBe(6);
    expect(list.get(0)).toBe(42);
    expect(list.get(1)).toBe('hello');
    expect(list.get(2)).toBe(true);
    expect(list.get(3)).toBeNull();
  });

  it('stress test with many operations', () => {
    const list = new DoublyLinkedList();
    for (let i = 0; i < 100; i++) {
      list.append(i);
    }
    expect(list.size()).toBe(100);
    expect(list.headValue()).toBe(0);
    expect(list.tailValue()).toBe(99);
    
    for (let i = 0; i < 50; i++) {
      list.deleteAt(0);
    }
    expect(list.size()).toBe(50);
    expect(list.headValue()).toBe(50);
  });

  it('insert and delete at boundaries', () => {
    const list = new DoublyLinkedList();
    list.append(2);
    list.insertAt(0, 1);
    list.insertAt(2, 3);
    expect(list.toArray()).toEqual([1, 2, 3]);
    
    list.deleteAt(0);
    list.deleteAt(1);
    expect(list.toArray()).toEqual([2]);
  });

  it('single element operations', () => {
    const list = new DoublyLinkedList();
    list.append(42);
    expect(list.deleteAt(0)).toBe(42);
    expect(list.isEmpty()).toBe(true);
  });
});
]==],
  },
}

return M
