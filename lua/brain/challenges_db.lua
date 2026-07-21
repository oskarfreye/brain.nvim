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

  it('decreaseKey moves element up', () => {
    const heap = new MinHeap([1, 2, 3, 4, 5]);
    heap.heapify();
    // Decrease value at index 4 (value 5) to 0
    expect(heap.decreaseKey(4, 0)).toBe(true);
    expect(heap.peek()).toBe(0);
  });

  it('decreaseKey returns false for invalid decrease', () => {
    const heap = new MinHeap([1, 2, 3]);
    heap.heapify();
    // Try to increase value (not allowed)
    expect(heap.decreaseKey(0, 10)).toBe(false);
  });

  it('decreaseKey returns false for invalid index', () => {
    const heap = new MinHeap([1, 2, 3]);
    expect(heap.decreaseKey(99, 0)).toBe(false);
    expect(heap.decreaseKey(-1, 0)).toBe(false);
  });

  it('delete removes element', () => {
    const heap = new MinHeap([5, 3, 7, 1, 9]);
    heap.heapify();
    expect(heap.delete(0)).toBe(true); // Delete root (1)
    expect(heap.peek()).toBe(3);
    expect(heap.size()).toBe(4);
  });

  it('delete returns false for invalid index', () => {
    const heap = new MinHeap([1, 2, 3]);
    expect(heap.delete(99)).toBe(false);
  });

  it('stress test with many insertions', () => {
    const heap = new MinHeap();
    const values = [50, 25, 75, 10, 30, 60, 90, 5, 15, 27, 35, 55, 65, 85, 95];
    values.forEach(v => heap.insert(v));
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual(values.sort((a, b) => a - b));
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
 * and paths from root to nodes represent strings. Commonly used for:
 * - Autocomplete systems
 * - Spell checkers
 * - IP routing (longest prefix match)
 * - Predictive text
 *
 * Implement the Trie class with:
 * - insert(word: string): void — Insert a word into the trie
 * - search(word: string): boolean — Return true if word exists in trie
 * - startsWith(prefix: string): boolean — Return true if any word starts with prefix
 * - delete(word: string): boolean — Remove a word, return true if found
 * - countWords(): number — Return total number of words stored
 * - countNodes(): number — Return total number of nodes in trie
 * - findWordsWithPrefix(prefix: string): string[] — Return all words with given prefix
 * - autocomplete(prefix: string, limit?: number): string[] — Return up to limit completions
 *
 * Bonus: Implement a generic Trie<T> that stores values at word endpoints:
 * - insert(word: string, value: T): void
 * - get(word: string): T | undefined
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

  countNodes(): number {
    // YOUR CODE HERE
    return 0;
  }

  findWordsWithPrefix(prefix: string): string[] {
    // YOUR CODE HERE
    return [];
  }

  autocomplete(prefix: string, limit?: number): string[] {
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
    trie.insert('card');
    expect(trie.search('cat')).toBe(true);
    expect(trie.search('car')).toBe(true);
    expect(trie.search('card')).toBe(true);
    expect(trie.countWords()).toBe(3);
  });

  it('search returns false for non-existent words', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.search('hell')).toBe(false);
    expect(trie.search('helloo')).toBe(false);
    expect(trie.search('world')).toBe(false);
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

  it('startsWith returns false after delete', () => {
    const trie = new Trie();
    trie.insert('test');
    expect(trie.startsWith('te')).toBe(true);
    trie.delete('test');
    expect(trie.startsWith('te')).toBe(false);
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
    trie.insert('cat');
    trie.insert('car');
    trie.delete('cat');
    expect(trie.search('cat')).toBe(false);
    expect(trie.search('car')).toBe(true);
    expect(trie.startsWith('ca')).toBe(true);
  });

  it('countNodes returns correct count', () => {
    const trie = new Trie();
    expect(trie.countNodes()).toBe(1); // Root node
    trie.insert('abc');
    expect(trie.countNodes()).toBe(4); // Root + a + b + c
  });

  it('findWordsWithPrefix finds all matching words', () => {
    const trie = new Trie();
    trie.insert('apple');
    trie.insert('app');
    trie.insert('application');
    trie.insert('apply');
    trie.insert('banana');
    
    const words = trie.findWordsWithPrefix('app');
    expect(words).toHaveLength(4);
    expect(words).toContain('apple');
    expect(words).toContain('app');
    expect(words).toContain('application');
    expect(words).toContain('apply');
  });

  it('findWordsWithPrefix returns empty for non-existent prefix', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.findWordsWithPrefix('x')).toEqual([]);
  });

  it('autocomplete respects limit', () => {
    const trie = new Trie();
    trie.insert('apple');
    trie.insert('app');
    trie.insert('application');
    trie.insert('apply');
    
    const results = trie.autocomplete('app', 2);
    expect(results.length).toBeLessThanOrEqual(2);
    results.forEach(r => expect(r.startsWith('app')).toBe(true));
  });

  it('autocomplete without limit', () => {
    const trie = new Trie();
    trie.insert('test');
    trie.insert('testing');
    trie.insert('tester');
    
    const results = trie.autocomplete('test');
    expect(results).toHaveLength(3);
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
    expect(trie.search('d')).toBe(false);
  });

  it('handles duplicate inserts', () => {
    const trie = new Trie();
    trie.insert('hello');
    trie.insert('hello');
    expect(trie.search('hello')).toBe(true);
    // Depending on implementation, countWords might be 1 or 2
    expect(trie.countWords()).toBeGreaterThanOrEqual(1);
  });

  it('stress test with many words', () => {
    const trie = new Trie();
    const words = ['apple', 'application', 'apply', 'banana', 'band', 'can', 'cat', 'card'];
    words.forEach(w => trie.insert(w));
    
    expect(trie.countWords()).toBe(words.length);
    words.forEach(w => expect(trie.search(w)).toBe(true));
  });

  it('autocomplete returns sorted results', () => {
    const trie = new Trie();
    trie.insert('zebra');
    trie.insert('apple');
    trie.insert('banana');
    
    const results = trie.autocomplete('');
    expect(results).toEqual(['apple', 'banana', 'zebra']);
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
 * A Bloom filter can tell you:
 * - "Definitely NOT in the set" (no false negatives)
 * - "Probably in the set" (possible false positives)
 *
 * It uses multiple hash functions to set bits in a bit array. To check membership,
 * verify all corresponding bits are set. Commonly used in:
 * - Database query optimization (avoiding disk lookups)
 * - Web crawlers (avoiding revisiting URLs)
 * - Cache filtering (avoiding cache misses)
 * - Network security (blocked IP/URL lists)
 *
 * Implement the BloomFilter class with:
 * - constructor(capacity: number, falsePositiveRate?: number) — Initialize with
 *   expected capacity and optional false positive rate (default 0.01)
 * - add(item: string): void — Add an item to the filter
 * - has(item: string): boolean — Check if item might be in the set
 * - size(): number — Return number of items added (approximate)
 * - clear(): void — Reset the filter
 *
 * The filter should automatically calculate optimal:
 * - Bit array size (m) based on capacity and false positive rate
 * - Number of hash functions (k) for optimal accuracy
 *
 * Bonus: Implement union and intersection operations:
 * - union(other: BloomFilter): BloomFilter
 * - intersection(other: BloomFilter): BloomFilter
 */

export class BloomFilter {
  constructor(capacity: number, falsePositiveRate?: number) {
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

  clear(): void {
    // YOUR CODE HERE
  }

  union(other: BloomFilter): BloomFilter {
    // YOUR CODE HERE
    return new BloomFilter(1);
  }

  intersection(other: BloomFilter): BloomFilter {
    // YOUR CODE HERE
    return new BloomFilter(1);
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { BloomFilter } from './challenge';

describe('BloomFilter', () => {
  it('creates empty filter', () => {
    const filter = new BloomFilter(100);
    expect(filter.has('anything')).toBe(false);
  });

  it('adds and finds single item', () => {
    const filter = new BloomFilter(100);
    filter.add('hello');
    expect(filter.has('hello')).toBe(true);
  });

  it('returns false for non-existent items', () => {
    const filter = new BloomFilter(100);
    filter.add('hello');
    expect(filter.has('world')).toBe(false);
  });

  it('handles multiple items', () => {
    const filter = new BloomFilter(1000);
    const items = ['apple', 'banana', 'cherry', 'date', 'elderberry'];
    items.forEach(item => filter.add(item));
    
    items.forEach(item => {
      expect(filter.has(item)).toBe(true);
    });
  });

  it('tracks size correctly', () => {
    const filter = new BloomFilter(100);
    expect(filter.size()).toBe(0);
    filter.add('one');
    expect(filter.size()).toBe(1);
    filter.add('two');
    expect(filter.size()).toBe(2);
  });

  it('clear resets the filter', () => {
    const filter = new BloomFilter(100);
    filter.add('hello');
    filter.add('world');
    filter.clear();
    expect(filter.has('hello')).toBe(false);
    expect(filter.has('world')).toBe(false);
    expect(filter.size()).toBe(0);
  });

  it('no false negatives', () => {
    const filter = new BloomFilter(1000, 0.01);
    const items: string[] = [];
    
    // Add 100 items
    for (let i = 0; i < 100; i++) {
      const item = `item_${i}`;
      items.push(item);
      filter.add(item);
    }
    
    // All added items must be found (no false negatives)
    items.forEach(item => {
      expect(filter.has(item)).toBe(true);
    });
  });

  it('handles empty strings', () => {
    const filter = new BloomFilter(100);
    filter.add('');
    expect(filter.has('')).toBe(true);
    expect(filter.has('non-empty')).toBe(false);
  });

  it('handles special characters', () => {
    const filter = new BloomFilter(100);
    const special = ['!@#$', 'hello\nworld', 'tab\there', 'unicode'];
    special.forEach(s => filter.add(s));
    special.forEach(s => expect(filter.has(s)).toBe(true));
  });

  it('union combines two filters', () => {
    const filter1 = new BloomFilter(100);
    const filter2 = new BloomFilter(100);
    
    filter1.add('a');
    filter1.add('b');
    filter2.add('c');
    filter2.add('d');
    
    const union = filter1.union(filter2);
    expect(union.has('a')).toBe(true);
    expect(union.has('b')).toBe(true);
    expect(union.has('c')).toBe(true);
    expect(union.has('d')).toBe(true);
  });

  it('intersection finds common elements', () => {
    const filter1 = new BloomFilter(100);
    const filter2 = new BloomFilter(100);
    
    filter1.add('a');
    filter1.add('b');
    filter1.add('c');
    filter2.add('b');
    filter2.add('c');
    filter2.add('d');
    
    const intersection = filter1.intersection(filter2);
    expect(intersection.has('b')).toBe(true);
    expect(intersection.has('c')).toBe(true);
    // Note: false positives possible for 'a' and 'd'
  });

  it('different false positive rates affect accuracy', () => {
    const filter1 = new BloomFilter(100, 0.001); // Low FP rate
    const filter2 = new BloomFilter(100, 0.1); // High FP rate
    
    const items: string[] = [];
    for (let i = 0; i < 50; i++) {
      const item = `item_${i}`;
      items.push(item);
      filter1.add(item);
      filter2.add(item);
    }
    
    // Test with items not in either filter
    let fp1 = 0, fp2 = 0;
    for (let i = 50; i < 150; i++) {
      const item = `item_${i}`;
      if (filter1.has(item)) fp1++;
      if (filter2.has(item)) fp2++;
    }
    
    // Higher FP rate should have more false positives (statistically)
    // This is a soft assertion due to probabilistic nature
    expect(fp2).toBeGreaterThanOrEqual(fp1);
  });

  it('stress test with many items', () => {
    const filter = new BloomFilter(10000, 0.01);
    const items: string[] = [];
    
    for (let i = 0; i < 5000; i++) {
      const item = `stress_item_${i}`;
      items.push(item);
      filter.add(item);
    }
    
    // All added items must be found
    items.forEach(item => {
      expect(filter.has(item)).toBe(true);
    });
    
    expect(filter.size()).toBe(5000);
  });

  it('handles very long strings', () => {
    const filter = new BloomFilter(100);
    const longString = 'a'.repeat(10000);
    filter.add(longString);
    expect(filter.has(longString)).toBe(true);
  });

  it('case sensitivity', () => {
    const filter = new BloomFilter(100);
    filter.add('Hello');
    expect(filter.has('Hello')).toBe(true);
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
 * A Fenwick Tree is more compact than a Segment Tree and faster in practice.
 * It supports:
 * - Point updates in O(log n)
 * - Prefix sum queries in O(log n)
 * - Range sum queries in O(log n)
 *
 * Commonly used for:
 * - Cumulative frequency tables
 * - Inversion counting
 * - Arithmetic coding
 * - Fenwick trees in competitive programming
 *
 * Implement the FenwickTree class with:
 * - constructor(size: number) — Initialize tree for n elements (1-indexed)
 * - update(index: number, delta: number): void — Add delta to element at index
 * - query(index: number): number — Return prefix sum from 1 to index
 * - rangeQuery(left: number, right: number): number — Return sum from left to right
 * - build(arr: number[]): void — Build tree from array in O(n)
 *
 * Note: Fenwick trees use 1-based indexing internally.
 *
 * Bonus: Implement a FenwickTree that supports:
 * - range updates with point queries
 * - 2D Fenwick Tree for matrix operations
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

  rangeQuery(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }

  build(arr: number[]): void {
    // YOUR CODE HERE
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { FenwickTree } from './challenge';

describe('FenwickTree', () => {
  it('creates empty tree', () => {
    const tree = new FenwickTree(5);
    expect(tree.query(1)).toBe(0);
    expect(tree.query(5)).toBe(0);
  });

  it('single element update and query', () => {
    const tree = new FenwickTree(5);
    tree.update(1, 5);
    expect(tree.query(1)).toBe(5);
    expect(tree.query(2)).toBe(5);
    expect(tree.query(5)).toBe(5);
  });

  it('multiple updates', () => {
    const tree = new FenwickTree(5);
    tree.update(1, 1);
    tree.update(2, 2);
    tree.update(3, 3);
    tree.update(4, 4);
    tree.update(5, 5);
    
    expect(tree.query(1)).toBe(1);
    expect(tree.query(2)).toBe(3);
    expect(tree.query(3)).toBe(6);
    expect(tree.query(4)).toBe(10);
    expect(tree.query(5)).toBe(15);
  });

  it('rangeQuery returns correct sums', () => {
    const tree = new FenwickTree(5);
    tree.update(1, 1);
    tree.update(2, 2);
    tree.update(3, 3);
    tree.update(4, 4);
    tree.update(5, 5);
    
    expect(tree.rangeQuery(1, 3)).toBe(6);
    expect(tree.rangeQuery(2, 4)).toBe(9);
    expect(tree.rangeQuery(1, 5)).toBe(15);
    expect(tree.rangeQuery(3, 3)).toBe(3);
  });

  it('build from array', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    
    expect(tree.query(1)).toBe(1);
    expect(tree.query(2)).toBe(3);
    expect(tree.query(3)).toBe(6);
    expect(tree.query(4)).toBe(10);
    expect(tree.query(5)).toBe(15);
  });

  it('update after build', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    tree.update(3, 10); // Add 10 to index 3
    
    expect(tree.query(3)).toBe(16);
    expect(tree.query(5)).toBe(25);
    expect(tree.rangeQuery(3, 3)).toBe(13);
  });

  it('handles negative values', () => {
    const tree = new FenwickTree(5);
    tree.build([1, -2, 3, -4, 5]);
    
    expect(tree.query(1)).toBe(1);
    expect(tree.query(2)).toBe(-1);
    expect(tree.query(3)).toBe(2);
    expect(tree.query(4)).toBe(-2);
    expect(tree.query(5)).toBe(3);
  });

  it('handles zero values', () => {
    const tree = new FenwickTree(5);
    tree.build([0, 0, 0, 0, 0]);
    
    expect(tree.query(5)).toBe(0);
    tree.update(3, 5);
    expect(tree.query(3)).toBe(5);
    expect(tree.query(5)).toBe(5);
  });

  it('single element array', () => {
    const tree = new FenwickTree(1);
    tree.build([42]);
    expect(tree.query(1)).toBe(42);
    tree.update(1, 8);
    expect(tree.query(1)).toBe(50);
  });

  it('large index updates', () => {
    const tree = new FenwickTree(1000);
    tree.update(1000, 100);
    expect(tree.query(999)).toBe(0);
    expect(tree.query(1000)).toBe(100);
  });

  it('stress test with many operations', () => {
    const tree = new FenwickTree(10000);
    const arr = new Array(10000).fill(0);
    
    // Random updates
    for (let i = 0; i < 1000; i++) {
      const idx = Math.floor(Math.random() * 10000) + 1;
      const val = Math.floor(Math.random() * 100) - 50;
      tree.update(idx, val);
      arr[idx - 1] += val;
    }
    
    // Verify prefix sums
    let sum = 0;
    for (let i = 0; i < 10000; i++) {
      sum += arr[i];
      expect(tree.query(i + 1)).toBe(sum);
    }
  });

  it('build is O(n) efficient', () => {
    const tree = new FenwickTree(100000);
    const arr = Array.from({ length: 100000 }, (_, i) => i + 1);
    
    const start = Date.now();
    tree.build(arr);
    const elapsed = Date.now() - start;
    
    expect(elapsed).toBeLessThan(1000); // Should complete in < 1s
    expect(tree.query(100000)).toBe(5000050000); // Sum of 1 to 100000
  });

  it('rangeQuery with left > right returns 0', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    expect(tree.rangeQuery(4, 2)).toBe(0);
  });

  it('query with index 0 returns 0', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    expect(tree.query(0)).toBe(0);
  });

  it('inverse operations', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    
    // Add then subtract same value
    tree.update(3, 10);
    tree.update(3, -10);
    
    expect(tree.query(3)).toBe(6);
    expect(tree.query(5)).toBe(15);
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
 * Implement an arithmetic expression evaluator that handles operator precedence.
 *
 * The evaluator must support:
 * - Basic operations: +, -, *, /
 * - Parentheses for grouping
 * - Integer and decimal numbers
 * - Unary minus (negative numbers)
 * - Proper operator precedence (* and / before + and -)
 * - Left-to-right associativity for equal precedence
 *
 * Integer division should truncate toward zero (like JavaScript's | 0).
 *
 * Implement:
 * - evaluate(expression: string): number — Parse and evaluate the expression
 *
 * Examples:
 * - "2 + 3" → 5
 * - "2 + 3 * 4" → 14 (not 20!)
 * - "(2 + 3) * 4" → 20
 * - "10 / 3" → 3 (integer division)
 * - "-5 + 3" → -2
 * - "2 * -3" → -6
 * - "((2 + 3) * 4 - 5) / 3" → 5
 *
 * Bonus: Support additional operators:
 * - Exponentiation: ^ or **
 * - Modulo: %
 * - Variables: "x + y" with context
 */

export function evaluate(expression: string): number {
  // YOUR CODE HERE
  return 0;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { evaluate } from './challenge';

describe('evaluate', () => {
  it('evaluates single number', () => {
    expect(evaluate('42')).toBe(42);
    expect(evaluate('0')).toBe(0);
    expect(evaluate('7')).toBe(7);
  });

  it('evaluates simple addition', () => {
    expect(evaluate('2 + 3')).toBe(5);
    expect(evaluate('10 + 20')).toBe(30);
  });

  it('evaluates simple subtraction', () => {
    expect(evaluate('10 - 3')).toBe(7);
    expect(evaluate('5 - 8')).toBe(-3);
  });

  it('evaluates simple multiplication', () => {
    expect(evaluate('4 * 5')).toBe(20);
    expect(evaluate('3 * 7')).toBe(21);
  });

  it('evaluates simple division', () => {
    expect(evaluate('10 / 2')).toBe(5);
    expect(evaluate('7 / 2')).toBe(3); // Integer division
  });

  it('respects operator precedence', () => {
    expect(evaluate('2 + 3 * 4')).toBe(14);
    expect(evaluate('10 - 2 * 3')).toBe(4);
    expect(evaluate('1 + 2 * 3 + 4')).toBe(11);
  });

  it('handles parentheses', () => {
    expect(evaluate('(2 + 3) * 4')).toBe(20);
    expect(evaluate('2 * (3 + 4)')).toBe(14);
    expect(evaluate('(2 + 3) * (4 + 5)')).toBe(45);
  });

  it('handles nested parentheses', () => {
    expect(evaluate('((2 + 3))')).toBe(5);
    expect(evaluate('((2 + 3) * 4)')).toBe(20);
    expect(evaluate('(((1 + 2) * 3) + 4)')).toBe(13);
  });

  it('handles unary minus', () => {
    expect(evaluate('-5')).toBe(-5);
    expect(evaluate('-5 + 3')).toBe(-2);
    expect(evaluate('5 + -3')).toBe(2);
    expect(evaluate('-5 + -3')).toBe(-8);
  });

  it('handles unary minus with multiplication', () => {
    expect(evaluate('2 * -3')).toBe(-6);
    expect(evaluate('-2 * 3')).toBe(-6);
    expect(evaluate('-2 * -3')).toBe(6);
  });

  it('handles decimal numbers', () => {
    expect(evaluate('2.5 + 3.5')).toBe(6);
    expect(evaluate('10.0 / 2.0')).toBe(5);
  });

  it('handles whitespace', () => {
    expect(evaluate('  2 + 3  ')).toBe(5);
    expect(evaluate('2  +  3')).toBe(5);
    expect(evaluate('  (  2  +  3  )  ')).toBe(5);
  });

  it('complex expressions', () => {
    expect(evaluate('2 + 3 * 4 - 5')).toBe(9);
    expect(evaluate('10 / 2 + 3 * 4')).toBe(17);
    expect(evaluate('(10 + 20) / (3 + 3)')).toBe(5);
    expect(evaluate('((2 + 3) * 4 - 5) / 3')).toBe(5);
  });

  it('division truncates toward zero', () => {
    expect(evaluate('7 / 2')).toBe(3);
    expect(evaluate('-7 / 2')).toBe(-3);
    expect(evaluate('7 / -2')).toBe(-3);
    expect(evaluate('-7 / -2')).toBe(3);
  });

  it('multiple consecutive operations', () => {
    expect(evaluate('1 + 2 + 3 + 4')).toBe(10);
    expect(evaluate('2 * 3 * 4')).toBe(24);
    expect(evaluate('10 - 3 - 2')).toBe(5);
    expect(evaluate('100 / 2 / 5')).toBe(10);
  });

  it('left-to-right associativity', () => {
    expect(evaluate('10 - 5 - 2')).toBe(3); // (10 - 5) - 2
    expect(evaluate('100 / 10 / 2')).toBe(5); // (100 / 10) / 2
  });

  it('zero handling', () => {
    expect(evaluate('0 + 5')).toBe(5);
    expect(evaluate('5 * 0')).toBe(0);
    expect(evaluate('0 / 5')).toBe(0);
  });

  it('large numbers', () => {
    expect(evaluate('1000000 + 2000000')).toBe(3000000);
    expect(evaluate('999999 * 2')).toBe(1999998);
  });

  it('expression with all operators', () => {
    expect(evaluate('10 + 5 * 2 - 8 / 4')).toBe(18);
  });

  it('deeply nested expression', () => {
    expect(evaluate('((((((1 + 2))))))')).toBe(3);
    expect(evaluate('(((1 + 2) * 3) + ((4 * 5) - 6))')).toBe(23);
  });
});

describe('edge cases', () => {
  it('empty expression throws', () => {
    expect(() => evaluate('')).toThrow();
  });

  it('invalid characters throw', () => {
    expect(() => evaluate('2 + a')).toThrow();
    expect(() => evaluate('2 & 3')).toThrow();
  });

  it('unbalanced parentheses throw', () => {
    expect(() => evaluate('(2 + 3')).toThrow();
    expect(() => evaluate('2 + 3)')).toThrow();
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
 * Implement a segment tree for efficient range queries and point updates.
 *
 * A segment tree is a binary tree where each node represents an interval/range.
 * It supports:
 * - Point updates in O(log n)
 * - Range queries in O(log n)
 *
 * This implementation should support range sum queries, but design it to be
 * extensible for other operations (min, max, GCD, etc.).
 *
 * Implement the SegmentTree class with:
 * - constructor(arr: number[]) — Build tree from array
 * - update(index: number, value: number): void — Set element at index to value
 * - query(left: number, right: number): number — Return sum from left to right (inclusive)
 * - size(): number — Return the size of the original array
 *
 * The tree uses 0-based indexing for the public API.
 *
 * Bonus: Make it generic with a custom merge function:
 * - constructor(arr: T[], mergeFn: (a: T, b: T) => T, identity: T)
 * - Support range min, range max, range GCD, etc.
 */

export class SegmentTree {
  constructor(arr: number[]) {
    // YOUR CODE HERE
  }

  update(index: number, value: number): void {
    // YOUR CODE HERE
  }

  query(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { SegmentTree } from './challenge';

describe('SegmentTree', () => {
  it('creates tree from array', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.size()).toBe(5);
  });

  it('query full range', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 4)).toBe(15);
  });

  it('query single element', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 0)).toBe(1);
    expect(tree.query(2, 2)).toBe(3);
    expect(tree.query(4, 4)).toBe(5);
  });

  it('query partial range', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 2)).toBe(6);
    expect(tree.query(1, 3)).toBe(9);
    expect(tree.query(2, 4)).toBe(12);
  });

  it('update single element', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    tree.update(2, 10);
    expect(tree.query(0, 4)).toBe(22);
    expect(tree.query(2, 2)).toBe(10);
  });

  it('multiple updates', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    tree.update(0, 10);
    tree.update(1, 20);
    tree.update(2, 30);
    expect(tree.query(0, 4)).toBe(64);
  });

  it('update and query interleaved', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 2)).toBe(6);
    tree.update(1, 10);
    expect(tree.query(0, 2)).toBe(14);
    tree.update(2, 20);
    expect(tree.query(0, 2)).toBe(31);
  });

  it('single element array', () => {
    const tree = new SegmentTree([42]);
    expect(tree.query(0, 0)).toBe(42);
    tree.update(0, 100);
    expect(tree.query(0, 0)).toBe(100);
  });

  it('two element array', () => {
    const tree = new SegmentTree([5, 10]);
    expect(tree.query(0, 1)).toBe(15);
    expect(tree.query(0, 0)).toBe(5);
    expect(tree.query(1, 1)).toBe(10);
  });

  it('handles negative values', () => {
    const tree = new SegmentTree([-1, -2, -3, -4, -5]);
    expect(tree.query(0, 4)).toBe(-15);
    tree.update(2, 10);
    expect(tree.query(0, 4)).toBe(0);
  });

  it('handles zero values', () => {
    const tree = new SegmentTree([0, 0, 0, 0, 0]);
    expect(tree.query(0, 4)).toBe(0);
    tree.update(2, 5);
    expect(tree.query(0, 4)).toBe(5);
  });

  it('query with left > right returns 0', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(3, 1)).toBe(0);
  });

  it('query out of bounds throws', () => {
    const tree = new SegmentTree([1, 2, 3]);
    expect(() => tree.query(0, 5)).toThrow();
    expect(() => tree.query(-1, 2)).toThrow();
  });

  it('update out of bounds throws', () => {
    const tree = new SegmentTree([1, 2, 3]);
    expect(() => tree.update(5, 10)).toThrow();
    expect(() => tree.update(-1, 10)).toThrow();
  });

  it('stress test with many operations', () => {
    const arr = Array.from({ length: 1000 }, (_, i) => i + 1);
    const tree = new SegmentTree(arr);
    
    // Initial sum should be sum of 1 to 1000
    expect(tree.query(0, 999)).toBe(500500);
    
    // Random updates and queries
    for (let i = 0; i < 100; i++) {
      const idx = Math.floor(Math.random() * 1000);
      tree.update(idx, i);
    }
    
    // Verify by manual calculation
    let sum = 0;
    for (let i = 0; i < 1000; i++) {
      sum += i < 100 ? (i >= 0 ? i : arr[i]) : arr[i];
    }
    // This is approximate due to random updates
    expect(tree.query(0, 999)).toBeLessThan(500500);
  });

  it('power of 2 size array', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5, 6, 7, 8]);
    expect(tree.query(0, 7)).toBe(36);
    expect(tree.query(0, 3)).toBe(10);
    expect(tree.query(4, 7)).toBe(26);
  });

  it('non-power of 2 size array', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5, 6, 7]);
    expect(tree.query(0, 6)).toBe(28);
    expect(tree.query(0, 3)).toBe(10);
    expect(tree.query(4, 6)).toBe(18);
  });

  it('large values', () => {
    const tree = new SegmentTree([1000000, 2000000, 3000000]);
    expect(tree.query(0, 2)).toBe(6000000);
  });
});
]=],
  },
  {
    name = "Doubly Linked List",
    difficulty = "easy",
    stub = [=[
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
 * This enables:
 * - O(1) append and prepend
 * - O(1) removal from ends
 * - Bidirectional iteration
 *
 * Implement the DoublyLinkedList class with:
 * - constructor() — Create empty list
 * - append(value: T): void — Add to end
 * - prepend(value: T): void — Add to beginning
 * - insert(index: number, value: T): void — Insert at index
 * - remove(index: number): T | null — Remove and return value at index
 * - get(index: number): T | null — Get value at index
 * - set(index: number, value: T): boolean — Set value at index
 * - indexOf(value: T): number — Find first index of value (-1 if not found)
 * - contains(value: T): boolean — Check if value exists
 * - size(): number — Return number of elements
 * - isEmpty(): boolean — Check if list is empty
 * - clear(): void — Remove all elements
 * - toArray(): T[] — Convert to array
 * - toReversedArray(): T[] — Convert to reversed array
 *
 * Bonus: Implement an iterator:
 * - [Symbol.iterator](): Iterator<T>
 */

export class DoublyLinkedList<T> {
  constructor() {
    // YOUR CODE HERE
  }

  append(value: T): void {
    // YOUR CODE HERE
  }

  prepend(value: T): void {
    // YOUR CODE HERE
  }

  insert(index: number, value: T): void {
    // YOUR CODE HERE
  }

  remove(index: number): T | null {
    // YOUR CODE HERE
    return null;
  }

  get(index: number): T | null {
    // YOUR CODE HERE
    return null;
  }

  set(index: number, value: T): boolean {
    // YOUR CODE HERE
    return false;
  }

  indexOf(value: T): number {
    // YOUR CODE HERE
    return -1;
  }

  contains(value: T): boolean {
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

  toArray(): T[] {
    // YOUR CODE HERE
    return [];
  }

  toReversedArray(): T[] {
    // YOUR CODE HERE
    return [];
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { DoublyLinkedList } from './challenge';

describe('DoublyLinkedList', () => {
  it('creates empty list', () => {
    const list = new DoublyLinkedList();
    expect(list.isEmpty()).toBe(true);
    expect(list.size()).toBe(0);
  });

  it('append single element', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.size()).toBe(1);
    expect(list.get(0)).toBe(1);
  });

  it('append multiple elements', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('prepend single element', () => {
    const list = new DoublyLinkedList();
    list.prepend(1);
    expect(list.get(0)).toBe(1);
    expect(list.size()).toBe(1);
  });

  it('prepend multiple elements', () => {
    const list = new DoublyLinkedList();
    list.prepend(1);
    list.prepend(2);
    list.prepend(3);
    expect(list.toArray()).toEqual([3, 2, 1]);
  });

  it('mix append and prepend', () => {
    const list = new DoublyLinkedList();
    list.append(2);
    list.prepend(1);
    list.append(3);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insert at beginning', () => {
    const list = new DoublyLinkedList();
    list.append(2);
    list.append(3);
    list.insert(0, 1);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insert at end', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.insert(2, 3);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insert in middle', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(3);
    list.insert(1, 2);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('remove from beginning', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.remove(0)).toBe(1);
    expect(list.toArray()).toEqual([2, 3]);
  });

  it('remove from end', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.remove(2)).toBe(3);
    expect(list.toArray()).toEqual([1, 2]);
  });

  it('remove from middle', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.remove(1)).toBe(2);
    expect(list.toArray()).toEqual([1, 3]);
  });

  it('remove returns null for invalid index', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.remove(5)).toBeNull();
    expect(list.remove(-1)).toBeNull();
  });

  it('get returns null for invalid index', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.get(5)).toBeNull();
    expect(list.get(-1)).toBeNull();
  });

  it('set updates value', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    expect(list.set(0, 10)).toBe(true);
    expect(list.get(0)).toBe(10);
  });

  it('set returns false for invalid index', () => {
    const list = new DoublyLinkedList();
    expect(list.set(0, 1)).toBe(false);
  });

  it('indexOf finds elements', () => {
    const list = new DoublyLinkedList();
    list.append('a');
    list.append('b');
    list.append('c');
    expect(list.indexOf('a')).toBe(0);
    expect(list.indexOf('b')).toBe(1);
    expect(list.indexOf('c')).toBe(2);
  });

  it('indexOf returns -1 for missing element', () => {
    const list = new DoublyLinkedList();
    list.append('a');
    expect(list.indexOf('b')).toBe(-1);
  });

  it('contains checks existence', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.contains(1)).toBe(true);
    expect(list.contains(2)).toBe(false);
  });

  it('clear empties list', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.clear();
    expect(list.isEmpty()).toBe(true);
    expect(list.size()).toBe(0);
    expect(list.toArray()).toEqual([]);
  });

  it('toReversedArray returns reversed copy', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.toReversedArray()).toEqual([3, 2, 1]);
    expect(list.toArray()).toEqual([1, 2, 3]); // Original unchanged
  });

  it('handles generic types', () => {
    const list = new DoublyLinkedList<string>();
    list.append('hello');
    list.append('world');
    expect(list.toArray()).toEqual(['hello', 'world']);
  });

  it('handles object values', () => {
    const list = new DoublyLinkedList<{ id: number }>();
    list.append({ id: 1 });
    list.append({ id: 2 });
    expect(list.get(0)?.id).toBe(1);
    expect(list.get(1)?.id).toBe(2);
  });

  it('stress test with many operations', () => {
    const list = new DoublyLinkedList();
    for (let i = 0; i < 100; i++) {
      list.append(i);
    }
    expect(list.size()).toBe(100);
    expect(list.get(0)).toBe(0);
    expect(list.get(99)).toBe(99);
    
    for (let i = 0; i < 50; i++) {
      list.remove(0);
    }
    expect(list.size()).toBe(50);
    expect(list.get(0)).toBe(50);
  });

  it('insert at invalid index throws', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(() => list.insert(5, 2)).toThrow();
    expect(() => list.insert(-1, 2)).toThrow();
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
 * Implement topological sorting for directed acyclic graphs (DAGs).
 *
 * Topological sort orders vertices such that for every directed edge (u, v),
 * vertex u comes before v in the ordering. This is essential for:
 * - Build systems (dependency resolution)
 * - Package managers (npm, pip, cargo)
 * - Course scheduling (prerequisites)
 * - Task scheduling with dependencies
 * - Deadlock detection
 *
 * Implement:
 * - topologicalSort(graph: Map<number, number[]>): number[] | null
 *   Return a valid topological order, or null if graph has a cycle.
 *   Use either Kahn's algorithm (BFS-based) or DFS-based approach.
 *
 * - hasCycle(graph: Map<number, number[]>): boolean
 *   Detect if the graph contains a cycle.
 *
 * - findCourseOrder(numCourses: number, prerequisites: number[][]): number[] | null
 *   Classic course schedule problem: given numCourses and prerequisites
 *   where [a, b] means "b must be taken before a", return a valid order.
 *
 * Graph representation: adjacency list as Map<vertex, neighbors[]>
 *
 * Bonus: Implement allSourcesTopologicalSort to find all valid orderings.
 */

export function topologicalSort(graph: Map<number, number[]>): number[] | null {
  // YOUR CODE HERE
  return null;
}

export function hasCycle(graph: Map<number, number[]>): boolean {
  // YOUR CODE HERE
  return false;
}

export function findCourseOrder(numCourses: number, prerequisites: number[][]): number[] | null {
  // YOUR CODE HERE
  return null;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { topologicalSort, hasCycle, findCourseOrder } from './challenge';

function isValidTopoOrder(graph: Map<number, number[]>, order: number[]): boolean {
  const position = new Map<number, number>();
  order.forEach((v, i) => position.set(v, i));
  
  for (const [u, neighbors] of graph.entries()) {
    for (const v of neighbors) {
      if ((position.get(u) ?? -1) >= (position.get(v) ?? 0)) {
        return false;
      }
    }
  }
  return true;
}

describe('topologicalSort', () => {
  it('empty graph', () => {
    const graph = new Map();
    expect(topologicalSort(graph)).toEqual([]);
  });

  it('single node', () => {
    const graph = new Map([[0, []]]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toEqual([0]);
  });

  it('linear chain 0 -> 1 -> 2 -> 3', () => {
    const graph = new Map([
      [0, [1]],
      [1, [2]],
      [2, [3]],
      [3, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).toEqual([0, 1, 2, 3]);
  });

  it('simple DAG', () => {
    const graph = new Map([
      [0, [1, 2]],
      [1, [3]],
      [2, [3]],
      [3, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(isValidTopoOrder(graph, result!)).toBe(true);
  });

  it('graph with cycle returns null', () => {
    const graph = new Map([
      [0, [1]],
      [1, [2]],
      [2, [0]]
    ]);
    expect(topologicalSort(graph)).toBeNull();
  });

  it('self-loop is a cycle', () => {
    const graph = new Map([[0, [0]]]);
    expect(topologicalSort(graph)).toBeNull();
  });

  it('disconnected components', () => {
    const graph = new Map([
      [0, [1]],
      [1, []],
      [2, [3]],
      [3, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(4);
    expect(isValidTopoOrder(graph, result!)).toBe(true);
  });

  it('multiple valid orderings', () => {
    const graph = new Map([
      [0, []],
      [1, []],
      [2, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(3);
    expect(new Set(result)).toEqual(new Set([0, 1, 2]));
  });

  it('complex DAG', () => {
    const graph = new Map([
      [0, [1, 2]],
      [1, [3]],
      [2, [3, 4]],
      [3, [5]],
      [4, [5]],
      [5, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(isValidTopoOrder(graph, result!)).toBe(true);
  });

  it('large linear chain', () => {
    const graph = new Map<number, number[]>();
    for (let i = 0; i < 100; i++) {
      graph.set(i, [i + 1]);
    }
    graph.set(100, []);
    
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(101);
    expect(result![0]).toBe(0);
    expect(result![100]).toBe(100);
  });
});

describe('hasCycle', () => {
  it('empty graph has no cycle', () => {
    expect(hasCycle(new Map())).toBe(false);
  });

  it('single node has no cycle', () => {
    expect(hasCycle(new Map([[0, []]]))).toBe(false);
  });

  it('simple cycle 0 -> 1 -> 0', () => {
    const graph = new Map([
      [0, [1]],
      [1, [0]]
    ]);
    expect(hasCycle(graph)).toBe(true);
  });

  it('larger cycle', () => {
    const graph = new Map([
      [0, [1]],
      [1, [2]],
      [2, [3]],
      [3, [0]]
    ]);
    expect(hasCycle(graph)).toBe(true);
  });

  it('self-loop', () => {
    const graph = new Map([[0, [0]]]);
    expect(hasCycle(graph)).toBe(true);
  });

  it('no cycle in DAG', () => {
    const graph = new Map([
      [0, [1, 2]],
      [1, [3]],
      [2, [3]],
      [3, []]
    ]);
    expect(hasCycle(graph)).toBe(false);
  });

  it('disconnected with cycle in one component', () => {
    const graph = new Map([
      [0, [1]],
      [1, []],
      [2, [3]],
      [3, [2]] // Cycle in this component
    ]);
    expect(hasCycle(graph)).toBe(true);
  });
});

describe('findCourseOrder', () => {
  it('no prerequisites', () => {
    const result = findCourseOrder(2, []);
    expect(result).not.toBeNull();
    expect(new Set(result)).toEqual(new Set([0, 1]));
  });

  it('single prerequisite 1 -> 0', () => {
    const result = findCourseOrder(2, [[1, 0]]);
    expect(result).toEqual([0, 1]);
  });

  it('multiple prerequisites', () => {
    const result = findCourseOrder(4, [[1, 0], [2, 0], [3, 1], [3, 2]]);
    expect(result).not.toBeNull();
    expect(result![0]).toBe(0);
    expect(result!.indexOf(1)).toBeLessThan(result!.indexOf(3));
    expect(result!.indexOf(2)).toBeLessThan(result!.indexOf(3));
  });

  it('impossible with cycle', () => {
    const result = findCourseOrder(2, [[1, 0], [0, 1]]);
    expect(result).toBeNull();
  });

  it('complex valid ordering', () => {
    const result = findCourseOrder(6, [
      [1, 0],
      [2, 0],
      [3, 1],
      [3, 2],
      [4, 3],
      [5, 3]
    ]);
    expect(result).not.toBeNull();
    expect(isValidTopoOrder(
      new Map([
        [0, [1, 2]],
        [1, [3]],
        [2, [3]],
        [3, [4, 5]],
        [4, []],
        [5, []]
      ]),
      result!
    )).toBe(true);
  });

  it('all courses depend on one', () => {
    const result = findCourseOrder(4, [[1, 0], [2, 0], [3, 0]]);
    expect(result).not.toBeNull();
    expect(result![0]).toBe(0);
    expect(new Set(result!.slice(1))).toEqual(new Set([1, 2, 3]));
  });

  it('linear chain of prerequisites', () => {
    const result = findCourseOrder(4, [[1, 0], [2, 1], [3, 2]]);
    expect(result).toEqual([0, 1, 2, 3]);
  });
});

describe('performance', () => {
  it('handles larger graph', () => {
    const graph = new Map<number, number[]>();
    for (let i = 0; i < 100; i++) {
      graph.set(i, [i + 1]);
    }
    graph.set(100, []);
    
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(101);
  });

  it('handles dense DAG', () => {
    const graph = new Map<number, number[]>();
    const n = 50;
    for (let i = 0; i < n; i++) {
      const neighbors: number[] = [];
      for (let j = i + 1; j < n; j++) {
        neighbors.push(j);
      }
      graph.set(i, neighbors);
    }
    
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(n);
    expect(isValidTopoOrder(graph, result!)).toBe(true);
  });
});
]=],
  },
  {
    name = "Monadic Option/Maybe Type",
    difficulty = "medium",
    stub = [=[
/**
 * Monadic Option/Maybe Type
 *
 * Implement a functional Option (Maybe) type for safe error handling without exceptions.
 *
 * The Option type represents a value that may or may not exist:
 * - Some(value) — A value is present
 * - None — No value is present
 *
 * This pattern is common in functional programming (Rust, Scala, Haskell) and helps:
 * - Avoid null/undefined errors
 * - Chain operations safely
 * - Make absence of values explicit in the type system
 * - Compose operations that might fail
 *
 * Implement:
 * - abstract class Option<T> — Base type
 * - class Some<T> extends Option<T> — Represents a present value
 * - class None<T> extends Option<T> — Represents absence (singleton pattern)
 *
 * Option methods:
 * - map<U>(fn: (value: T) => U): Option<U> — Transform the value if present
 * - flatMap<U>(fn: (value: T) => Option<U>): Option<U> — Chain Option-returning functions
 * - filter(predicate: (value: T) => boolean): Option<T> — Keep value only if predicate passes
 * - getOrElse(defaultValue: T): T — Get value or return default
 * - getOrThrow(error?: Error): T — Get value or throw
 * - isSome(): boolean — Check if value is present
 * - isNone(): boolean — Check if value is absent
 * - orElse(other: Option<T>): Option<T> — Use other if this is None
 * - orElseGet(fn: () => Option<T>): Option<T> — Lazy version of orElse
 * - forEach(fn: (value: T) => void): void — Execute side effect if present
 * - toArray(): T[] — Convert to array (empty if None, single-element if Some)
 *
 * Static helpers:
 * - Option.of<T>(value: T | null | undefined): Option<T> — Create from nullable
 * - Option.some<T>(value: T): Option<T> — Create Some explicitly
 * - Option.none<T>(): Option<T> — Create None (singleton)
 * - Option.fromNullable<T>(value: T | null | undefined): Option<T> — Alias for of
 *
 * Bonus: Implement additional combinators:
 * - zip<U>(other: Option<U>): Option<[T, U]> — Combine two Options
 * - first<U>(other: Option<U>): Option<T> — Return this if both are Some
 * - second<U>(other: Option<U>): Option<U> — Return other if both are Some
 */

export abstract class Option<T> {
  abstract map<U>(fn: (value: T) => U): Option<U>;
  abstract flatMap<U>(fn: (value: T) => Option<U>): Option<U>;
  abstract filter(predicate: (value: T) => boolean): Option<T>;
  abstract getOrElse(defaultValue: T): T;
  abstract getOrThrow(error?: Error): T;
  abstract isSome(): boolean;
  abstract isNone(): boolean;
  abstract orElse(other: Option<T>): Option<T>;
  abstract orElseGet(fn: () => Option<T>): Option<T>;
  abstract forEach(fn: (value: T) => void): void;
  abstract toArray(): T[];
  
  static of<T>(value: T | null | undefined): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  static some<T>(value: T): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  static none<T>(): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  static fromNullable<T>(value: T | null | undefined): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
}

export class Some<T> extends Option<T> {
  constructor(value: T) {
    // YOUR CODE HERE
    super();
  }
  
  map<U>(fn: (value: T) => U): Option<U> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  flatMap<U>(fn: (value: T) => Option<U>): Option<U> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  filter(predicate: (value: T) => boolean): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  getOrElse(defaultValue: T): T {
    // YOUR CODE HERE
    return defaultValue;
  }
  
  getOrThrow(error?: Error): T {
    // YOUR CODE HERE
    throw error ?? new Error('Unexpected None');
  }
  
  isSome(): boolean {
    // YOUR CODE HERE
    return false;
  }
  
  isNone(): boolean {
    // YOUR CODE HERE
    return true;
  }
  
  orElse(other: Option<T>): Option<T> {
    // YOUR CODE HERE
    return other;
  }
  
  orElseGet(fn: () => Option<T>): Option<T> {
    // YOUR CODE HERE
    return fn();
  }
  
  forEach(fn: (value: T) => void): void {
    // YOUR CODE HERE
  }
  
  toArray(): T[] {
    // YOUR CODE HERE
    return [];
  }
}

export class None<T> extends Option<T> {
  map<U>(fn: (value: T) => U): Option<U> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  flatMap<U>(fn: (value: T) => Option<U>): Option<U> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  filter(predicate: (value: T) => boolean): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  getOrElse(defaultValue: T): T {
    // YOUR CODE HERE
    return defaultValue;
  }
  
  getOrThrow(error?: Error): T {
    // YOUR CODE HERE
    throw error ?? new Error('Attempted to get value from None');
  }
  
  isSome(): boolean {
    // YOUR CODE HERE
    return true;
  }
  
  isNone(): boolean {
    // YOUR CODE HERE
    return false;
  }
  
  orElse(other: Option<T>): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  orElseGet(fn: () => Option<T>): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  forEach(fn: (value: T) => void): void {
    // YOUR CODE HERE
  }
  
  toArray(): T[] {
    // YOUR CODE HERE
    return [];
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { Option, Some, None } from './challenge';

describe('Option', () => {
  describe('static methods', () => {
    it('Option.of creates Some for non-null values', () => {
      expect(Option.of(42).isSome()).toBe(true);
      expect(Option.of('hello').isSome()).toBe(true);
      expect(Option.of(0).isSome()).toBe(true);
      expect(Option.of(false).isSome()).toBe(true);
      expect(Option.of('').isSome()).toBe(true);
    });

    it('Option.of creates None for null/undefined', () => {
      expect(Option.of(null).isNone()).toBe(true);
      expect(Option.of(undefined).isNone()).toBe(true);
    });

    it('Option.some creates Some', () => {
      const some = Option.some(42);
      expect(some.isSome()).toBe(true);
      expect(some.isNone()).toBe(false);
    });

    it('Option.none creates None', () => {
      const none = Option.none();
      expect(none.isNone()).toBe(true);
      expect(none.isSome()).toBe(false);
    });

    it('Option.fromNullable is alias for of', () => {
      expect(Option.fromNullable(42).isSome()).toBe(true);
      expect(Option.fromNullable(null).isNone()).toBe(true);
    });
  });

  describe('Some', () => {
    it('map transforms value', () => {
      const result = Option.some(5).map(x => x * 2);
      expect(result.getOrElse(0)).toBe(10);
    });

    it('map chains multiple transformations', () => {
      const result = Option.some('hello')
        .map(s => s.toUpperCase())
        .map(s => s.length);
      expect(result.getOrElse(0)).toBe(5);
    });

    it('flatMap chains Option-returning functions', () => {
      const safeDivide = (a: number, b: number): Option<number> =>
        b === 0 ? Option.none() : Option.some(a / b);
      
      const result = Option.some(10)
        .flatMap(x => safeDivide(x, 2))
        .flatMap(x => safeDivide(x, 5));
      expect(result.getOrElse(0)).toBe(1);
    });

    it('flatMap returns None when function returns None', () => {
      const result = Option.some(10)
        .flatMap(() => Option.none<number>());
      expect(result.isNone()).toBe(true);
    });

    it('filter keeps value when predicate passes', () => {
      const result = Option.some(10).filter(x => x > 5);
      expect(result.isSome()).toBe(true);
    });

    it('filter returns None when predicate fails', () => {
      const result = Option.some(10).filter(x => x > 20);
      expect(result.isNone()).toBe(true);
    });

    it('getOrElse returns value for Some', () => {
      expect(Option.some(42).getOrElse(0)).toBe(42);
    });

    it('getOrThrow returns value for Some', () => {
      expect(Option.some(42).getOrThrow()).toBe(42);
    });

    it('orElse returns this for Some', () => {
      const result = Option.some(42).orElse(Option.some(99));
      expect(result.getOrElse(0)).toBe(42);
    });

    it('orElseGet does not evaluate fn for Some', () => {
      let called = false;
      const result = Option.some(42).orElseGet(() => {
        called = true;
        return Option.some(99);
      });
      expect(called).toBe(false);
      expect(result.getOrElse(0)).toBe(42);
    });

    it('forEach executes for Some', () => {
      let value: number | undefined;
      Option.some(42).forEach(v => { value = v; });
      expect(value).toBe(42);
    });

    it('toArray returns single-element array', () => {
      expect(Option.some(42).toArray()).toEqual([42]);
    });

    it('isSome returns true', () => {
      expect(Option.some(42).isSome()).toBe(true);
    });

    it('isNone returns false', () => {
      expect(Option.some(42).isNone()).toBe(false);
    });
  });

  describe('None', () => {
    it('map returns None', () => {
      const result = Option.none<number>().map(x => x * 2);
      expect(result.isNone()).toBe(true);
    });

    it('flatMap returns None', () => {
      const result = Option.none<number>().flatMap(x => Option.some(x * 2));
      expect(result.isNone()).toBe(true);
    });

    it('filter returns None', () => {
      const result = Option.none<number>().filter(() => true);
      expect(result.isNone()).toBe(true);
    });

    it('getOrElse returns default', () => {
      expect(Option.none<number>().getOrElse(42)).toBe(42);
    });

    it('getOrThrow throws', () => {
      expect(() => Option.none<number>().getOrThrow()).toThrow();
    });

    it('getOrThrow with custom error', () => {
      const customError = new Error('custom');
      try {
        Option.none<number>().getOrThrow(customError);
        expect.fail('Should have thrown');
      } catch (e) {
        expect(e).toBe(customError);
      }
    });

    it('orElse returns other', () => {
      const result = Option.none<number>().orElse(Option.some(42));
      expect(result.getOrElse(0)).toBe(42);
    });

    it('orElseGet evaluates fn', () => {
      let called = false;
      const result = Option.none<number>().orElseGet(() => {
        called = true;
        return Option.some(42);
      });
      expect(called).toBe(true);
      expect(result.getOrElse(0)).toBe(42);
    });

    it('forEach does not execute', () => {
      let called = false;
      Option.none<number>().forEach(() => { called = true; });
      expect(called).toBe(false);
    });

    it('toArray returns empty array', () => {
      expect(Option.none<number>().toArray()).toEqual([]);
    });

    it('isSome returns false', () => {
      expect(Option.none<number>().isSome()).toBe(false);
    });

    it('isNone returns true', () => {
      expect(Option.none<number>().isNone()).toBe(true);
    });
  });

  describe('chaining', () => {
    it('complex chain with Some', () => {
      const result = Option.some('  hello  ')
        .map(s => s.trim())
        .filter(s => s.length > 3)
        .map(s => s.toUpperCase())
        .getOrElse('DEFAULT');
      expect(result).toBe('HELLO');
    });

    it('chain breaks with None', () => {
      const result = Option.some('  hi  ')
        .map(s => s.trim())
        .filter(s => s.length > 3) // This returns None
        .map(s => s.toUpperCase()) // This is skipped
        .getOrElse('DEFAULT');
      expect(result).toBe('DEFAULT');
    });

    it('flatMap with failing operation', () => {
      const findUser = (id: number): Option<{ id: number; name: string }> =>
        id === 1 ? Option.some({ id: 1, name: 'Alice' }) : Option.none();
      
      const getUserEmail = (user: { id: number; name: string }): Option<string> =>
        user.name === 'Alice' ? Option.some('alice@example.com') : Option.none();
      
      const result = Option.some(1)
        .flatMap(findUser)
        .flatMap(getUserEmail)
        .getOrElse('no-email');
      expect(result).toBe('alice@example.com');
    });

    it('flatMap with missing user', () => {
      const findUser = (id: number): Option<{ id: number; name: string }> =>
        id === 1 ? Option.some({ id: 1, name: 'Alice' }) : Option.none();
      
      const result = Option.some(999)
        .flatMap(findUser)
        .flatMap(user => Option.some(user.name))
        .getOrElse('Unknown');
      expect(result).toBe('Unknown');
    });
  });

  describe('edge cases', () => {
    it('handles falsy values in Some', () => {
      expect(Option.some(0).getOrElse(99)).toBe(0);
      expect(Option.some(false).getOrElse(true)).toBe(false);
      expect(Option.some('').getOrElse('default')).toBe('');
      expect(Option.some(null as any).getOrElse('default')).toBe(null);
    });

    it('None singleton behavior', () => {
      const none1 = Option.none<number>();
      const none2 = Option.none<string>();
      // None should be singleton per type, but implementation may vary
      expect(none1.isNone()).toBe(true);
      expect(none2.isNone()).toBe(true);
    });

    it('nested Options', () => {
      const nested = Option.some(Option.some(42));
      const result = nested.flatMap(x => x);
      expect(result.getOrElse(0)).toBe(42);
    });

    it('map with expensive computation (lazy)', () => {
      let computed = false;
      const none = Option.none<number>();
      none.map(() => {
        computed = true;
        return 42;
      });
      expect(computed).toBe(false); // Should not compute for None
    });
  });

  describe('real-world scenarios', () => {
    it('parsing integers safely', () => {
      const parseIntSafe = (s: string): Option<number> => {
        const parsed = parseInt(s, 10);
        return isNaN(parsed) ? Option.none() : Option.some(parsed);
      };
      
      expect(parseIntSafe('42').getOrElse(0)).toBe(42);
      expect(parseIntSafe('not-a-number').getOrElse(0)).toBe(0);
    });

    it('finding array element safely', () => {
      const findFirst = <T>(arr: T[], predicate: (t: T) => boolean): Option<T> => {
        const found = arr.find(predicate);
        return Option.of(found);
      };
      
      const numbers = [1, 2, 3, 4, 5];
      expect(findFirst(numbers, n => n > 3).getOrElse(0)).toBe(4);
      expect(findFirst(numbers, n => n > 10).getOrElse(0)).toBe(0);
    });

    it('object property access', () => {
      const getUser = (): Option<{ name: string }> => Option.none();
      
      const result = getUser()
        .map(u => u.name)
        .getOrElse('Anonymous');
      expect(result).toBe('Anonymous');
    });

    it('division with error handling', () => {
      const safeDivide = (a: number, b: number): Option<number> =>
        b === 0 ? Option.none() : Option.some(a / b);
      
      expect(safeDivide(10, 2).getOrElse(0)).toBe(5);
      expect(safeDivide(10, 0).getOrElse(-1)).toBe(-1);
    });
  });
});
]=],
  },
  {
    name = "Middleware Chain",
    difficulty = "medium",
    stub = [==[
/**
 * Middleware Chain
 *
 * Implement a middleware composition system like Express.js, Koa, or Redux.
 *
 * Middleware functions are composable handlers that execute in sequence,
 * each receiving a context object and a `next` function to pass control
 * to the downstream middleware. This pattern enables:
 * - Request/response processing pipelines
 * - Authentication and authorization layers
 * - Logging, error handling, CORS
 * - Plugin and extension systems
 *
 * Implement the MiddlewareChain class with:
 * - constructor() — Initialize an empty middleware chain
 * - use(middleware: MiddlewareFn): MiddlewareChain — Add middleware to the chain.
 *   Returns this for chaining. Middleware receives (ctx, next) where:
 *   - ctx is a context object that middleware can read/modify
 *   - next() is a function that calls the next middleware in the chain
 * - run(ctx: object): Promise<void> — Execute all middleware in order.
 *   Each middleware must call next() to continue, unless it's terminal.
 * - onError(handler: (ctx: object, error: Error) => void | Promise<void>): MiddlewareChain
 *   Register an error handler. If any middleware throws, the error handler runs.
 * - clear(): void — Remove all middleware and error handlers.
 * - length(): number — Return the number of middleware in the chain.
 *
 * The chain should support async middleware and proper error propagation.
 * If a middleware doesn't call next(), the chain stops there.
 *
 * Bonus: Implement branched middleware with `when(condition, middleware)`
 * that only runs if the condition function returns true.
 */

export interface Context {
  [key: string]: any;
}

export type NextFn = () => Promise<void>;

export type MiddlewareFn = (ctx: Context, next: NextFn) => void | Promise<void>;

export type ErrorHandler = (ctx: Context, error: Error) => void | Promise<void>;

export class MiddlewareChain {
  constructor() {
    // YOUR CODE HERE
  }

  use(middleware: MiddlewareFn): MiddlewareChain {
    // YOUR CODE HERE
    return this;
  }

  async run(ctx: Context): Promise<void> {
    // YOUR CODE HERE
  }

  onError(handler: ErrorHandler): MiddlewareChain {
    // YOUR CODE HERE
    return this;
  }

  clear(): void {
    // YOUR CODE HERE
  }

  length(): number {
    // YOUR CODE HERE
    return 0;
  }

  when(condition: (ctx: Context) => boolean, middleware: MiddlewareFn): MiddlewareChain {
    // YOUR CODE HERE
    return this;
  }
}
]==],
    tests = [==[
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { MiddlewareChain, Context } from './challenge';

describe('MiddlewareChain', () => {
  let chain: MiddlewareChain;

  beforeEach(() => {
    chain = new MiddlewareChain();
  });

  it('runs middleware in order', async () => {
    const execution: number[] = [];
    chain.use(async (ctx, next) => {
      execution.push(1);
      await next();
      execution.push(10);
    });
    chain.use(async (ctx, next) => {
      execution.push(2);
      await next();
      execution.push(9);
    });
    chain.use(async (ctx, next) => {
      execution.push(3);
      await next();
      execution.push(8);
    });

    await chain.run({});
    expect(execution).toEqual([1, 2, 3, 8, 9, 10]);
  });

  it('passes context through middleware', async () => {
    chain.use(async (ctx, next) => {
      ctx.value1 = 'first';
      await next();
    });
    chain.use(async (ctx, next) => {
      ctx.value2 = 'second';
      await next();
    });
    chain.use(async (ctx, next) => {
      ctx.value3 = 'third';
      await next();
    });

    const ctx: Context = {};
    await chain.run(ctx);
    expect(ctx).toEqual({ value1: 'first', value2: 'second', value3: 'third' });
  });

  it('supports middleware that does not call next', async () => {
    const execution: number[] = [];
    chain.use(async (ctx, next) => {
      execution.push(1);
      await next();
      execution.push(10);
    });
    chain.use(async (ctx, next) => {
      execution.push(2);
      // Does not call next - chain stops here
      execution.push(9);
    });
    chain.use(async (ctx, next) => {
      execution.push(3);
      await next();
    });

    await chain.run({});
    expect(execution).toEqual([1, 2, 9, 10]);
  });

  it('returns this from use for chaining', () => {
    const result = chain.use(async (ctx, next) => {});
    expect(result).toBe(chain);
  });

  it('handles async middleware', async () => {
    const execution: string[] = [];
    chain.use(async (ctx, next) => {
      execution.push('start');
      await new Promise(resolve => setTimeout(resolve, 10));
      await next();
      execution.push('end');
    });
    chain.use(async (ctx, next) => {
      execution.push('middle');
      await next();
    });

    await chain.run({});
    expect(execution).toEqual(['start', 'middle', 'end']);
  });

  it('catches errors with onError handler', async () => {
    const error = new Error('test error');
    let caughtError: Error | null = null;
    let errorCtx: Context | null = null;

    chain.use(async (ctx, next) => {
      ctx.before = true;
      await next();
    });
    chain.use(async () => {
      throw error;
    });
    chain.use(async (ctx) => {
      ctx.after = true; // Should not run
    });
    chain.onError((ctx, err) => {
      caughtError = err;
      errorCtx = ctx;
    });

    const ctx: Context = {};
    await chain.run(ctx);
    expect(caughtError).toBe(error);
    expect(errorCtx?.before).toBe(true);
    expect(ctx.after).toBeUndefined();
  });

  it('onError returns this for chaining', () => {
    const result = chain.onError(() => {});
    expect(result).toBe(chain);
  });

  it('multiple error handlers all run', async () => {
    const errors: Error[] = [];
    chain.use(async () => {
      throw new Error('test');
    });
    chain.onError(() => { errors.push(new Error('handler1')); });
    chain.onError(() => { errors.push(new Error('handler2')); });

    await chain.run({});
    expect(errors).toHaveLength(2);
  });

  it('clear removes all middleware', async () => {
    const execution: number[] = [];
    chain.use(async (ctx, next) => { execution.push(1); await next(); });
    chain.use(async (ctx, next) => { execution.push(2); await next(); });
    chain.clear();
    chain.use(async (ctx, next) => { execution.push(3); await next(); });

    await chain.run({});
    expect(execution).toEqual([3]);
  });

  it('length returns middleware count', () => {
    expect(chain.length()).toBe(0);
    chain.use(async (ctx, next) => {});
    expect(chain.length()).toBe(1);
    chain.use(async (ctx, next) => {});
    expect(chain.length()).toBe(2);
    chain.clear();
    expect(chain.length()).toBe(0);
  });

  it('when conditionally runs middleware', async () => {
    const execution: string[] = [];
    chain.when(ctx => ctx.run === true, async (ctx, next) => {
      execution.push('conditional');
      await next();
    });
    chain.use(async (ctx, next) => {
      execution.push('always');
      await next();
    });

    await chain.run({ run: true });
    expect(execution).toEqual(['conditional', 'always']);

    execution.length = 0;
    await chain.run({ run: false });
    expect(execution).toEqual(['always']);
  });

  it('when with false condition skips middleware', async () => {
    chain.use(async (ctx, next) => {
      ctx.skipped = true;
      await next();
    });
    chain.when(() => false, async (ctx) => {
      ctx.shouldNotRun = true;
    });
    chain.use(async (ctx, next) => {
      ctx.after = true;
      await next();
    });

    const ctx: Context = {};
    await chain.run(ctx);
    expect(ctx.skipped).toBe(true);
    expect(ctx.after).toBe(true);
    expect(ctx.shouldNotRun).toBeUndefined();
  });

  it('empty chain runs without error', async () => {
    await expect(chain.run({})).resolves.toBeUndefined();
  });

  it('error in middleware after next() is caught', async () => {
    let caughtError: Error | null = null;
    chain.use(async (ctx, next) => {
      await next();
      throw new Error('after next');
    });
    chain.use(async (ctx, next) => {
      await next();
    });
    chain.onError((ctx, err) => {
      caughtError = err;
    });

    await chain.run({});
    expect(caughtError?.message).toBe('after next');
  });

  it('can modify context in multiple middleware', async () => {
    chain.use(async (ctx, next) => {
      ctx.count = (ctx.count || 0) + 1;
      await next();
    });
    chain.use(async (ctx, next) => {
      ctx.count = (ctx.count || 0) + 1;
      await next();
    });
    chain.use(async (ctx, next) => {
      ctx.count = (ctx.count || 0) + 1;
      await next();
    });

    const ctx: Context = { count: 0 };
    await chain.run(ctx);
    expect(ctx.count).toBe(3);
  });

  it('supports synchronous middleware', async () => {
    const execution: number[] = [];
    chain.use((ctx, next) => {
      execution.push(1);
      next();
      execution.push(10);
    });
    chain.use((ctx, next) => {
      execution.push(2);
      next();
      execution.push(9);
    });

    await chain.run({});
    expect(execution).toEqual([1, 2, 9, 10]);
  });

  it('error handler can fix and continue', async () => {
    let recovered = false;
    chain.use(async (ctx, next) => {
      try {
        await next();
      } catch (err) {
        ctx.recovered = true;
        recovered = true;
      }
    });
    chain.use(async () => {
      throw new Error('fail');
    });

    const ctx: Context = {};
    await chain.run(ctx);
    expect(recovered).toBe(true);
    expect(ctx.recovered).toBe(true);
  });

  it('complex middleware composition', async () => {
    const log: string[] = [];
    
    chain.use(async (ctx, next) => {
      log.push('auth-start');
      ctx.authenticated = true;
      await next();
      log.push('auth-end');
    });
    
    chain.when(ctx => ctx.authenticated, async (ctx, next) => {
      log.push('check-permissions');
      ctx.hasPermission = true;
      await next();
    });
    
    chain.use(async (ctx, next) => {
      log.push('logger-start');
      await next();
      log.push('logger-end');
    });
    
    chain.onError((ctx, err) => {
      log.push(`error: ${err.message}`);
    });

    await chain.run({});
    expect(log).toEqual([
      'auth-start',
      'check-permissions',
      'logger-start',
      'logger-end',
      'auth-end'
    ]);
  });

  it('stress test with many middleware', async () => {
    const execution: number[] = [];
    for (let i = 0; i < 50; i++) {
      chain.use(async (ctx, next) => {
        execution.push(i);
        await next();
        execution.push(100 + i);
      });
    }

    await chain.run({});
    expect(execution.length).toBe(100);
    expect(execution.slice(0, 50)).toEqual(Array.from({ length: 50 }, (_, i) => i));
    expect(execution.slice(50)).toEqual(Array.from({ length: 50 }, (_, i) => 100 + (49 - i)));
  });
});
]==],
  },
{
    name = "Curry and Pipe",
    difficulty = "medium",
    stub = [=[
/**
 * Curry and Pipe
 *
 * Implement functional programming utilities for function composition
 * and partial application.
 *
 * Curry: Transform a function with multiple arguments into a sequence
 * of functions that each take a single argument.
 * - curry(fn): Returns a curried version that can be called incrementally
 * - Supports partial application: curry(fn)(a)(b)(c) or curry(fn)(a, b)(c)
 *
 * Pipe: Compose functions left-to-right where output of one becomes input of next.
 * - pipe(f, g, h)(x) === h(g(f(x)))
 * - Supports any number of functions
 * - Type-safe composition
 *
 * Implement:
 * - curry<T extends (...args: any[]) => any>(fn: T): Curried<T>
 *   Return a curried function that accepts arguments incrementally.
 *   When all arguments are provided, execute the original function.
 *
 * - pipe<A, B>(f: (a: A) => B): (a: A) => B
 *   pipe<A, B, C>(f: (a: A) => B, g: (b: B) => C): (a: A) => C
 *   pipe<A, B, C, D>(f: (a: A) => B, g: (b: B) => C, h: (c: C) => D): (a: A) => D
 *   Compose functions left-to-right.
 *
 * - compose<A, B>(g: (b: B) => A, f: (a: A) => B): (a: A) => A
 *   Compose functions right-to-left (mathematical composition order).
 *
 * Bonus: Implement curryN for explicit arity control and pipeAsync for async functions.
 */

export function curry<T extends (...args: any[]) => any>(fn: T): any {
  // YOUR CODE HERE
  return fn;
}

export function pipe<A, B>(f: (a: A) => B): (a: A) => B;
export function pipe<A, B, C>(f: (a: A) => B, g: (b: B) => C): (a: A) => C;
export function pipe<A, B, C, D>(f: (a: A) => B, g: (b: B) => C, h: (c: C) => D): (a: A) => D;
export function pipe(...fns: Function[]): Function {
  // YOUR CODE HERE
  return (x: any) => x;
}

export function compose<A, B>(g: (b: B) => A, f: (a: A) => B): (a: A) => A {
  // YOUR CODE HERE
  return (x: A) => x;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { curry, pipe, compose } from './challenge';

describe('curry', () => {
  it('curries a function with 2 arguments', () => {
    const add = (a: number, b: number) => a + b;
    const curriedAdd = curry(add);
    expect(curriedAdd(2)(3)).toBe(5);
  });

  it('curries a function with 3 arguments', () => {
    const add3 = (a: number, b: number, c: number) => a + b + c;
    const curried = curry(add3);
    expect(curried(1)(2)(3)).toBe(6);
  });

  it('supports partial application', () => {
    const add = (a: number, b: number) => a + b;
    const curriedAdd = curry(add);
    const add5 = curriedAdd(5);
    expect(add5(3)).toBe(8);
    expect(add5(10)).toBe(15);
  });

  it('supports partial application with multiple args at once', () => {
    const add3 = (a: number, b: number, c: number) => a + b + c;
    const curried = curry(add3);
    expect(curried(1, 2)(3)).toBe(6);
    expect(curried(1)(2, 3)).toBe(6);
    expect(curried(1, 2, 3)).toBe(6);
  });

  it('works with string concatenation', () => {
    const concat = (a: string, b: string, c: string) => a + b + c;
    const curried = curry(concat);
    expect(curried('Hello')(' ')('World')).toBe('Hello World');
  });

  it('curries a function with 4 arguments', () => {
    const fn = (a: number, b: number, c: number, d: number) => a * b + c - d;
    const curried = curry(fn);
    expect(curried(2)(3)(4)(5)).toBe(5); // 2*3+4-5=5
  });

  it('returns same result as original function', () => {
    const multiply = (a: number, b: number, c: number) => a * b * c;
    const curried = curry(multiply);
    expect(curried(2)(3)(4)).toBe(multiply(2, 3, 4));
  });

  it('curried function can be reused', () => {
    const add = (a: number, b: number) => a + b;
    const curriedAdd = curry(add);
    const add10 = curriedAdd(10);
    expect(add10(5)).toBe(15);
    expect(add10(20)).toBe(30);
  });

  it('handles functions with different argument patterns', () => {
    const fn = (a: string, b: number) => a.repeat(b);
    const curried = curry(fn);
    expect(curried('x')(3)).toBe('xxx');
  });

  it('curry with 5 arguments', () => {
    const fn = (a: number, b: number, c: number, d: number, e: number) => 
      a + b + c + d + e;
    const curried = curry(fn);
    expect(curried(1)(2)(3)(4)(5)).toBe(15);
  });
});

describe('pipe', () => {
  it('pipes a single function', () => {
    const double = (x: number) => x * 2;
    const fn = pipe(double);
    expect(fn(5)).toBe(10);
  });

  it('pipes two functions', () => {
    const double = (x: number) => x * 2;
    const addOne = (x: number) => x + 1;
    const fn = pipe(double, addOne);
    expect(fn(5)).toBe(11); // (5*2)+1=11
  });

  it('pipes three functions', () => {
    const double = (x: number) => x * 2;
    const addOne = (x: number) => x + 1;
    const square = (x: number) => x * x;
    const fn = pipe(double, addOne, square);
    expect(fn(5)).toBe(121); // ((5*2)+1)^2=121
  });

  it('pipes with string transformations', () => {
    const toUpper = (s: string) => s.toUpperCase();
    const addExclaim = (s: string) => s + '!';
    const fn = pipe(toUpper, addExclaim);
    expect(fn('hello')).toBe('HELLO!');
  });

  it('pipes four functions', () => {
    const add = (x: number) => x + 1;
    const double = (x: number) => x * 2;
    const subtract = (x: number) => x - 3;
    const square = (x: number) => x * x;
    const fn = pipe(add, double, subtract, square);
    expect(fn(5)).toBe(81); // (((5+1)*2)-3)^2=81
  });

  it('pipe identity with no functions', () => {
    const fn = pipe();
    expect(fn(42)).toBe(42);
    expect(fn('test')).toBe('test');
  });

  it('pipe preserves types through chain', () => {
    const parse = (s: string) => parseInt(s, 10);
    const double = (n: number) => n * 2;
    const toString = (n: number) => n.toString();
    const fn = pipe(parse, double, toString);
    expect(fn('21')).toBe('42');
  });

  it('pipe with object transformations', () => {
    const addName = (obj: { age: number }) => ({ ...obj, name: 'Alice' });
    const addAge = (obj: {}) => ({ ...obj, age: 30 });
    const fn = pipe(addAge, addName);
    expect(fn({})).toEqual({ name: 'Alice', age: 30 });
  });
});

describe('compose', () => {
  it('composes two functions (right-to-left)', () => {
    const double = (x: number) => x * 2;
    const addOne = (x: number) => x + 1;
    const fn = compose(addOne, double);
    expect(fn(5)).toBe(11); // addOne(double(5))=addOne(10)=11
  });

  it('compose is pipe in reverse order', () => {
    const f = (x: number) => x + 1;
    const g = (x: number) => x * 2;
    const h = (x: number) => x - 3;
    const piped = pipe(f, g, h);
    const composed = compose(h, compose(g, f));
    expect(piped(5)).toBe(9); // ((5+1)*2)-3=9
    expect(composed(5)).toBe(9);
  });

  it('compose with string functions', () => {
    const toUpper = (s: string) => s.toUpperCase();
    const reverse = (s: string) => s.split('').reverse().join('');
    const fn = compose(reverse, toUpper);
    expect(fn('hello')).toBe('OLLEH'); // reverse(toUpper('hello'))
  });
});

describe('combined curry and pipe', () => {
  it('curried functions in pipe', () => {
    const add = (a: number, b: number) => a + b;
    const multiply = (a: number, b: number) => a * b;
    const curriedAdd = curry(add);
    const curriedMultiply = curry(multiply);
    const add5 = curriedAdd(5);
    const multiplyBy2 = curriedMultiply(2);
    const fn = pipe(add5, multiplyBy2);
    expect(fn(3)).toBe(16); // (3+5)*2=16
  });

  it('complex pipeline with curried functions', () => {
    const add = (a: number, b: number) => a + b;
    const multiply = (a: number, b: number) => a * b;
    const subtract = (a: number, b: number) => a - b;
    
    const curriedAdd = curry(add);
    const curriedMultiply = curry(multiply);
    const curriedSubtract = curry(subtract);
    
    const fn = pipe(
      curriedAdd(10),
      curriedMultiply(2),
      curriedSubtract(5)
    );
    expect(fn(5)).toBe(25); // ((5+10)*2)-5=25
  });
});

describe('edge cases', () => {
  it('curry with zero arguments function', () => {
    const fn = () => 42;
    const curried = curry(fn);
    expect(curried()).toBe(42);
  });

  it('pipe with identity-like functions', () => {
    const id = (x: number) => x;
    const fn = pipe(id, id, id);
    expect(fn(42)).toBe(42);
  });

  it('curry preserves function name', () => {
    function namedFn(a: number, b: number) { return a + b; }
    const curried = curry(namedFn);
    // The curried function should still work correctly
    expect(curried(1)(2)).toBe(3);
  });

  it('pipe handles null/undefined in chain', () => {
    const toNull = () => null;
    const fn = pipe(toNull);
    expect(fn()).toBeNull();
  });
});
]=],
  },
  {
    name = "Sliding Window Maximum",
    difficulty = "medium",
    stub = [=[
/**
 * Sliding Window Maximum
 *
 * Implement an efficient sliding window maximum algorithm.
 *
 * Given an array of integers and a window size k, return an array containing
 * the maximum value in each sliding window of size k as it moves from left
 * to right across the array.
 *
 * Example:
 *   nums = [1, 3, -1, -3, 5, 3, 6, 7], k = 3
 *   windows: [1, 3, -1], [3, -1, -3], [-1, -3, 5], [-3, 5, 3], [5, 3, 6], [3, 6, 7]
 *   maxes:   [3],         [3],         [5],         [5],         [6],         [7]
 *   result: [3, 3, 5, 5, 6, 7]
 *
 * Implement:
 * - maxSlidingWindow(nums: number[], k: number): number[]
 *   Return array of maximums for each window position.
 *
 * - maxSlidingWindowOptimized(nums: number[], k: number): number[]
 *   Use a monotonic deque for O(n) time complexity instead of O(n*k).
 *   The deque stores indices, maintaining decreasing order of values.
 *
 * - minSlidingWindow(nums: number[], k: number): number[]
 *   Same problem but find minimums instead of maximums.
 *
 * Constraints:
 * - 1 <= k <= nums.length
 * - nums can contain negative numbers
 * - Empty array returns empty array
 *
 * The optimized solution should use a deque (double-ended queue) where:
 * - Remove indices outside the current window from the front
 * - Remove indices of elements smaller than current from the back
 * - The front always has the index of the maximum element
 */

export function maxSlidingWindow(nums: number[], k: number): number[] {
  // YOUR CODE HERE
  return [];
}

export function maxSlidingWindowOptimized(nums: number[], k: number): number[] {
  // YOUR CODE HERE
  return [];
}

export function minSlidingWindow(nums: number[], k: number): number[] {
  // YOUR CODE HERE
  return [];
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { maxSlidingWindow, maxSlidingWindowOptimized, minSlidingWindow } from './challenge';

describe('maxSlidingWindow', () => {
  it('basic example', () => {
    const nums = [1, 3, -1, -3, 5, 3, 6, 7];
    const k = 3;
    expect(maxSlidingWindow(nums, k)).toEqual([3, 3, 5, 5, 6, 7]);
  });

  it('window size equals array length', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 5;
    expect(maxSlidingWindow(nums, k)).toEqual([5]);
  });

  it('window size of 1', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 1;
    expect(maxSlidingWindow(nums, k)).toEqual([1, 2, 3, 4, 5]);
  });

  it('all same values', () => {
    const nums = [5, 5, 5, 5, 5];
    const k = 3;
    expect(maxSlidingWindow(nums, k)).toEqual([5, 5, 5]);
  });

  it('decreasing array', () => {
    const nums = [5, 4, 3, 2, 1];
    const k = 3;
    expect(maxSlidingWindow(nums, k)).toEqual([5, 4, 3]);
  });

  it('increasing array', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 3;
    expect(maxSlidingWindow(nums, k)).toEqual([3, 4, 5]);
  });

  it('with negative numbers', () => {
    const nums = [-1, -2, -3, -4, -5];
    const k = 2;
    expect(maxSlidingWindow(nums, k)).toEqual([-1, -2, -3, -4]);
  });

  it('mixed positive and negative', () => {
    const nums = [10, -5, 3, -2, 8, -1, 6];
    const k = 4;
    expect(maxSlidingWindow(nums, k)).toEqual([10, 8, 8]);
  });

  it('single element array', () => {
    const nums = [42];
    const k = 1;
    expect(maxSlidingWindow(nums, k)).toEqual([42]);
  });

  it('empty array', () => {
    expect(maxSlidingWindow([], 1)).toEqual([]);
  });

  it('two elements', () => {
    const nums = [1, 2];
    expect(maxSlidingWindow(nums, 1)).toEqual([1, 2]);
    expect(maxSlidingWindow(nums, 2)).toEqual([2]);
  });

  it('large window at end', () => {
    const nums = [1, 2, 3, 100, 50];
    const k = 4;
    expect(maxSlidingWindow(nums, k)).toEqual([100, 100]);
  });
});

describe('maxSlidingWindowOptimized', () => {
  it('basic example', () => {
    const nums = [1, 3, -1, -3, 5, 3, 6, 7];
    const k = 3;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([3, 3, 5, 5, 6, 7]);
  });

  it('window size equals array length', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 5;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([5]);
  });

  it('window size of 1', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 1;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([1, 2, 3, 4, 5]);
  });

  it('all same values', () => {
    const nums = [5, 5, 5, 5, 5];
    const k = 3;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([5, 5, 5]);
  });

  it('decreasing array', () => {
    const nums = [5, 4, 3, 2, 1];
    const k = 3;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([5, 4, 3]);
  });

  it('increasing array', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 3;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([3, 4, 5]);
  });

  it('with negative numbers', () => {
    const nums = [-1, -2, -3, -4, -5];
    const k = 2;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([-1, -2, -3, -4]);
  });

  it('mixed positive and negative', () => {
    const nums = [10, -5, 3, -2, 8, -1, 6];
    const k = 4;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([10, 8, 8]);
  });

  it('single element array', () => {
    const nums = [42];
    const k = 1;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([42]);
  });

  it('empty array', () => {
    expect(maxSlidingWindowOptimized([], 1)).toEqual([]);
  });

  it('matches naive implementation', () => {
    const testCases = [
      [[1, 3, -1, -3, 5, 3, 6, 7], 3],
      [[1, 2, 3, 4, 5], 2],
      [[5, 4, 3, 2, 1], 4],
      [[-10, -20, -30, -40], 2],
      [[100, 1, 2, 3, 4, 5, 6, 7, 8], 5],
    ];
    
    for (const [nums, k] of testCases) {
      expect(maxSlidingWindowOptimized(nums as number[], k as number))
        .toEqual(maxSlidingWindow(nums as number[], k as number));
    }
  });

  it('stress test with large array', () => {
    const nums = Array.from({ length: 1000 }, (_, i) => i % 100);
    const k = 50;
    const result = maxSlidingWindowOptimized(nums, k);
    expect(result.length).toBe(1000 - k + 1);
    // Each window max should be 99 (since we cycle 0-99)
    for (const max of result) {
      expect(max).toBeLessThanOrEqual(99);
      expect(max).toBeGreaterThanOrEqual(0);
    }
  });
});

describe('minSlidingWindow', () => {
  it('basic example', () => {
    const nums = [1, 3, -1, -3, 5, 3, 6, 7];
    const k = 3;
    expect(minSlidingWindow(nums, k)).toEqual([-1, -3, -3, -3, 3, 3]);
  });

  it('window size equals array length', () => {
    const nums = [5, 2, 8, 1, 9];
    const k = 5;
    expect(minSlidingWindow(nums, k)).toEqual([1]);
  });

  it('window size of 1', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 1;
    expect(minSlidingWindow(nums, k)).toEqual([1, 2, 3, 4, 5]);
  });

  it('all same values', () => {
    const nums = [5, 5, 5, 5, 5];
    const k = 3;
    expect(minSlidingWindow(nums, k)).toEqual([5, 5, 5]);
  });

  it('decreasing array', () => {
    const nums = [5, 4, 3, 2, 1];
    const k = 3;
    expect(minSlidingWindow(nums, k)).toEqual([3, 2, 1]);
  });

  it('increasing array', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 3;
    expect(minSlidingWindow(nums, k)).toEqual([1, 2, 3]);
  });

  it('with negative numbers', () => {
    const nums = [-1, -2, -3, -4, -5];
    const k = 2;
    expect(minSlidingWindow(nums, k)).toEqual([-2, -3, -4, -5]);
  });

  it('single element array', () => {
    const nums = [42];
    const k = 1;
    expect(minSlidingWindow(nums, k)).toEqual([42]);
  });

  it('empty array', () => {
    expect(minSlidingWindow([], 1)).toEqual([]);
  });

  it('stress test', () => {
    const nums = Array.from({ length: 500 }, (_, i) => 500 - i);
    const k = 100;
    const result = minSlidingWindow(nums, k);
    expect(result.length).toBe(500 - k + 1);
    // First window min should be 401 (500-99)
    expect(result[0]).toBe(401);
    // Last window min should be 1
    expect(result[result.length - 1]).toBe(1);
  });
});

describe('edge cases', () => {
  it('k equals 1 for all functions', () => {
    const nums = [5, 2, 8, 1, 9];
    expect(maxSlidingWindow(nums, 1)).toEqual(nums);
    expect(maxSlidingWindowOptimized(nums, 1)).toEqual(nums);
    expect(minSlidingWindow(nums, 1)).toEqual(nums);
  });

  it('k equals array length', () => {
    const nums = [3, 1, 4, 1, 5, 9, 2, 6];
    const k = nums.length;
    expect(maxSlidingWindow(nums, k)).toEqual([Math.max(...nums)]);
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([Math.max(...nums)]);
    expect(minSlidingWindow(nums, k)).toEqual([Math.min(...nums)]);
  });

  it('very large numbers', () => {
    const nums = [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 0];
    const k = 2;
    expect(maxSlidingWindow(nums, k)).toEqual([Number.MAX_SAFE_INTEGER, 0]);
    expect(minSlidingWindow(nums, k)).toEqual([Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER]);
  });

  it('floating point numbers', () => {
    const nums = [1.5, 3.7, -2.1, 0.5];
    const k = 2;
    expect(maxSlidingWindow(nums, k)).toEqual([3.7, 3.7, 0.5]);
    expect(minSlidingWindow(nums, k)).toEqual([1.5, -2.1, -2.1]);
  });
});
]=],
  },
  {
    name = "Hash Map from Scratch",
    difficulty = "easy",
    stub = [=[
/**
 * Hash Map from Scratch
 *
 * Implement a hash map (dictionary) data structure from scratch.
 *
 * A hash map stores key-value pairs and provides average O(1) lookup,
 * insertion, and deletion. This is one of the most fundamental data
 * structures in computer science, used in:
 * - Database indexing
 * - Caching systems
 * - Symbol tables in compilers
 * - Counting frequencies
 * - Deduplication
 *
 * Implement the HashMap class with:
 * - constructor(capacity?: number) — Initialize with optional initial capacity
 * - put(key: string, value: any): void — Insert or update a key-value pair
 * - get(key: string): any | undefined — Return value for key, or undefined
 * - delete(key: string): boolean — Remove key, return true if existed
 * - has(key: string): boolean — Check if key exists
 * - size(): number — Return number of entries
 * - keys(): string[] — Return all keys
 * - values(): any[] — Return all values
 * - entries(): [string, any][] — Return all [key, value] pairs
 * - clear(): void — Remove all entries
 *
 * Handle collisions using chaining (linked list or array at each bucket).
 * Implement automatic resizing when load factor exceeds 0.75.
 * Use a simple hash function (e.g., DJB2 or FNV-1a).
 *
 * Bonus: Implement getOrSet(key: string, defaultValue: any): any that
 * returns existing value or sets and returns default if missing.
 */

export class HashMap {
  constructor(capacity?: number) {
    // YOUR CODE HERE
  }

  put(key: string, value: any): void {
    // YOUR CODE HERE
  }

  get(key: string): any | undefined {
    // YOUR CODE HERE
    return undefined;
  }

  delete(key: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  has(key: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }

  keys(): string[] {
    // YOUR CODE HERE
    return [];
  }

  values(): any[] {
    // YOUR CODE HERE
    return [];
  }

  entries(): [string, any][] {
    // YOUR CODE HERE
    return [];
  }

  clear(): void {
    // YOUR CODE HERE
  }

  getOrSet(key: string, defaultValue: any): any {
    // YOUR CODE HERE
    return defaultValue;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { HashMap } from './challenge';

describe('HashMap', () => {
  it('creates empty map', () => {
    const map = new HashMap();
    expect(map.size()).toBe(0);
    expect(map.keys()).toEqual([]);
    expect(map.values()).toEqual([]);
    expect(map.entries()).toEqual([]);
  });

  it('put and get single value', () => {
    const map = new HashMap();
    map.put('key', 'value');
    expect(map.get('key')).toBe('value');
    expect(map.size()).toBe(1);
  });

  it('put and get multiple values', () => {
    const map = new HashMap();
    map.put('a', 1);
    map.put('b', 2);
    map.put('c', 3);
    expect(map.get('a')).toBe(1);
    expect(map.get('b')).toBe(2);
    expect(map.get('c')).toBe(3);
    expect(map.size()).toBe(3);
  });

  it('update existing key', () => {
    const map = new HashMap();
    map.put('key', 'first');
    map.put('key', 'second');
    expect(map.get('key')).toBe('second');
    expect(map.size()).toBe(1);
  });

  it('get returns undefined for missing key', () => {
    const map = new HashMap();
    expect(map.get('missing')).toBeUndefined();
  });

  it('has returns correct boolean', () => {
    const map = new HashMap();
    map.put('key', 'value');
    expect(map.has('key')).toBe(true);
    expect(map.has('missing')).toBe(false);
  });

  it('delete existing key', () => {
    const map = new HashMap();
    map.put('key', 'value');
    expect(map.delete('key')).toBe(true);
    expect(map.has('key')).toBe(false);
    expect(map.size()).toBe(0);
  });

  it('delete non-existing key', () => {
    const map = new HashMap();
    expect(map.delete('missing')).toBe(false);
  });

  it('keys returns all keys', () => {
    const map = new HashMap();
    map.put('a', 1);
    map.put('b', 2);
    map.put('c', 3);
    const keys = map.keys().sort();
    expect(keys).toEqual(['a', 'b', 'c']);
  });

  it('values returns all values', () => {
    const map = new HashMap();
    map.put('a', 1);
    map.put('b', 2);
    map.put('c', 3);
    const values = map.values().sort((a, b) => a - b);
    expect(values).toEqual([1, 2, 3]);
  });

  it('entries returns all pairs', () => {
    const map = new HashMap();
    map.put('a', 1);
    map.put('b', 2);
    const entries = map.entries().sort((a, b) => a[0].localeCompare(b[0]));
    expect(entries).toEqual([['a', 1], ['b', 2]]);
  });

  it('clear removes all entries', () => {
    const map = new HashMap();
    map.put('a', 1);
    map.put('b', 2);
    map.clear();
    expect(map.size()).toBe(0);
    expect(map.keys()).toEqual([]);
  });

  it('getOrSet returns existing value', () => {
    const map = new HashMap();
    map.put('key', 'existing');
    expect(map.getOrSet('key', 'default')).toBe('existing');
    expect(map.size()).toBe(1);
  });

  it('getOrSet sets and returns default', () => {
    const map = new HashMap();
    expect(map.getOrSet('key', 'default')).toBe('default');
    expect(map.get('key')).toBe('default');
    expect(map.size()).toBe(1);
  });

  it('handles collision with same hash', () => {
    const map = new HashMap();
    // These keys will likely collide in a small hash map
    for (let i = 0; i < 100; i++) {
      map.put(`key${i}`, i);
    }
    expect(map.size()).toBe(100);
    for (let i = 0; i < 100; i++) {
      expect(map.get(`key${i}`)).toBe(i);
    }
  });

  it('handles various value types', () => {
    const map = new HashMap();
    map.put('string', 'hello');
    map.put('number', 42);
    map.put('boolean', true);
    map.put('null', null);
    map.put('undefined', undefined);
    map.put('object', { a: 1 });
    map.put('array', [1, 2, 3]);
    
    expect(map.get('string')).toBe('hello');
    expect(map.get('number')).toBe(42);
    expect(map.get('boolean')).toBe(true);
    expect(map.get('null')).toBeNull();
    expect(map.get('undefined')).toBeUndefined();
    expect(map.get('object')).toEqual({ a: 1 });
    expect(map.get('array')).toEqual([1, 2, 3]);
  });

  it('handles empty string key', () => {
    const map = new HashMap();
    map.put('', 'empty key');
    expect(map.get('')).toBe('empty key');
    expect(map.has('')).toBe(true);
  });

  it('handles special characters in keys', () => {
    const map = new HashMap();
    map.put('key with spaces', 'value1');
    map.put('key\nwith\nnewlines', 'value2');
    map.put('key\twith\ttabs', 'value3');
    map.put('unicode-🎉-emoji', 'value4');
    
    expect(map.get('key with spaces')).toBe('value1');
    expect(map.get('key\nwith\nnewlines')).toBe('value2');
    expect(map.get('key\twith\ttabs')).toBe('value3');
    expect(map.get('unicode-🎉-emoji')).toBe('value4');
  });

  it('initial capacity works', () => {
    const map = new HashMap(64);
    for (let i = 0; i < 50; i++) {
      map.put(`key${i}`, i);
    }
    expect(map.size()).toBe(50);
  });

  it('stress test with many operations', () => {
    const map = new HashMap();
    const n = 1000;
    
    // Insert
    for (let i = 0; i < n; i++) {
      map.put(`key${i}`, i * 2);
    }
    expect(map.size()).toBe(n);
    
    // Read
    for (let i = 0; i < n; i++) {
      expect(map.get(`key${i}`)).toBe(i * 2);
    }
    
    // Update
    for (let i = 0; i < n; i++) {
      map.put(`key${i}`, i * 3);
    }
    for (let i = 0; i < n; i++) {
      expect(map.get(`key${i}`)).toBe(i * 3);
    }
    
    // Delete half
    for (let i = 0; i < n; i += 2) {
      map.delete(`key${i}`);
    }
    expect(map.size()).toBe(n / 2);
  });
});

describe('edge cases', () => {
  it('constructor with zero capacity', () => {
    const map = new HashMap(0);
    map.put('key', 'value');
    expect(map.get('key')).toBe('value');
  });

  it('delete all keys', () => {
    const map = new HashMap();
    map.put('a', 1);
    map.put('b', 2);
    map.put('c', 3);
    map.delete('a');
    map.delete('b');
    map.delete('c');
    expect(map.size()).toBe(0);
    expect(map.keys()).toEqual([]);
  });

  it('put after clear', () => {
    const map = new HashMap();
    map.put('a', 1);
    map.clear();
    map.put('b', 2);
    expect(map.size()).toBe(1);
    expect(map.get('b')).toBe(2);
    expect(map.has('a')).toBe(false);
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
 * Implement the classic dynamic programming algorithm for measuring
 * string similarity through minimum edit operations.
 *
 * The edit distance between two strings is the minimum number of operations
 * required to transform one string into the other, where allowed operations are:
 * - Insert a character
 * - Delete a character
 * - Replace a character
 *
 * This algorithm is fundamental to:
 * - Spell checkers and autocorrect
 * - DNA sequence alignment in bioinformatics
 * - Diff tools and version control
 * - Fuzzy string matching
 * - Natural language processing
 *
 * Implement:
 * - minDistance(word1: string, word2: string): number
 *   Return the minimum number of operations to convert word1 to word2.
 *
 * - minDistanceWithOps(word1: string, word2: string): { distance: number, operations: Operation[] }
 *   Return both the distance and the actual sequence of operations.
 *   Operation types: { type: 'insert' | 'delete' | 'replace' | 'match', index: number, char?: string }
 *
 * - isOneEditDistance(s: string, t: string): boolean
 *   Check if two strings are exactly one edit away from each other.
 *   Optimized O(min(m,n)) solution without full DP table.
 *
 * - longestCommonSubsequence(text1: string, text2: string): number
 *   Related DP problem: find the length of the longest common subsequence.
 *   A subsequence maintains relative order but doesn't need to be contiguous.
 *
 * Use a 2D DP table where dp[i][j] represents the edit distance between
 * word1[0..i-1] and word2[0..j-1].
 *
 * Bonus: Implement wildcard matching support where '?' matches any single character.
 */

export function minDistance(word1: string, word2: string): number {
  // YOUR CODE HERE
  return 0;
}

export interface Operation {
  type: 'insert' | 'delete' | 'replace' | 'match';
  index: number;
  char?: string;
}

export interface EditResult {
  distance: number;
  operations: Operation[];
}

export function minDistanceWithOps(word1: string, word2: string): EditResult {
  // YOUR CODE HERE
  return { distance: 0, operations: [] };
}

export function isOneEditDistance(s: string, t: string): boolean {
  // YOUR CODE HERE
  return false;
}

export function longestCommonSubsequence(text1: string, text2: string): number {
  // YOUR CODE HERE
  return 0;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { minDistance, minDistanceWithOps, isOneEditDistance, longestCommonSubsequence } from './challenge';

describe('minDistance', () => {
  it('identical strings have distance 0', () => {
    expect(minDistance('abc', 'abc')).toBe(0);
    expect(minDistance('', '')).toBe(0);
    expect(minDistance('a', 'a')).toBe(0);
  });

  it('empty to non-empty requires insertions', () => {
    expect(minDistance('', 'abc')).toBe(3);
    expect(minDistance('', 'a')).toBe(1);
  });

  it('non-empty to empty requires deletions', () => {
    expect(minDistance('abc', '')).toBe(3);
    expect(minDistance('a', '')).toBe(1);
  });

  it('single character replacement', () => {
    expect(minDistance('a', 'b')).toBe(1);
    expect(minDistance('abc', 'adc')).toBe(1);
  });

  it('horse to ros example', () => {
    expect(minDistance('horse', 'ros')).toBe(3);
  });

  it('intention to execution example', () => {
    expect(minDistance('intention', 'execution')).toBe(5);
  });

  it('kitten to sitting example', () => {
    expect(minDistance('kitten', 'sitting')).toBe(3);
  });

  it('different lengths with common prefix', () => {
    expect(minDistance('abc', 'abcd')).toBe(1);
    expect(minDistance('abcd', 'abc')).toBe(1);
  });

  it('completely different strings', () => {
    expect(minDistance('abc', 'xyz')).toBe(3);
  });

  it('single character strings', () => {
    expect(minDistance('a', 'b')).toBe(1);
    expect(minDistance('a', '')).toBe(1);
    expect(minDistance('', 'a')).toBe(1);
  });
});

describe('minDistanceWithOps', () => {
  it('identical strings have no operations', () => {
    const result = minDistanceWithOps('abc', 'abc');
    expect(result.distance).toBe(0);
    expect(result.operations.length).toBe(0);
  });

  it('tracks insertions', () => {
    const result = minDistanceWithOps('', 'abc');
    expect(result.distance).toBe(3);
    expect(result.operations.filter(op => op.type === 'insert').length).toBe(3);
  });

  it('tracks deletions', () => {
    const result = minDistanceWithOps('abc', '');
    expect(result.distance).toBe(3);
    expect(result.operations.filter(op => op.type === 'delete').length).toBe(3);
  });

  it('horse to ros with operations', () => {
    const result = minDistanceWithOps('horse', 'ros');
    expect(result.distance).toBe(3);
  });
});

describe('isOneEditDistance', () => {
  it('identical strings are not one edit away', () => {
    expect(isOneEditDistance('abc', 'abc')).toBe(false);
    expect(isOneEditDistance('', '')).toBe(false);
  });

  it('single insertion', () => {
    expect(isOneEditDistance('ab', 'acb')).toBe(true);
    expect(isOneEditDistance('', 'a')).toBe(true);
  });

  it('single deletion', () => {
    expect(isOneEditDistance('acb', 'ab')).toBe(true);
    expect(isOneEditDistance('a', '')).toBe(true);
  });

  it('single replacement', () => {
    expect(isOneEditDistance('abc', 'adc')).toBe(true);
    expect(isOneEditDistance('a', 'b')).toBe(true);
  });

  it('two edits returns false', () => {
    expect(isOneEditDistance('abc', 'axy')).toBe(false);
    expect(isOneEditDistance('', 'ab')).toBe(false);
  });

  it('length difference > 1 returns false', () => {
    expect(isOneEditDistance('abc', 'abcdef')).toBe(false);
  });
});

describe('longestCommonSubsequence', () => {
  it('identical strings', () => {
    expect(longestCommonSubsequence('abc', 'abc')).toBe(3);
    expect(longestCommonSubsequence('', '')).toBe(0);
  });

  it('no common subsequence', () => {
    expect(longestCommonSubsequence('abc', 'def')).toBe(0);
  });

  it('partial match', () => {
    expect(longestCommonSubsequence('abcde', 'ace')).toBe(3);
  });

  it('one empty string', () => {
    expect(longestCommonSubsequence('', 'abc')).toBe(0);
    expect(longestCommonSubsequence('abc', '')).toBe(0);
  });

  it('classic example', () => {
    expect(longestCommonSubsequence('AGGTAB', 'GXTXAYB')).toBe(4);
  });

  it('repeated characters', () => {
    expect(longestCommonSubsequence('aaa', 'aa')).toBe(2);
  });
});

describe('performance', () => {
  it('handles moderately long strings', () => {
    const s1 = 'algorithm'.repeat(10);
    const s2 = 'altruistic'.repeat(10);
    const result = minDistance(s1, s2);
    expect(result).toBeGreaterThan(0);
  });
});
]=],
  },
  {
    name = "Parallel Promise Runner",
    difficulty = "medium",
    stub = [==[
/**
 * Parallel Promise Runner
 *
 * Implement a utility for running promises with controlled concurrency.
 *
 * Running too many async operations in parallel can overwhelm APIs,
 * exhaust memory, or hit rate limits. A parallel runner limits how
 * many promises execute concurrently while queuing the rest.
 *
 * Implement:
 * - runParallel<T>(tasks: (() => Promise<T>)[], concurrency: number): Promise<T[]>
 *   Execute tasks with max `concurrency` running at once. Return results
 *   in the same order as input tasks (not completion order).
 *
 * - runParallelWithRetry<T>(
 *     tasks: (() => Promise<T>)[],
 *     options: { concurrency: number, retries?: number, delayMs?: number }
 *   ): Promise<T[]>
 *   Same as runParallel but retries failed tasks up to `retries` times
 *   with exponential backoff (delayMs * 2^attempt).
 *
 * - runParallelSettled<T>(tasks: (() => Promise<T>)[], concurrency: number): Promise<PromiseSettledResult<T>[]>
 *   Like Promise.allSettled but with concurrency control. All results
 *   include status ('fulfilled' or 'rejected') and value/reason.
 *
 * - runParallelRace<T>(tasks: (() => Promise<T>)[], count: number): Promise<T[]>
 *   Return the first `count` completed promises (race semantics).
 *   Cancel remaining pending tasks if possible.
 *
 * Edge cases:
 * - Empty task array returns empty array
 * - concurrency <= 0 should throw or default to 1
 * - Tasks that throw should reject the whole batch (except settled/retry variants)
 * - Results must maintain input order (except race variant)
 */

export function runParallel<T>(
  tasks: (() => Promise<T>)[],
  concurrency: number
): Promise<T[]> {
  // YOUR CODE HERE
  return Promise.resolve([]);
}

export function runParallelWithRetry<T>(
  tasks: (() => Promise<T>)[],
  options: {
    concurrency: number;
    retries?: number;
    delayMs?: number;
  }
): Promise<T[]> {
  // YOUR CODE HERE
  return Promise.resolve([]);
}

export function runParallelSettled<T>(
  tasks: (() => Promise<T>)[],
  concurrency: number
): Promise<PromiseSettledResult<T>[]> {
  // YOUR CODE HERE
  return Promise.resolve([]);
}

export function runParallelRace<T>(
  tasks: (() => Promise<T>)[],
  count: number
): Promise<T[]> {
  // YOUR CODE HERE
  return Promise.resolve([]);
}
]==],
    tests = [==[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { runParallel, runParallelWithRetry, runParallelSettled, runParallelRace } from './challenge';

describe('runParallel', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('empty task array', async () => {
    const result = await runParallel([], 3);
    expect(result).toEqual([]);
  });

  it('single task', async () => {
    const tasks = [() => Promise.resolve(42)];
    const result = await runParallel(tasks, 1);
    expect(result).toEqual([42]);
  });

  it('multiple tasks with concurrency 1 (sequential)', async () => {
    const order: number[] = [];
    const tasks = [
      () => new Promise(resolve => setTimeout(() => { order.push(1); resolve(1); }, 10)),
      () => new Promise(resolve => setTimeout(() => { order.push(2); resolve(2); }, 10)),
      () => new Promise(resolve => setTimeout(() => { order.push(3); resolve(3); }, 10)),
    ];
    const promise = runParallel(tasks, 1);
    vi.advanceTimersByTime(30);
    const result = await promise;
    expect(result).toEqual([1, 2, 3]);
    expect(order).toEqual([1, 2, 3]);
  });

  it('multiple tasks with concurrency 2', async () => {
    const order: number[] = [];
    const tasks = [
      () => new Promise(resolve => setTimeout(() => { order.push(1); resolve(1); }, 10)),
      () => new Promise(resolve => setTimeout(() => { order.push(2); resolve(2); }, 10)),
      () => new Promise(resolve => setTimeout(() => { order.push(3); resolve(3); }, 10)),
    ];
    const promise = runParallel(tasks, 2);
    vi.advanceTimersByTime(20);
    const result = await promise;
    expect(result).toEqual([1, 2, 3]);
    expect(order.slice(0, 2)).toEqual([1, 2]);
  });

  it('results maintain input order', async () => {
    const tasks = [
      () => new Promise(resolve => setTimeout(() => resolve('slow'), 50)),
      () => new Promise(resolve => setTimeout(() => resolve('fast'), 10)),
      () => new Promise(resolve => setTimeout(() => resolve('medium'), 30)),
    ];
    const promise = runParallel(tasks, 3);
    vi.advanceTimersByTime(50);
    const result = await promise;
    expect(result).toEqual(['slow', 'fast', 'medium']);
  });

  it('handles rejected promises', async () => {
    const tasks = [
      () => Promise.resolve(1),
      () => Promise.reject(new Error('fail')),
      () => Promise.resolve(3),
    ];
    await expect(runParallel(tasks, 2)).rejects.toThrow('fail');
  });

  it('concurrency limit is respected', async () => {
    let maxConcurrent = 0;
    let current = 0;
    const tasks = Array.from({ length: 10 }, (_, i) => () =>
      new Promise(resolve => {
        current++;
        maxConcurrent = Math.max(maxConcurrent, current);
        setTimeout(() => {
          current--;
          resolve(i);
        }, 10);
      })
    );
    const promise = runParallel(tasks, 3);
    vi.advanceTimersByTime(100);
    await promise;
    expect(maxConcurrent).toBeLessThanOrEqual(3);
  });

  it('concurrency 0 defaults to 1', async () => {
    const tasks = [() => Promise.resolve(1), () => Promise.resolve(2)];
    const result = await runParallel(tasks, 0);
    expect(result).toEqual([1, 2]);
  });

  it('async tasks with delays', async () => {
    const tasks = [
      async () => {
        await new Promise(r => setTimeout(r, 20));
        return 1;
      },
      async () => {
        await new Promise(r => setTimeout(r, 10));
        return 2;
      },
    ];
    const promise = runParallel(tasks, 2);
    vi.advanceTimersByTime(20);
    const result = await promise;
    expect(result).toEqual([1, 2]);
  });
});

describe('runParallelWithRetry', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('succeeds on first try', async () => {
    const tasks = [() => Promise.resolve('success')];
    const result = await runParallelWithRetry(tasks, { concurrency: 1, retries: 3 });
    expect(result).toEqual(['success']);
  });

  it('retries on failure', async () => {
    let attempts = 0;
    const tasks = [
      () => new Promise((resolve, reject) => {
        attempts++;
        if (attempts < 3) reject(new Error('try again'));
        else resolve('success');
      }),
    ];
    const promise = runParallelWithRetry(tasks, { concurrency: 1, retries: 3, delayMs: 10 });
    vi.advanceTimersByTime(100);
    const result = await promise;
    expect(result).toEqual(['success']);
    expect(attempts).toBe(3);
  });

  it('fails after max retries', async () => {
    const tasks = [() => Promise.reject(new Error('always fails'))];
    const promise = runParallelWithRetry(tasks, { concurrency: 1, retries: 2, delayMs: 10 });
    vi.advanceTimersByTime(100);
    await expect(promise).rejects.toThrow('always fails');
  });

  it('exponential backoff', async () => {
    let attempts = 0;
    const attemptTimes: number[] = [];
    let startTime = Date.now();
    const tasks = [
      () => new Promise((resolve, reject) => {
        attempts++;
        attemptTimes.push(Date.now() - startTime);
        if (attempts < 3) reject(new Error('retry'));
        else resolve('done');
      }),
    ];
    const promise = runParallelWithRetry(tasks, { concurrency: 1, retries: 3, delayMs: 10 });
    vi.advanceTimersByTime(100);
    await promise;
    expect(attemptTimes[0]).toBe(0);
    expect(attemptTimes[1]).toBeGreaterThanOrEqual(10);
    expect(attemptTimes[2]).toBeGreaterThanOrEqual(30);
  });

  it('partial failures with retry', async () => {
    const tasks = [
      () => Promise.resolve('ok'),
      () => Promise.reject(new Error('fail')),
    ];
    const promise = runParallelWithRetry(tasks, { concurrency: 2, retries: 1 });
    await expect(promise).rejects.toThrow('fail');
  });
});

describe('runParallelSettled', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('all fulfilled', async () => {
    const tasks = [
      () => Promise.resolve(1),
      () => Promise.resolve(2),
      () => Promise.resolve(3),
    ];
    const result = await runParallelSettled(tasks, 2);
    expect(result).toEqual([
      { status: 'fulfilled', value: 1 },
      { status: 'fulfilled', value: 2 },
      { status: 'fulfilled', value: 3 },
    ]);
  });

  it('mixed fulfilled and rejected', async () => {
    const tasks = [
      () => Promise.resolve('ok'),
      () => Promise.reject(new Error('fail')),
      () => Promise.resolve('also ok'),
    ];
    const result = await runParallelSettled(tasks, 2);
    expect(result[0]).toEqual({ status: 'fulfilled', value: 'ok' });
    expect(result[1]).toEqual({ status: 'rejected', reason: expect.any(Error) });
    expect(result[2]).toEqual({ status: 'fulfilled', value: 'also ok' });
  });

  it('all rejected', async () => {
    const tasks = [
      () => Promise.reject(new Error('err1')),
      () => Promise.reject(new Error('err2')),
    ];
    const result = await runParallelSettled(tasks, 1);
    expect(result.every(r => r.status === 'rejected')).toBe(true);
  });

  it('maintains order with mixed results', async () => {
    const tasks = [
      () => new Promise(resolve => setTimeout(() => resolve('slow'), 30)),
      () => new Promise((_, reject) => setTimeout(() => reject('fast fail'), 10)),
      () => new Promise(resolve => setTimeout(() => resolve('medium'), 20)),
    ];
    const promise = runParallelSettled(tasks, 3);
    vi.advanceTimersByTime(30);
    const result = await promise;
    expect(result[0].status).toBe('fulfilled');
    expect(result[1].status).toBe('rejected');
    expect(result[2].status).toBe('fulfilled');
  });
});

describe('runParallelRace', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('race to get first completed', async () => {
    const tasks = [
      () => new Promise(resolve => setTimeout(() => resolve('slow'), 50)),
      () => new Promise(resolve => setTimeout(() => resolve('fast'), 10)),
      () => new Promise(resolve => setTimeout(() => resolve('medium'), 30)),
    ];
    const result = await runParallelRace(tasks, 1);
    vi.advanceTimersByTime(50);
    expect(result).toEqual(['fast']);
  });

  it('race to get first N completed', async () => {
    const tasks = [
      () => new Promise(resolve => setTimeout(() => resolve('third'), 30)),
      () => new Promise(resolve => setTimeout(() => resolve('first'), 10)),
      () => new Promise(resolve => setTimeout(() => resolve('second'), 20)),
      () => new Promise(resolve => setTimeout(() => resolve('fourth'), 40)),
    ];
    const result = await runParallelRace(tasks, 2);
    vi.advanceTimersByTime(40);
    expect(result).toEqual(['first', 'second']);
  });

  it('count greater than tasks returns all', async () => {
    const tasks = [
      () => Promise.resolve(1),
      () => Promise.resolve(2),
    ];
    const result = await runParallelRace(tasks, 10);
    expect(result).toEqual([1, 2]);
  });

  it('empty tasks returns empty', async () => {
    const result = await runParallelRace([], 5);
    expect(result).toEqual([]);
  });
});

describe('edge cases', () => {
  it('tasks that throw synchronously', async () => {
    const tasks = [
      () => { throw new Error('sync error'); },
    ];
    await expect(runParallel(tasks, 1)).rejects.toThrow('sync error');
  });

  it('very large concurrency limit', async () => {
    const tasks = Array.from({ length: 5 }, (_, i) => () => Promise.resolve(i));
    const result = await runParallel(tasks, 1000);
    expect(result).toEqual([0, 1, 2, 3, 4]);
  });

  it('tasks returning undefined', async () => {
    const tasks = [() => Promise.resolve(undefined)];
    const result = await runParallel(tasks, 1);
    expect(result).toEqual([undefined]);
  });
});
]==],
  {
    name = "Tiny Language Compiler",
    difficulty = "hard",
    stub = [=[
/**
 * Tiny Language Compiler
 *
 * Build a compiler for a minimal imperative language that compiles to JavaScript.
 *
 * Language syntax:
 * - Variable declarations: `let x = 5;`
 * - Arithmetic expressions: `x + 3 * (y - 1)`
 * - Comparisons: `x > 5`, `x == y`, `x <= 10`
 * - If statements: `if (x > 0) { x = x - 1; }`
 * - While loops: `while (x > 0) { x = x - 1; }`
 * - Print statements: `print(x);`
 * - Block scope with curly braces
 *
 * Implement a complete compiler pipeline:
 * 1. Lexer: Tokenize source code into tokens
 * 2. Parser: Build an Abstract Syntax Tree (AST)
 * 3. Code Generator: Emit JavaScript code from AST
 *
 * Token types: LET, IDENT, NUMBER, PLUS, MINUS, STAR, SLASH, LPAREN, RPAREN,
 *              LBRACE, RBRACE, SEMICOLON, EQUALS, EQ, NEQ, LT, LTE, GT, GTE,
 *              IF, WHILE, PRINT, EOF
 *
 * AST Node types: Program, VariableDecl, Assignment, BinaryExpr, IfStmt,
 *                 WhileStmt, PrintStmt, NumberLit, Identifier
 *
 * Implement:
 * - tokenize(source: string): Token[]
 * - parse(tokens: Token[]): Program
 * - generate(ast: Program): string
 * - compile(source: string): string  (full pipeline)
 *
 * Example:
 * Input:  `let x = 5; let y = 3; print(x + y);`
 * Output: `let x = 5; let y = 3; console.log(x + y);`
 */

export interface Token {
  type: string;
  value: any;
  line: number;
  column: number;
}

export interface ASTNode {
  type: string;
}

export interface Program extends ASTNode {
  type: 'Program';
  body: Statement[];
}

export interface VariableDecl extends ASTNode {
  type: 'VariableDecl';
  name: string;
  init: Expression;
}

export interface Assignment extends ASTNode {
  type: 'Assignment';
  name: string;
  value: Expression;
}

export interface BinaryExpr extends ASTNode {
  type: 'BinaryExpr';
  operator: string;
  left: Expression;
  right: Expression;
}

export interface IfStmt extends ASTNode {
  type: 'IfStmt';
  condition: Expression;
  body: Statement[];
}

export interface WhileStmt extends ASTNode {
  type: 'WhileStmt';
  condition: Expression;
  body: Statement[];
}

export interface PrintStmt extends ASTNode {
  type: 'PrintStmt';
  argument: Expression;
}

export interface NumberLit extends ASTNode {
  type: 'NumberLit';
  value: number;
}

export interface Identifier extends ASTNode {
  type: 'Identifier';
  name: string;
}

export type Statement = VariableDecl | Assignment | IfStmt | WhileStmt | PrintStmt;
export type Expression = BinaryExpr | NumberLit | Identifier;

export function tokenize(source: string): Token[] {
  // YOUR CODE HERE
  return [];
}

export function parse(tokens: Token[]): Program {
  // YOUR CODE HERE
  return { type: 'Program', body: [] };
}

export function generate(ast: Program): string {
  // YOUR CODE HERE
  return '';
}

export function compile(source: string): string {
  // YOUR CODE HERE
  return '';
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { tokenize, parse, generate, compile } from './challenge';

describe('tokenize', () => {
  it('tokenizes number literal', () => {
    const tokens = tokenize('42');
    expect(tokens).toHaveLength(2); // NUMBER + EOF
    expect(tokens[0].type).toBe('NUMBER');
    expect(tokens[0].value).toBe(42);
  });

  it('tokenizes identifier', () => {
    const tokens = tokenize('x');
    expect(tokens[0].type).toBe('IDENT');
    expect(tokens[0].value).toBe('x');
  });

  it('tokenizes let declaration', () => {
    const tokens = tokenize('let x = 5;');
    expect(tokens[0].type).toBe('LET');
    expect(tokens[1].type).toBe('IDENT');
    expect(tokens[2].type).toBe('EQUALS');
    expect(tokens[3].type).toBe('NUMBER');
    expect(tokens[4].type).toBe('SEMICOLON');
  });

  it('tokenizes arithmetic operators', () => {
    const tokens = tokenize('1 + 2 - 3 * 4 / 5');
    const types = tokens.slice(0, -1).map(t => t.type);
    expect(types).toEqual(['NUMBER', 'PLUS', 'NUMBER', 'MINUS', 'NUMBER', 'STAR', 'NUMBER', 'SLASH', 'NUMBER']);
  });

  it('tokenizes parentheses', () => {
    const tokens = tokenize('(x + y)');
    expect(tokens[0].type).toBe('LPAREN');
    expect(tokens[4].type).toBe('RPAREN');
  });

  it('tokenizes comparison operators', () => {
    const tokens = tokenize('a == b != c < d > e <= f >= g');
    const types = tokens.slice(0, -1).map(t => t.type);
    expect(types).toEqual([
      'IDENT', 'EQ', 'IDENT',
      'IDENT', 'NEQ', 'IDENT',
      'IDENT', 'LT', 'IDENT',
      'IDENT', 'GT', 'IDENT',
      'IDENT', 'LTE', 'IDENT',
      'IDENT', 'GTE', 'IDENT'
    ]);
  });

  it('tokenizes if statement', () => {
    const tokens = tokenize('if (x > 0) { }');
    expect(tokens[0].type).toBe('IF');
    expect(tokens[1].type).toBe('LPAREN');
    expect(tokens[5].type).toBe('RPAREN');
    expect(tokens[6].type).toBe('LBRACE');
    expect(tokens[8].type).toBe('RBRACE');
  });

  it('tokenizes while statement', () => {
    const tokens = tokenize('while (x > 0) { }');
    expect(tokens[0].type).toBe('WHILE');
  });

  it('tokenizes print statement', () => {
    const tokens = tokenize('print(x);');
    expect(tokens[0].type).toBe('PRINT');
  });

  it('handles multi-digit numbers', () => {
    const tokens = tokenize('12345');
    expect(tokens[0].value).toBe(12345);
  });

  it('handles whitespace', () => {
    const tokens = tokenize('  let   x  =  42  ;  ');
    const types = tokens.slice(0, -1).map(t => t.type);
    expect(types).toEqual(['LET', 'IDENT', 'EQUALS', 'NUMBER', 'SEMICOLON']);
  });

  it('handles newlines and tracks line numbers', () => {
    const tokens = tokenize('let x = 1;
let y = 2;');
    const xToken = tokens.find(t => t.value === 'x');
    const yToken = tokens.find(t => t.value === 'y');
    expect(xToken?.line).toBe(1);
    expect(yToken?.line).toBe(2);
  });

  it('tokenizes complete program', () => {
    const source = `let x = 5;
let y = 3;
if (x > y) {
  print(x);
}
while (y > 0) {
  y = y - 1;
}
print(y);`;
    const tokens = tokenize(source);
    expect(tokens[tokens.length - 1].type).toBe('EOF');
  });
});

describe('parse', () => {
  it('parses empty program', () => {
    const ast = parse(tokenize(''));
    expect(ast.type).toBe('Program');
    expect(ast.body).toEqual([]);
  });

  it('parses variable declaration', () => {
    const ast = parse(tokenize('let x = 5;'));
    expect(ast.body).toHaveLength(1);
    expect(ast.body[0].type).toBe('VariableDecl');
    expect((ast.body[0] as any).name).toBe('x');
    expect((ast.body[0] as any).init.type).toBe('NumberLit');
    expect((ast.body[0] as any).init.value).toBe(5);
  });

  it('parses multiple declarations', () => {
    const ast = parse(tokenize('let x = 1; let y = 2;'));
    expect(ast.body).toHaveLength(2);
  });

  it('parses binary expression', () => {
    const ast = parse(tokenize('let z = x + y;'));
    const decl = ast.body[0] as any;
    expect(decl.init.type).toBe('BinaryExpr');
    expect(decl.init.operator).toBe('+');
    expect(decl.init.left.type).toBe('Identifier');
    expect(decl.init.right.type).toBe('Identifier');
  });

  it('respects operator precedence', () => {
    const ast = parse(tokenize('let z = 1 + 2 * 3;'));
    const decl = ast.body[0] as any;
    // Should be 1 + (2 * 3), not (1 + 2) * 3
    expect(decl.init.operator).toBe('+');
    expect(decl.init.right.operator).toBe('*');
  });

  it('parses parentheses', () => {
    const ast = parse(tokenize('let z = (1 + 2) * 3;'));
    const decl = ast.body[0] as any;
    expect(decl.init.operator).toBe('*');
    expect(decl.init.left.operator).toBe('+');
  });

  it('parses if statement', () => {
    const ast = parse(tokenize('if (x > 0) { x = 1; }'));
    expect(ast.body[0].type).toBe('IfStmt');
    const ifStmt = ast.body[0] as any;
    expect(ifStmt.condition.type).toBe('BinaryExpr');
    expect(ifStmt.body).toHaveLength(1);
  });

  it('parses while statement', () => {
    const ast = parse(tokenize('while (x > 0) { x = x - 1; }'));
    expect(ast.body[0].type).toBe('WhileStmt');
    const whileStmt = ast.body[0] as any;
    expect(whileStmt.body).toHaveLength(1);
  });

  it('parses print statement', () => {
    const ast = parse(tokenize('print(x + 1);'));
    expect(ast.body[0].type).toBe('PrintStmt');
    const printStmt = ast.body[0] as any;
    expect(printStmt.argument.type).toBe('BinaryExpr');
  });

  it('parses nested blocks', () => {
    const ast = parse(tokenize('if (x > 0) { if (y > 0) { print(1); } }'));
    const outerIf = ast.body[0] as any;
    expect(outerIf.body[0].type).toBe('IfStmt');
  });

  it('parses assignment statement', () => {
    const ast = parse(tokenize('x = 5;'));
    expect(ast.body[0].type).toBe('Assignment');
    const assign = ast.body[0] as any;
    expect(assign.name).toBe('x');
    expect(assign.value.value).toBe(5);
  });

  it('parses comparison in condition', () => {
    const ast = parse(tokenize('if (x == y) { print(1); }'));
    const ifStmt = ast.body[0] as any;
    expect(ifStmt.condition.operator).toBe('==');
  });
});

describe('generate', () => {
  it('generates variable declaration', () => {
    const ast = parse(tokenize('let x = 5;'));
    const js = generate(ast);
    expect(js).toBe('let x = 5;');
  });

  it('generates binary expression', () => {
    const ast = parse(tokenize('let z = x + y;'));
    const js = generate(ast);
    expect(js).toBe('let z = x + y;');
  });

  it('generates if statement', () => {
    const ast = parse(tokenize('if (x > 0) { x = 1; }'));
    const js = generate(ast);
    expect(js).toContain('if (x > 0)');
    expect(js).toContain('x = 1;');
  });

  it('generates while statement', () => {
    const ast = parse(tokenize('while (x > 0) { x = x - 1; }'));
    const js = generate(ast);
    expect(js).toContain('while (x > 0)');
    expect(js).toContain('x = x - 1;');
  });

  it('generates print as console.log', () => {
    const ast = parse(tokenize('print(x);'));
    const js = generate(ast);
    expect(js).toBe('console.log(x);');
  });

  it('generates complete program', () => {
    const source = 'let x = 5; let y = 3; print(x + y);';
    const ast = parse(tokenize(source));
    const js = generate(ast);
    expect(js).toContain('let x = 5;');
    expect(js).toContain('let y = 3;');
    expect(js).toContain('console.log(x + y);');
  });
});

describe('compile (full pipeline)', () => {
  it('compiles simple program', () => {
    const source = 'let x = 5; print(x);';
    const js = compile(source);
    expect(js).toBe('let x = 5; console.log(x);');
  });

  it('compiles arithmetic', () => {
    const source = 'let sum = 1 + 2 * 3; print(sum);';
    const js = compile(source);
    expect(js).toContain('let sum = 1 + 2 * 3;');
  });

  it('compiles conditional', () => {
    const source = 'let x = 10; if (x > 5) { print(x); }';
    const js = compile(source);
    expect(js).toContain('if (x > 5)');
  });

  it('compiles loop', () => {
    const source = 'let i = 3; while (i > 0) { print(i); i = i - 1; }';
    const js = compile(source);
    expect(js).toContain('while (i > 0)');
    expect(js).toContain('i = i - 1;');
  });

  it('compiles factorial program', () => {
    const source = `let n = 5;
let result = 1;
while (n > 0) {
  result = result * n;
  n = n - 1;
}
print(result);`;
    const js = compile(source);
    expect(js).toContain('while (n > 0)');
    expect(js).toContain('console.log(result);');
  });

  it('compiles nested conditions', () => {
    const source = 'if (x > 0) { if (y > 0) { print(1); } }';
    const js = compile(source);
    expect(js).toContain('if (x > 0)');
    expect(js).toContain('if (y > 0)');
  });

  it('compiles comparison operators', () => {
    const source = 'if (x == y) { print(1); } if (a != b) { print(2); }';
    const js = compile(source);
    expect(js).toContain('x === y');
    expect(js).toContain('a !== b');
  });

  it('handles complex expression', () => {
    const source = 'let result = (a + b) * (c - d) / e;';
    const js = compile(source);
    expect(js).toBe('let result = (a + b) * (c - d) / e;');
  });
});

describe('edge cases', () => {
  it('handles zero', () => {
    const js = compile('let x = 0; print(x);');
    expect(js).toContain('let x = 0;');
  });

  it('handles negative numbers in expression', () => {
    const js = compile('let x = 5 - 10;');
    expect(js).toBe('let x = 5 - 10;');
  });

  it('handles deeply nested expressions', () => {
    const js = compile('let x = (((1 + 2)));');
    expect(js).toBe('let x = (((1 + 2)));');
  });

  it('handles multiple statements on same conceptual line', () => {
    const js = compile('let a = 1; let b = 2; let c = 3;');
    expect(js).toBe('let a = 1; let b = 2; let c = 3;');
  });
});
]=],
  },
  },  {
    name = "Longest Common Subsequence",
    difficulty = "medium",
    stub = [=[
/**
 * Longest Common Subsequence
 *
 * Implement the classic dynamic programming problem to find the longest
 * common subsequence between two strings.
 *
 * A subsequence is a sequence that can be derived from another sequence
 * by deleting some or no elements without changing the order of the
 * remaining elements. "ace" is a subsequence of "abcde".
 *
 * Implement:
 * - lcs(text1: string, text2: string): number
 *   Return the length of the longest common subsequence.
 *
 * - lcsWithResult(text1: string, text2: string): string
 *   Return the actual longest common subsequence string.
 *
 * - lcsAll(text1: string, text2: string): string[]
 *   Return ALL distinct longest common subsequences (can be multiple).
 *
 * Time complexity: O(m * n) where m and n are string lengths.
 * Space complexity: O(m * n) for the DP table.
 *
 * Bonus: Implement lcsOptimized with O(min(m, n)) space complexity.
 */

export function lcs(text1: string, text2: string): number {
  // YOUR CODE HERE
  return 0;
}

export function lcsWithResult(text1: string, text2: string): string {
  // YOUR CODE HERE
  return '';
}

export function lcsAll(text1: string, text2: string): string[] {
  // YOUR CODE HERE
  return [];
}

export function lcsOptimized(text1: string, text2: string): number {
  // YOUR CODE HERE
  return 0;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { lcs, lcsWithResult, lcsAll, lcsOptimized } from './challenge';

describe('lcs - length only', () => {
  it('empty strings', () => {
    expect(lcs('', '')).toBe(0);
    expect(lcs('abc', '')).toBe(0);
    expect(lcs('', 'xyz')).toBe(0);
  });

  it('identical strings', () => {
    expect(lcs('abc', 'abc')).toBe(3);
    expect(lcs('hello', 'hello')).toBe(5);
  });

  it('no common subsequence', () => {
    expect(lcs('abc', 'xyz')).toBe(0);
    expect(lcs('aaa', 'bbb')).toBe(0);
  });

  it('simple common subsequence', () => {
    expect(lcs('abcde', 'ace')).toBe(3);
    expect(lcs('abc', 'ac')).toBe(2);
  });

  it('subsequence in middle', () => {
    expect(lcs('axbycz', 'abc')).toBe(3);
  });

  it('single character match', () => {
    expect(lcs('a', 'a')).toBe(1);
    expect(lcs('a', 'b')).toBe(0);
    expect(lcs('abc', 'b')).toBe(1);
  });

  it('repeated characters', () => {
    expect(lcs('aaa', 'aa')).toBe(2);
    expect(lcs('aaa', 'aaaa')).toBe(3);
  });

  it('classic example', () => {
    expect(lcs('ABCDGH', 'AEDFHR')).toBe(3); // ADH
    expect(lcs('AGGTAB', 'GXTXAYB')).toBe(4); // GTAB
  });

  it('longer strings', () => {
    expect(lcs('programming', 'gaming')).toBe(5); // gamig or amin
    expect(lcs('dynamicprogramming', 'programming')).toBe(11);
  });

  it('case sensitive', () => {
    expect(lcs('ABC', 'abc')).toBe(0);
    expect(lcs('AbC', 'AbC')).toBe(3);
  });
});

describe('lcsWithResult - actual subsequence', () => {
  it('empty strings', () => {
    expect(lcsWithResult('', '')).toBe('');
    expect(lcsWithResult('abc', '')).toBe('');
  });

  it('identical strings', () => {
    expect(lcsWithResult('abc', 'abc')).toBe('abc');
  });

  it('no common subsequence', () => {
    expect(lcsWithResult('abc', 'xyz')).toBe('');
  });

  it('simple case', () => {
    const result = lcsWithResult('abcde', 'ace');
    expect(result.length).toBe(3);
    expect(result).toBe('ace');
  });

  it('classic example', () => {
    const result = lcsWithResult('ABCDGH', 'AEDFHR');
    expect(result.length).toBe(3);
    // Could be ADH
    expect(result).toMatch(/^[ADH]{3}$/);
  });

  it('multiple possible results', () => {
    const result = lcsWithResult('abc', 'bac');
    expect(result.length).toBe(2);
    // Could be 'ac' or 'bc'
    expect(['ac', 'bc']).toContain(result);
  });
});

describe('lcsAll - all distinct LCS', () => {
  it('empty strings', () => {
    expect(lcsAll('', '')).toEqual(['']);
  });

  it('identical strings', () => {
    expect(lcsAll('abc', 'abc')).toEqual(['abc']);
  });

  it('no common subsequence', () => {
    expect(lcsAll('abc', 'xyz')).toEqual(['']);
  });

  it('single result', () => {
    const results = lcsAll('abcde', 'ace');
    expect(results).toContain('ace');
    expect(results.length).toBe(1);
  });

  it('multiple results', () => {
    const results = lcsAll('abc', 'bac');
    expect(results.length).toBeGreaterThanOrEqual(1);
    expect(results.every(r => r.length === 2)).toBe(true);
  });

  it('all results have same length', () => {
    const results = lcsAll('AGGTAB', 'GXTXAYB');
    expect(results.length).toBeGreaterThanOrEqual(1);
    const lengths = results.map(r => r.length);
    expect(lengths.every(l => l === lengths[0])).toBe(true);
  });
});

describe('lcsOptimized - space optimized', () => {
  it('empty strings', () => {
    expect(lcsOptimized('', '')).toBe(0);
    expect(lcsOptimized('abc', '')).toBe(0);
  });

  it('identical strings', () => {
    expect(lcsOptimized('abc', 'abc')).toBe(3);
  });

  it('no common subsequence', () => {
    expect(lcsOptimized('abc', 'xyz')).toBe(0);
  });

  it('matches regular lcs', () => {
    const testCases = [
      ['abcde', 'ace'],
      ['ABCDGH', 'AEDFHR'],
      ['AGGTAB', 'GXTXAYB'],
      ['programming', 'gaming'],
      ['aaa', 'aa'],
    ];
    testCases.forEach(([t1, t2]) => {
      expect(lcsOptimized(t1, t2)).toBe(lcs(t1, t2));
    });
  });

  it('stress test with longer strings', () => {
    const s1 = 'a'.repeat(100) + 'b'.repeat(100);
    const s2 = 'a'.repeat(50) + 'c'.repeat(50) + 'b'.repeat(100);
    expect(lcsOptimized(s1, s2)).toBe(200);
  });
});

describe('edge cases', () => {
  it('single character strings', () => {
    expect(lcs('a', 'a')).toBe(1);
    expect(lcs('a', 'b')).toBe(0);
  });

  it('one character longer', () => {
    expect(lcs('ab', 'abc')).toBe(2);
    expect(lcs('abc', 'ab')).toBe(2);
  });

  it('all same character', () => {
    expect(lcs('aaaa', 'aa')).toBe(2);
    expect(lcs('aaaa', 'aaaaa')).toBe(4);
  });

  it('alternating pattern', () => {
    expect(lcs('ababab', 'bababa')).toBe(5);
  });

  it('special characters', () => {
    expect(lcs('a!b@c#', 'a!b@c#')).toBe(6);
    expect(lcs('a!b@c#', 'xyz')).toBe(0);
  });

  it('unicode characters', () => {
    expect(lcs('你好世界', '你好')).toBe(2);
    expect(lcs('🎉🎊🎈', '🎉🎈')).toBe(2);
  });
});

describe('performance', () => {
  it('handles 100x100 strings', () => {
    const s1 = 'abcdefghij'.repeat(10);
    const s2 = 'fghijklmno'.repeat(10);
    const start = Date.now();
    const result = lcs(s1, s2);
    const elapsed = Date.now() - start;
    expect(result).toBeGreaterThan(0);
    expect(elapsed).toBeLessThan(1000);
  });

  it('handles 500x500 strings', () => {
    const s1 = 'abc'.repeat(167);
    const s2 = 'bca'.repeat(167);
    const result = lcs(s1, s2);
    expect(result).toBeGreaterThan(0);
  });
});
]=],
  },


  {
    name = "Kruskal's Minimum Spanning Tree",
    difficulty = "medium",
    stub = [==[
/**
 * Kruskal's Minimum Spanning Tree
 *
 * Implement Kruskal's algorithm for finding the Minimum Spanning Tree (MST)
 * of a weighted undirected graph.
 *
 * The MST is a subset of edges that connects all vertices with minimum total
 * weight and no cycles. Kruskal's algorithm uses a greedy approach:
 * 1. Sort all edges by weight (ascending)
 * 2. Add edges one by one if they don't create a cycle
 * 3. Stop when all vertices are connected
 *
 * This challenge combines graph theory with Union-Find (Disjoint Set Union).
 *
 * Implement:
 * - kruskal(n: number, edges: Edge[]): Edge[] | null
 *   Return the MST edges, or null if graph is disconnected.
 *   n = number of vertices (0 to n-1)
 *   edges = array of { from, to, weight }
 *
 * - mstWeight(n: number, edges: Edge[]): number | null
 *   Return just the total weight of the MST, or null if disconnected.
 *
 * - isSpanningTree(n: number, edges: Edge[], mst: Edge[]): boolean
 *   Verify that a given set of edges forms a valid spanning tree.
 *
 * Edge interface:
 * interface Edge {
 *   from: number;
 *   to: number;
 *   weight: number;
 * }
 *
 * Bonus: Implement kruskalWithPaths that returns both the MST and the
 * total weight in a single result object.
 */

export interface Edge {
  from: number;
  to: number;
  weight: number;
}

export interface MSTResult {
  edges: Edge[];
  totalWeight: number;
}

export function kruskal(n: number, edges: Edge[]): Edge[] | null {
  // YOUR CODE HERE
  return null;
}

export function mstWeight(n: number, edges: Edge[]): number | null {
  // YOUR CODE HERE
  return null;
}

export function isSpanningTree(n: number, edges: Edge[], mst: Edge[]): boolean {
  // YOUR CODE HERE
  return false;
}

export function kruskalWithPaths(n: number, edges: Edge[]): MSTResult | null {
  // YOUR CODE HERE
  return null;
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { kruskal, mstWeight, isSpanningTree, kruskalWithPaths, Edge } from './challenge';

describe('kruskal', () => {
  it('single node graph', () => {
    const result = kruskal(1, []);
    expect(result).toEqual([]);
  });

  it('two nodes, one edge', () => {
    const edges: Edge[] = [{ from: 0, to: 1, weight: 5 }];
    const result = kruskal(2, edges);
    expect(result).toHaveLength(1);
    expect(result![0].weight).toBe(5);
  });

  it('triangle graph', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 1, to: 2, weight: 2 },
      { from: 0, to: 2, weight: 3 }
    ];
    const result = kruskal(3, edges);
    expect(result).toHaveLength(2);
    const totalWeight = result!.reduce((sum, e) => sum + e.weight, 0);
    expect(totalWeight).toBe(3);
  });

  it('square graph with diagonal', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 1, to: 2, weight: 2 },
      { from: 2, to: 3, weight: 3 },
      { from: 0, to: 3, weight: 4 },
      { from: 0, to: 2, weight: 5 }
    ];
    const result = kruskal(4, edges);
    expect(result).toHaveLength(3);
    const totalWeight = result!.reduce((sum, e) => sum + e.weight, 0);
    expect(totalWeight).toBe(6);
  });

  it('disconnected graph returns null', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 2, to: 3, weight: 2 }
    ];
    expect(kruskal(4, edges)).toBeNull();
  });

  it('handles duplicate edges', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 5 },
      { from: 0, to: 1, weight: 3 },
      { from: 1, to: 2, weight: 2 }
    ];
    const result = kruskal(3, edges);
    expect(result).toHaveLength(2);
    const totalWeight = result!.reduce((sum, e) => sum + e.weight, 0);
    expect(totalWeight).toBe(5);
  });

  it('handles parallel edges with same weight', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 0, to: 1, weight: 1 },
      { from: 1, to: 2, weight: 2 }
    ];
    const result = kruskal(3, edges);
    expect(result).toHaveLength(2);
  });

  it('complete graph K4', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 0, to: 2, weight: 2 },
      { from: 0, to: 3, weight: 3 },
      { from: 1, to: 2, weight: 4 },
      { from: 1, to: 3, weight: 5 },
      { from: 2, to: 3, weight: 6 }
    ];
    const result = kruskal(4, edges);
    expect(result).toHaveLength(3);
    const totalWeight = result!.reduce((sum, e) => sum + e.weight, 0);
    expect(totalWeight).toBe(6);
  });

  it('handles zero-weight edges', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 0 },
      { from: 1, to: 2, weight: 0 },
      { from: 0, to: 2, weight: 1 }
    ];
    const result = kruskal(3, edges);
    expect(result).toHaveLength(2);
    const totalWeight = result!.reduce((sum, e) => sum + e.weight, 0);
    expect(totalWeight).toBe(0);
  });

  it('handles negative weights', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: -5 },
      { from: 1, to: 2, weight: 3 },
      { from: 0, to: 2, weight: 10 }
    ];
    const result = kruskal(3, edges);
    expect(result).toHaveLength(2);
    const totalWeight = result!.reduce((sum, e) => sum + e.weight, 0);
    expect(totalWeight).toBe(-2);
  });

  it('star graph', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 0, to: 2, weight: 2 },
      { from: 0, to: 3, weight: 3 },
      { from: 0, to: 4, weight: 4 }
    ];
    const result = kruskal(5, edges);
    expect(result).toHaveLength(4);
    const totalWeight = result!.reduce((sum, e) => sum + e.weight, 0);
    expect(totalWeight).toBe(10);
  });

  it('line graph', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 1, to: 2, weight: 2 },
      { from: 2, to: 3, weight: 3 },
      { from: 3, to: 4, weight: 4 }
    ];
    const result = kruskal(5, edges);
    expect(result).toHaveLength(4);
    expect(result).toEqual(edges);
  });
});

describe('mstWeight', () => {
  it('single node has weight 0', () => {
    expect(mstWeight(1, [])).toBe(0);
  });

  it('two nodes', () => {
    const edges: Edge[] = [{ from: 0, to: 1, weight: 7 }];
    expect(mstWeight(2, edges)).toBe(7);
  });

  it('triangle', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 1, to: 2, weight: 2 },
      { from: 0, to: 2, weight: 3 }
    ];
    expect(mstWeight(3, edges)).toBe(3);
  });

  it('disconnected returns null', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 2, to: 3, weight: 2 }
    ];
    expect(mstWeight(4, edges)).toBeNull();
  });

  it('matches kruskal result', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 1, to: 2, weight: 2 },
      { from: 2, to: 3, weight: 3 },
      { from: 0, to: 3, weight: 4 }
    ];
    const mst = kruskal(4, edges);
    const weight = mstWeight(4, edges);
    expect(weight).toBe(mst!.reduce((sum, e) => sum + e.weight, 0));
  });
});

describe('isSpanningTree', () => {
  it('valid spanning tree', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 0, to: 2, weight: 2 },
      { from: 0, to: 3, weight: 3 }
    ];
    expect(isSpanningTree(4, edges, edges)).toBe(true);
  });

  it('too few edges', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 1, to: 2, weight: 2 }
    ];
    expect(isSpanningTree(4, edges, edges)).toBe(false);
  });

  it('has cycle', () => {
    const allEdges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 1, to: 2, weight: 2 },
      { from: 0, to: 2, weight: 3 }
    ];
    expect(isSpanningTree(3, allEdges, allEdges)).toBe(false);
  });

  it('does not connect all vertices', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 2, to: 3, weight: 2 }
    ];
    expect(isSpanningTree(4, edges, edges)).toBe(false);
  });

  it('empty tree for single node', () => {
    expect(isSpanningTree(1, [], [])).toBe(true);
  });
});

describe('kruskalWithPaths', () => {
  it('returns edges and weight', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 },
      { from: 1, to: 2, weight: 2 }
    ];
    const result = kruskalWithPaths(3, edges);
    expect(result).not.toBeNull();
    expect(result!.edges).toHaveLength(2);
    expect(result!.totalWeight).toBe(3);
  });

  it('disconnected returns null', () => {
    const edges: Edge[] = [
      { from: 0, to: 1, weight: 1 }
    ];
    expect(kruskalWithPaths(3, edges)).toBeNull();
  });

  it('single node', () => {
    const result = kruskalWithPaths(1, []);
    expect(result).not.toBeNull();
    expect(result!.edges).toEqual([]);
    expect(result!.totalWeight).toBe(0);
  });
});

describe('edge cases', () => {
  it('zero nodes', () => {
    expect(kruskal(0, [])).toEqual([]);
    expect(mstWeight(0, [])).toBe(0);
  });

  it('no edges with multiple nodes', () => {
    expect(kruskal(3, [])).toBeNull();
    expect(mstWeight(3, [])).toBeNull();
  });

  it('self-loops are ignored', () => {
    const edges: Edge[] = [
      { from: 0, to: 0, weight: 1 },
      { from: 0, to: 1, weight: 2 },
      { from: 1, to: 2, weight: 3 }
    ];
    const result = kruskal(3, edges);
    expect(result).toHaveLength(2);
  });

  it('large graph', () => {
    const edges: Edge[] = [];
    for (let i = 0; i < 99; i++) {
      edges.push({ from: i, to: i + 1, weight: i + 1 });
    }
    const result = kruskal(100, edges);
    expect(result).toHaveLength(99);
    const totalWeight = result!.reduce((sum, e) => sum + e.weight, 0);
    expect(totalWeight).toBe(4950);
  });
});

describe('performance', () => {
  it('handles 100 nodes, 500 edges', () => {
    const edges: Edge[] = [];
    for (let i = 0; i < 500; i++) {
      edges.push({
        from: Math.floor(Math.random() * 100),
        to: Math.floor(Math.random() * 100),
        weight: Math.random() * 100
      });
    }
    const start = Date.now();
    const result = kruskal(100, edges);
    const elapsed = Date.now() - start;
    if (result) {
      expect(result).toHaveLength(99);
    }
    expect(elapsed).toBeLessThan(1000);
  });
});
]==],
  },

  {
    name = "Sudoku Solver",
    difficulty = "medium",
    stub = [=[
/**
 * Sudoku Solver
 *
 * Implement a backtracking algorithm to solve Sudoku puzzles.
 *
 * Sudoku is a 9x9 grid where each row, column, and 3x3 box
 * must contain all digits from 1 to 9 exactly once.
 *
 * Implement:
 * - solveSudoku(board: number[][]): number[][] | null
 *   Take a 9x9 board where 0 represents empty cells.
 *   Return the solved board, or null if no solution exists.
 *
 * - isValidPlacement(board: number[][], row: number, col: number, num: number): boolean
 *   Check if placing num at (row, col) violates Sudoku rules.
 *
 * - findEmptyCell(board: number[][]): [number, number] | null
 *   Find the next empty cell (value 0). Return [row, col] or null if full.
 *
 * - validateSolution(board: number[][]): boolean
 *   Verify a completed board is a valid Sudoku solution.
 *
 * - solveSudokuWithSteps(board: number[][]): { board: number[][], steps: number }
 *   Return the solved board plus the number of backtracking steps taken.
 *
 * Bonus: Implement solveSudokuOptimized that uses constraint propagation
 * (maintain possible values for each cell) to reduce backtracking.
 */

export function solveSudoku(board: number[][]): number[][] | null {
  // YOUR CODE HERE
  return null;
}

export function isValidPlacement(
  board: number[][],
  row: number,
  col: number,
  num: number
): boolean {
  // YOUR CODE HERE
  return false;
}

export function findEmptyCell(board: number[][]): [number, number] | null {
  // YOUR CODE HERE
  return null;
}

export function validateSolution(board: number[][]): boolean {
  // YOUR CODE HERE
  return false;
}

export function solveSudokuWithSteps(board: number[][]): { board: number[][]; steps: number } {
  // YOUR CODE HERE
  return { board: [], steps: 0 };
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { solveSudoku, isValidPlacement, findEmptyCell, validateSolution, solveSudokuWithSteps } from './challenge';

function deepCopyBoard(board: number[][]): number[][] {
  return board.map(row => [...row]);
}

function boardsEqual(a: number[][], b: number[][]): boolean {
  if (a.length !== b.length) return false;
  for (let i = 0; i < a.length; i++) {
    if (a[i].length !== b[i].length) return false;
    for (let j = 0; j < a[i].length; j++) {
      if (a[i][j] !== b[i][j]) return false;
    }
  }
  return true;
}

describe('isValidPlacement', () => {
  it('allows valid placement in empty board', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    expect(isValidPlacement(board, 0, 0, 5)).toBe(true);
  });

  it('rejects duplicate in same row', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    board[0][3] = 5;
    expect(isValidPlacement(board, 0, 7, 5)).toBe(false);
  });

  it('rejects duplicate in same column', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    board[4][5] = 7;
    expect(isValidPlacement(board, 8, 5, 7)).toBe(false);
  });

  it('rejects duplicate in same 3x3 box', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    board[1][1] = 3;
    expect(isValidPlacement(board, 2, 2, 3)).toBe(false);
  });

  it('allows placement when only row conflict exists elsewhere', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    board[0][0] = 5;
    expect(isValidPlacement(board, 1, 1, 5)).toBe(true);
  });
});

describe('findEmptyCell', () => {
  it('finds first empty cell', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    board[0][0] = 1;
    board[0][1] = 0;
    expect(findEmptyCell(board)).toEqual([0, 1]);
  });

  it('returns null for full board', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(1));
    expect(findEmptyCell(board)).toBeNull();
  });

  it('finds empty cell in middle of board', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(1));
    board[4][4] = 0;
    board[5][5] = 0;
    expect(findEmptyCell(board)).toEqual([4, 4]);
  });
});

describe('validateSolution', () => {
  it('validates a correct solution', () => {
    const solution = [
      [5, 3, 4, 6, 7, 8, 9, 1, 2],
      [6, 7, 2, 1, 9, 5, 3, 4, 8],
      [1, 9, 8, 3, 4, 2, 5, 6, 7],
      [8, 5, 9, 7, 6, 1, 4, 2, 3],
      [4, 2, 6, 8, 5, 3, 7, 9, 1],
      [7, 1, 3, 9, 2, 4, 8, 5, 6],
      [9, 6, 1, 5, 3, 7, 2, 8, 4],
      [2, 8, 7, 4, 1, 9, 6, 3, 5],
      [3, 4, 5, 2, 8, 6, 1, 7, 9]
    ];
    expect(validateSolution(solution)).toBe(true);
  });

  it('rejects solution with duplicate in row', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    board[0][0] = 1;
    board[0][1] = 1; // Duplicate
    expect(validateSolution(board)).toBe(false);
  });

  it('rejects solution with duplicate in column', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    board[0][0] = 1;
    board[1][0] = 1; // Duplicate
    expect(validateSolution(board)).toBe(false);
  });

  it('rejects solution with duplicate in box', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    board[0][0] = 1;
    board[1][1] = 1; // Duplicate in same box
    expect(validateSolution(board)).toBe(false);
  });

  it('rejects incomplete board', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    expect(validateSolution(board)).toBe(false);
  });

  it('rejects board with invalid numbers', () => {
    const board = Array(9).fill(null).map(() => Array(9).fill(0));
    board[0][0] = 10; // Invalid
    expect(validateSolution(board)).toBe(false);
  });
});

describe('solveSudoku', () => {
  it('solves easy puzzle', () => {
    const puzzle = [
      [5, 3, 0, 0, 7, 0, 0, 0, 0],
      [6, 0, 0, 1, 9, 5, 0, 0, 0],
      [0, 9, 8, 0, 0, 0, 0, 6, 0],
      [8, 0, 0, 0, 6, 0, 0, 0, 3],
      [4, 0, 0, 8, 0, 3, 0, 0, 1],
      [7, 0, 0, 0, 2, 0, 0, 0, 6],
      [0, 6, 0, 0, 0, 0, 2, 8, 0],
      [0, 0, 0, 4, 1, 9, 0, 0, 5],
      [0, 0, 0, 0, 8, 0, 0, 7, 9]
    ];
    const solution = solveSudoku(puzzle);
    expect(solution).not.toBeNull();
    expect(validateSolution(solution!)).toBe(true);
    // Verify original clues are preserved
    expect(solution![0][0]).toBe(5);
    expect(solution![0][4]).toBe(7);
    expect(solution![1][0]).toBe(6);
  });

  it('solves puzzle with minimal clues', () => {
    // 17-clue puzzle (minimum for unique solution)
    const puzzle = [
      [0, 0, 0, 0, 0, 0, 0, 1, 2],
      [0, 0, 0, 0, 3, 5, 0, 0, 0],
      [0, 0, 0, 6, 0, 0, 0, 7, 0],
      [7, 0, 0, 0, 0, 0, 3, 0, 0],
      [0, 0, 0, 4, 0, 0, 8, 0, 0],
      [1, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 2, 0, 0, 0, 0],
      [0, 8, 0, 0, 0, 0, 0, 4, 0],
      [0, 5, 0, 0, 0, 0, 6, 0, 0]
    ];
    const solution = solveSudoku(puzzle);
    expect(solution).not.toBeNull();
    expect(validateSolution(solution!)).toBe(true);
  });

  it('returns null for unsolvable puzzle', () => {
    const invalid = [
      [1, 1, 0, 0, 0, 0, 0, 0, 0], // Duplicate 1s in row
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0]
    ];
    expect(solveSudoku(invalid)).toBeNull();
  });

  it('solves empty board', () => {
    const empty = Array(9).fill(null).map(() => Array(9).fill(0));
    const solution = solveSudoku(empty);
    expect(solution).not.toBeNull();
    expect(validateSolution(solution!)).toBe(true);
  });

  it('does not modify input board', () => {
    const puzzle = [
      [5, 3, 0, 0, 7, 0, 0, 0, 0],
      [6, 0, 0, 1, 9, 5, 0, 0, 0],
      [0, 9, 8, 0, 0, 0, 0, 6, 0],
      [8, 0, 0, 0, 6, 0, 0, 0, 3],
      [4, 0, 0, 8, 0, 3, 0, 0, 1],
      [7, 0, 0, 0, 2, 0, 0, 0, 6],
      [0, 6, 0, 0, 0, 0, 2, 8, 0],
      [0, 0, 0, 4, 1, 9, 0, 0, 5],
      [0, 0, 0, 0, 8, 0, 0, 7, 9]
    ];
    const original = deepCopyBoard(puzzle);
    solveSudoku(puzzle);
    expect(boardsEqual(puzzle, original)).toBe(true);
  });

  it('solves multiple puzzles in sequence', () => {
    const puzzles = [
      [
        [0, 0, 3, 0, 2, 0, 6, 0, 0],
        [9, 0, 0, 3, 0, 5, 0, 0, 1],
        [0, 0, 1, 8, 0, 6, 4, 0, 0],
        [0, 0, 8, 1, 0, 2, 9, 0, 0],
        [7, 0, 0, 0, 0, 0, 0, 0, 8],
        [0, 0, 6, 7, 0, 8, 2, 0, 0],
        [0, 0, 2, 6, 0, 9, 5, 0, 0],
        [8, 0, 0, 2, 0, 3, 0, 0, 9],
        [0, 0, 5, 0, 1, 0, 3, 0, 0]
      ],
      [
        [1, 0, 0, 4, 8, 9, 0, 0, 6],
        [7, 3, 0, 0, 0, 0, 0, 4, 0],
        [0, 0, 0, 0, 0, 1, 2, 9, 5],
        [0, 0, 7, 1, 2, 0, 6, 0, 0],
        [5, 0, 0, 7, 0, 3, 0, 0, 8],
        [0, 0, 6, 0, 9, 5, 7, 0, 0],
        [9, 1, 4, 6, 0, 0, 0, 0, 0],
        [0, 2, 0, 0, 0, 0, 0, 3, 7],
        [8, 0, 0, 5, 4, 2, 0, 0, 1]
      ]
    ];
    puzzles.forEach(puzzle => {
      const solution = solveSudoku(puzzle);
      expect(solution).not.toBeNull();
      expect(validateSolution(solution!)).toBe(true);
    });
  });
});

describe('solveSudokuWithSteps', () => {
  it('tracks backtracking steps', () => {
    const puzzle = [
      [5, 3, 0, 0, 7, 0, 0, 0, 0],
      [6, 0, 0, 1, 9, 5, 0, 0, 0],
      [0, 9, 8, 0, 0, 0, 0, 6, 0],
      [8, 0, 0, 0, 6, 0, 0, 0, 3],
      [4, 0, 0, 8, 0, 3, 0, 0, 1],
      [7, 0, 0, 0, 2, 0, 0, 0, 6],
      [0, 6, 0, 0, 0, 0, 2, 8, 0],
      [0, 0, 0, 4, 1, 9, 0, 0, 5],
      [0, 0, 0, 0, 8, 0, 0, 7, 9]
    ];
    const result = solveSudokuWithSteps(puzzle);
    expect(result.board).not.toBeNull();
    expect(validateSolution(result.board)).toBe(true);
    expect(result.steps).toBeGreaterThan(0);
  });

  it('reports fewer steps for easier puzzles', () => {
    const easyPuzzle = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0]
    ];
    // Empty board should be solved quickly (greedy fill)
    const result = solveSudokuWithSteps(easyPuzzle);
    expect(result.steps).toBeLessThan(100);
  });
});

describe('edge cases', () => {
  it('handles board with single empty cell', () => {
    const board = [
      [5, 3, 4, 6, 7, 8, 9, 1, 2],
      [6, 7, 2, 1, 9, 5, 3, 4, 8],
      [1, 9, 8, 3, 4, 2, 5, 6, 7],
      [8, 5, 9, 7, 6, 1, 4, 2, 3],
      [4, 2, 6, 8, 5, 3, 7, 9, 1],
      [7, 1, 3, 9, 2, 4, 8, 5, 6],
      [9, 6, 1, 5, 3, 7, 2, 8, 4],
      [2, 8, 7, 4, 1, 9, 6, 3, 5],
      [3, 4, 5, 2, 8, 6, 1, 7, 0] // Missing last cell
    ];
    const solution = solveSudoku(board);
    expect(solution).not.toBeNull();
    expect(solution![8][8]).toBe(9);
  });

  it('handles already solved board', () => {
    const solved = [
      [5, 3, 4, 6, 7, 8, 9, 1, 2],
      [6, 7, 2, 1, 9, 5, 3, 4, 8],
      [1, 9, 8, 3, 4, 2, 5, 6, 7],
      [8, 5, 9, 7, 6, 1, 4, 2, 3],
      [4, 2, 6, 8, 5, 3, 7, 9, 1],
      [7, 1, 3, 9, 2, 4, 8, 5, 6],
      [9, 6, 1, 5, 3, 7, 2, 8, 4],
      [2, 8, 7, 4, 1, 9, 6, 3, 5],
      [3, 4, 5, 2, 8, 6, 1, 7, 9]
    ];
    const result = solveSudoku(solved);
    expect(result).not.toBeNull();
    expect(boardsEqual(result!, solved)).toBe(true);
  });
});
]=],
  },

  {
    name = "Red-Black Tree",
    difficulty = "hard",
    stub = [==[
/**
 * Red-Black Tree
 *
 * Implement a self-balancing Binary Search Tree with Red-Black properties.
 *
 * A Red-Black Tree is a BST where each node has a color (red or black) and
 * satisfies these properties:
 * 1. Every node is either red or black
 * 2. The root is black
 * 3. All leaves (NIL/null) are black
 * 4. If a node is red, both its children are black (no two consecutive reds)
 * 5. Every path from a node to its descendant leaves has the same black count
 *
 * These properties guarantee O(log n) operations by keeping the tree balanced.
 *
 * Implement the RedBlackTree class with:
 * - insert(value: number): void — Insert a value, rebalancing as needed
 * - search(value: number): boolean — Return true if value exists
 * - delete(value: number): boolean — Remove a value, rebalancing as needed
 * - inOrder(): number[] — Return values in sorted order
 * - isValid(): boolean — Verify all Red-Black properties are satisfied
 * - blackHeight(): number — Return the black height (should be consistent)
 * - height(): number — Return the tree height
 *
 * For insert: Use recoloring and rotations (left/right) to maintain properties.
 * For delete: Handle the more complex delete rebalancing cases.
 *
 * Bonus: Implement range queries:
 * - rangeSearch(min: number, max: number): number[] — Values in range [min, max]
 */

export class RedBlackTree {
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

  isValid(): boolean {
    // YOUR CODE HERE
    return true;
  }

  blackHeight(): number {
    // YOUR CODE HERE
    return 0;
  }

  height(): number {
    // YOUR CODE HERE
    return 0;
  }

  rangeSearch(min: number, max: number): number[] {
    // YOUR CODE HERE
    return [];
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { RedBlackTree } from './challenge';

describe('RedBlackTree', () => {
  it('creates empty tree', () => {
    const tree = new RedBlackTree();
    expect(tree.inOrder()).toEqual([]);
    expect(tree.isValid()).toBe(true);
    expect(tree.height()).toBe(0);
  });

  it('inserts single value', () => {
    const tree = new RedBlackTree();
    tree.insert(5);
    expect(tree.search(5)).toBe(true);
    expect(tree.inOrder()).toEqual([5]);
    expect(tree.isValid()).toBe(true);
  });

  it('inserts multiple values in order', () => {
    const tree = new RedBlackTree();
    tree.insert(1);
    tree.insert(2);
    tree.insert(3);
    expect(tree.inOrder()).toEqual([1, 2, 3]);
    expect(tree.isValid()).toBe(true);
  });

  it('inserts multiple values in reverse order', () => {
    const tree = new RedBlackTree();
    tree.insert(5);
    tree.insert(4);
    tree.insert(3);
    tree.insert(2);
    tree.insert(1);
    expect(tree.inOrder()).toEqual([1, 2, 3, 4, 5]);
    expect(tree.isValid()).toBe(true);
  });

  it('inserts random values and stays balanced', () => {
    const tree = new RedBlackTree();
    const values = [50, 25, 75, 10, 30, 60, 90, 5, 15, 27, 35, 55, 65, 85, 95];
    values.forEach(v => tree.insert(v));
    expect(tree.inOrder()).toEqual(values.sort((a, b) => a - b));
    expect(tree.isValid()).toBe(true);
    // Height should be O(log n), for 15 nodes max height ~ 2*log2(16) = 8
    expect(tree.height()).toBeLessThan(10);
  });

  it('search finds existing values', () => {
    const tree = new RedBlackTree();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => tree.insert(v));
    expect(tree.search(10)).toBe(true);
    expect(tree.search(5)).toBe(true);
    expect(tree.search(20)).toBe(true);
  });

  it('search returns false for missing values', () => {
    const tree = new RedBlackTree();
    [10, 5, 15].forEach(v => tree.insert(v));
    expect(tree.search(1)).toBe(false);
    expect(tree.search(7)).toBe(false);
    expect(tree.search(99)).toBe(false);
  });

  it('delete leaf node', () => {
    const tree = new RedBlackTree();
    [10, 5, 15, 3, 7].forEach(v => tree.insert(v));
    expect(tree.delete(3)).toBe(true);
    expect(tree.search(3)).toBe(false);
    expect(tree.isValid()).toBe(true);
  });

  it('delete node with one child', () => {
    const tree = new RedBlackTree();
    [10, 5, 15, 3].forEach(v => tree.insert(v));
    expect(tree.delete(5)).toBe(true);
    expect(tree.search(5)).toBe(false);
    expect(tree.search(3)).toBe(true);
    expect(tree.isValid()).toBe(true);
  });

  it('delete node with two children', () => {
    const tree = new RedBlackTree();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => tree.insert(v));
    expect(tree.delete(10)).toBe(true);
    expect(tree.search(10)).toBe(false);
    expect(tree.isValid()).toBe(true);
    expect(tree.inOrder()).toEqual([3, 5, 7, 12, 15, 20]);
  });

  it('delete root node', () => {
    const tree = new RedBlackTree();
    tree.insert(10);
    tree.insert(5);
    tree.insert(15);
    expect(tree.delete(10)).toBe(true);
    expect(tree.search(10)).toBe(false);
    expect(tree.isValid()).toBe(true);
  });

  it('delete non-existent value', () => {
    const tree = new RedBlackTree();
    [10, 5, 15].forEach(v => tree.insert(v));
    expect(tree.delete(99)).toBe(false);
  });

  it('delete all nodes', () => {
    const tree = new RedBlackTree();
    [10, 5, 15].forEach(v => tree.insert(v));
    tree.delete(10);
    tree.delete(5);
    tree.delete(15);
    expect(tree.inOrder()).toEqual([]);
    expect(tree.isValid()).toBe(true);
  });

  it('handles duplicate insertions', () => {
    const tree = new RedBlackTree();
    tree.insert(5);
    tree.insert(5);
    tree.insert(5);
    expect(tree.inOrder()).toEqual([5]);
    expect(tree.isValid()).toBe(true);
  });

  it('rangeSearch returns values in range', () => {
    const tree = new RedBlackTree();
    [5, 10, 15, 20, 25, 30].forEach(v => tree.insert(v));
    expect(tree.rangeSearch(10, 25)).toEqual([10, 15, 20, 25]);
    expect(tree.rangeSearch(0, 100)).toEqual([5, 10, 15, 20, 25, 30]);
    expect(tree.rangeSearch(12, 18)).toEqual([15]);
    expect(tree.rangeSearch(50, 100)).toEqual([]);
  });

  it('blackHeight is consistent across all paths', () => {
    const tree = new RedBlackTree();
    for (let i = 1; i <= 20; i++) {
      tree.insert(i);
    }
    expect(tree.isValid()).toBe(true);
    const bh = tree.blackHeight();
    expect(bh).toBeGreaterThan(0);
  });

  it('stress test with 100 insertions', () => {
    const tree = new RedBlackTree();
    const values: number[] = [];
    for (let i = 0; i < 100; i++) {
      const val = Math.floor(Math.random() * 1000);
      values.push(val);
      tree.insert(val);
    }
    expect(tree.isValid()).toBe(true);
    expect(tree.height()).toBeLessThan(20); // log2(100) * 2 ≈ 14
  });

  it('stress test with sequential insert then delete', () => {
    const tree = new RedBlackTree();
    for (let i = 1; i <= 50; i++) {
      tree.insert(i);
    }
    expect(tree.isValid()).toBe(true);
    for (let i = 1; i <= 25; i++) {
      tree.delete(i);
    }
    expect(tree.isValid()).toBe(true);
    for (let i = 26; i <= 50; i++) {
      expect(tree.search(i)).toBe(true);
    }
    for (let i = 1; i <= 25; i++) {
      expect(tree.search(i)).toBe(false);
    }
  });

  it('handles negative values', () => {
    const tree = new RedBlackTree();
    [-5, -10, -3, 0, 5, 10].forEach(v => tree.insert(v));
    expect(tree.inOrder()).toEqual([-10, -5, -3, 0, 5, 10]);
    expect(tree.isValid()).toBe(true);
  });

  it('inOrder on empty tree', () => {
    const tree = new RedBlackTree();
    expect(tree.inOrder()).toEqual([]);
  });
});

// Red-Black property validation
describe('Red-Black properties', () => {
  it('root is always black after insertions', () => {
    const tree = new RedBlackTree();
    tree.insert(5);
    tree.insert(3);
    tree.insert(7);
    tree.insert(1);
    tree.insert(9);
    expect(tree.isValid()).toBe(true);
  });

  it('no two consecutive red nodes', () => {
    const tree = new RedBlackTree();
    for (let i = 0; i < 30; i++) {
      tree.insert(i);
    }
    expect(tree.isValid()).toBe(true);
  });

  it('maintains balance with sorted input', () => {
    const tree = new RedBlackTree();
    for (let i = 1; i <= 100; i++) {
      tree.insert(i);
    }
    expect(tree.isValid()).toBe(true);
    // Should be O(log n), not O(n) like unbalanced BST
    expect(tree.height()).toBeLessThan(15);
  });

  it('maintains balance with reverse sorted input', () => {
    const tree = new RedBlackTree();
    for (let i = 100; i >= 1; i--) {
      tree.insert(i);
    }
    expect(tree.isValid()).toBe(true);
    expect(tree.height()).toBeLessThan(15);
  });
});
]==],
  },
  {
    name = "Min-Max Stack",
    difficulty = "medium",
    stub = [=[
/**
 * Min-Max Stack
 *
 * Implement a stack that supports push, pop, peek, getMin, and getMax
 * all in O(1) time complexity.
 *
 * A standard stack supports push, pop, and peek in O(1), but finding
 * the min or max requires O(n) scanning. This challenge asks you to
 * augment the stack to track min and max efficiently.
 *
 * Implement the MinMaxStack class with:
 * - push(value: number): void — Push a value onto the stack
 * - pop(): number | null — Remove and return the top value, or null if empty
 * - peek(): number | null — Return the top value without removing
 * - getMin(): number | null — Return the minimum value in the stack
 * - getMax(): number | null — Return the maximum value in the stack
 * - size(): number — Return the number of elements
 * - isEmpty(): boolean — Check if the stack is empty
 *
 * Strategy hints:
 * - Use auxiliary stacks to track min/max at each level
 * - Or store tuples of (value, currentMin, currentMax) in each node
 * - Both approaches achieve O(1) for all operations with O(n) space
 *
 * Bonus: Implement getMinCount() and getMaxCount() to return how many
 * times the min/max value appears in the stack.
 */

export class MinMaxStack {
  constructor() {
    // YOUR CODE HERE
  }

  push(value: number): void {
    // YOUR CODE HERE
  }

  pop(): number | null {
    // YOUR CODE HERE
    return null;
  }

  peek(): number | null {
    // YOUR CODE HERE
    return null;
  }

  getMin(): number | null {
    // YOUR CODE HERE
    return null;
  }

  getMax(): number | null {
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

  getMinCount(): number {
    // YOUR CODE HERE
    return 0;
  }

  getMaxCount(): number {
    // YOUR CODE HERE
    return 0;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { MinMaxStack } from './challenge';

describe('MinMaxStack', () => {
  it('creates empty stack', () => {
    const stack = new MinMaxStack();
    expect(stack.isEmpty()).toBe(true);
    expect(stack.size()).toBe(0);
    expect(stack.peek()).toBeNull();
    expect(stack.getMin()).toBeNull();
    expect(stack.getMax()).toBeNull();
  });

  it('push single value', () => {
    const stack = new MinMaxStack();
    stack.push(5);
    expect(stack.size()).toBe(1);
    expect(stack.peek()).toBe(5);
    expect(stack.getMin()).toBe(5);
    expect(stack.getMax()).toBe(5);
    expect(stack.isEmpty()).toBe(false);
  });

  it('push multiple values ascending', () => {
    const stack = new MinMaxStack();
    stack.push(1);
    stack.push(2);
    stack.push(3);
    expect(stack.peek()).toBe(3);
    expect(stack.getMin()).toBe(1);
    expect(stack.getMax()).toBe(3);
    expect(stack.size()).toBe(3);
  });

  it('push multiple values descending', () => {
    const stack = new MinMaxStack();
    stack.push(3);
    stack.push(2);
    stack.push(1);
    expect(stack.peek()).toBe(1);
    expect(stack.getMin()).toBe(1);
    expect(stack.getMax()).toBe(3);
    expect(stack.size()).toBe(3);
  });

  it('push multiple values random order', () => {
    const stack = new MinMaxStack();
    [5, 2, 8, 1, 9, 3].forEach(v => stack.push(v));
    expect(stack.peek()).toBe(3);
    expect(stack.getMin()).toBe(1);
    expect(stack.getMax()).toBe(9);
  });

  it('pop returns values in LIFO order', () => {
    const stack = new MinMaxStack();
    [1, 2, 3].forEach(v => stack.push(v));
    expect(stack.pop()).toBe(3);
    expect(stack.pop()).toBe(2);
    expect(stack.pop()).toBe(1);
    expect(stack.pop()).toBeNull();
  });

  it('pop updates min/max correctly', () => {
    const stack = new MinMaxStack();
    stack.push(5);
    stack.push(2);
    stack.push(8);
    expect(stack.getMin()).toBe(2);
    expect(stack.getMax()).toBe(8);
    stack.pop(); // Remove 8
    expect(stack.getMax()).toBe(5);
    stack.pop(); // Remove 2
    expect(stack.getMin()).toBe(5);
    expect(stack.getMax()).toBe(5);
  });

  it('pop from empty stack returns null', () => {
    const stack = new MinMaxStack();
    expect(stack.pop()).toBeNull();
  });

  it('peek does not remove element', () => {
    const stack = new MinMaxStack();
    stack.push(42);
    expect(stack.peek()).toBe(42);
    expect(stack.peek()).toBe(42);
    expect(stack.size()).toBe(1);
  });

  it('handles negative values', () => {
    const stack = new MinMaxStack();
    [-5, -10, -3, 0, 5].forEach(v => stack.push(v));
    expect(stack.getMin()).toBe(-10);
    expect(stack.getMax()).toBe(5);
  });

  it('handles duplicate min values', () => {
    const stack = new MinMaxStack();
    stack.push(5);
    stack.push(2);
    stack.push(2);
    stack.push(8);
    expect(stack.getMin()).toBe(2);
    expect(stack.getMinCount()).toBe(2);
    stack.pop();
    stack.pop();
    expect(stack.getMinCount()).toBe(1);
  });

  it('handles duplicate max values', () => {
    const stack = new MinMaxStack();
    stack.push(2);
    stack.push(8);
    stack.push(5);
    stack.push(8);
    expect(stack.getMax()).toBe(8);
    expect(stack.getMaxCount()).toBe(2);
    stack.pop();
    expect(stack.getMaxCount()).toBe(1);
  });

  it('getMinCount on empty stack', () => {
    const stack = new MinMaxStack();
    expect(stack.getMinCount()).toBe(0);
  });

  it('getMaxCount on empty stack', () => {
    const stack = new MinMaxStack();
    expect(stack.getMaxCount()).toBe(0);
  });

  it('all same values', () => {
    const stack = new MinMaxStack();
    [7, 7, 7, 7].forEach(v => stack.push(v));
    expect(stack.getMin()).toBe(7);
    expect(stack.getMax()).toBe(7);
    expect(stack.getMinCount()).toBe(4);
    expect(stack.getMaxCount()).toBe(4);
  });

  it('interleaved push and pop', () => {
    const stack = new MinMaxStack();
    stack.push(10);
    stack.push(5);
    stack.pop();
    expect(stack.getMin()).toBe(10);
    expect(stack.getMax()).toBe(10);
    stack.push(3);
    stack.push(8);
    expect(stack.getMin()).toBe(3);
    expect(stack.getMax()).toBe(10);
  });

  it('stress test with many operations', () => {
    const stack = new MinMaxStack();
    const values = [50, 25, 75, 10, 90, 5, 95, 0, 100];
    values.forEach(v => stack.push(v));
    expect(stack.getMin()).toBe(0);
    expect(stack.getMax()).toBe(100);
    expect(stack.size()).toBe(9);
    
    stack.pop(); // 100
    stack.pop(); // 0
    expect(stack.getMin()).toBe(5);
    expect(stack.getMax()).toBe(95);
  });

  it('large values', () => {
    const stack = new MinMaxStack();
    stack.push(Number.MAX_SAFE_INTEGER);
    stack.push(Number.MIN_SAFE_INTEGER);
    stack.push(0);
    expect(stack.getMin()).toBe(Number.MIN_SAFE_INTEGER);
    expect(stack.getMax()).toBe(Number.MAX_SAFE_INTEGER);
  });

  it('single element operations', () => {
    const stack = new MinMaxStack();
    stack.push(42);
    expect(stack.pop()).toBe(42);
    expect(stack.isEmpty()).toBe(true);
    stack.push(100);
    expect(stack.peek()).toBe(100);
    expect(stack.getMin()).toBe(100);
    expect(stack.getMax()).toBe(100);
  });

  it('pop all elements', () => {
    const stack = new MinMaxStack();
    [1, 2, 3, 4, 5].forEach(v => stack.push(v));
    for (let i = 0; i < 5; i++) {
      stack.pop();
    }
    expect(stack.isEmpty()).toBe(true);
    expect(stack.size()).toBe(0);
    expect(stack.getMin()).toBeNull();
    expect(stack.getMax()).toBeNull();
  });
});
]=],
  },

  {
    name = "Command Pattern with Undo/Redo",
    difficulty = "medium",
    stub = [=[
/**
 * Command Pattern with Undo/Redo
 *
 * Implement the Command design pattern with full undo/redo support.
 *
 * The Command pattern encapsulates requests as objects, enabling:
 * - Parameterization of clients with different requests
 * - Queueing and logging of operations
 * - Undo/redo functionality
 * - Transactional behavior (macro commands)
 *
 * Implement:
 * - Command interface: execute(), undo(), getDescription()
 * - CommandHistory class: push(command), undo(), redo(), clear()
 * - Concrete commands: InsertText, DeleteText, FormatText (for a text editor)
 * - MacroCommand: Combine multiple commands into one atomic operation
 *
 * Requirements:
 * - Undo stack and redo stack management
 * - Proper state restoration on undo
 * - Clearing redo stack on new command after undo
 * - Support for macro/nested commands
 */

export interface Command {
  execute(): void;
  undo(): void;
  getDescription(): string;
}

export class CommandHistory {
  constructor() {
    // YOUR CODE HERE
  }

  push(command: Command): void {
    // YOUR CODE HERE
  }

  undo(): Command | null {
    // YOUR CODE HERE
    return null;
  }

  redo(): Command | null {
    // YOUR CODE HERE
    return null;
  }

  clear(): void {
    // YOUR CODE HERE
  }

  canUndo(): boolean {
    // YOUR CODE HERE
    return false;
  }

  canRedo(): boolean {
    // YOUR CODE HERE
    return false;
  }

  getUndoStackSize(): number {
    // YOUR CODE HERE
    return 0;
  }

  getRedoStackSize(): number {
    // YOUR CODE HERE
    return 0;
  }
}

// Text editor state for concrete commands
export interface TextEditorState {
  content: string;
  cursorPosition: number;
}

export class InsertTextCommand implements Command {
  constructor(state: TextEditorState, text: string, position: number) {
    // YOUR CODE HERE
  }

  execute(): void {
    // YOUR CODE HERE
  }

  undo(): void {
    // YOUR CODE HERE
  }

  getDescription(): string {
    // YOUR CODE HERE
    return '';
  }
}

export class DeleteTextCommand implements Command {
  constructor(state: TextEditorState, start: number, length: number) {
    // YOUR CODE HERE
  }

  execute(): void {
    // YOUR CODE HERE
  }

  undo(): void {
    // YOUR CODE HERE
  }

  getDescription(): string {
    // YOUR CODE HERE
    return '';
  }
}

export class MacroCommand implements Command {
  constructor() {
    // YOUR CODE HERE
  }

  add(command: Command): void {
    // YOUR CODE HERE
  }

  execute(): void {
    // YOUR CODE HERE
  }

  undo(): void {
    // YOUR CODE HERE
  }

  getDescription(): string {
    // YOUR CODE HERE
    return '';
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import {
  CommandHistory,
  InsertTextCommand,
  DeleteTextCommand,
  MacroCommand,
  type TextEditorState
} from './challenge';

function createEditorState(content: string = '', cursorPosition: number = 0): TextEditorState {
  return { content, cursorPosition };
}

describe('CommandHistory', () => {
  it('creates empty history', () => {
    const history = new CommandHistory();
    expect(history.canUndo()).toBe(false);
    expect(history.canRedo()).toBe(false);
    expect(history.getUndoStackSize()).toBe(0);
    expect(history.getRedoStackSize()).toBe(0);
  });

  it('pushes commands to undo stack', () => {
    const history = new CommandHistory();
    const state = createEditorState('hello');
    const cmd = new InsertTextCommand(state, ' world', 5);
    history.push(cmd);
    expect(history.canUndo()).toBe(true);
    expect(history.getUndoStackSize()).toBe(1);
  });

  it('undo executes undo on command', () => {
    const history = new CommandHistory();
    const state = createEditorState('hello');
    const cmd = new InsertTextCommand(state, ' world', 5);
    cmd.execute();
    expect(state.content).toBe('hello world');
    history.push(cmd);
    history.undo();
    expect(state.content).toBe('hello');
  });

  it('undo moves command to redo stack', () => {
    const history = new CommandHistory();
    const state = createEditorState('hello');
    const cmd = new InsertTextCommand(state, ' world', 5);
    cmd.execute();
    history.push(cmd);
    history.undo();
    expect(history.canUndo()).toBe(false);
    expect(history.canRedo()).toBe(true);
    expect(history.getRedoStackSize()).toBe(1);
  });

  it('redo executes command again', () => {
    const history = new CommandHistory();
    const state = createEditorState('hello');
    const cmd = new InsertTextCommand(state, ' world', 5);
    cmd.execute();
    history.push(cmd);
    history.undo();
    expect(state.content).toBe('hello');
    history.redo();
    expect(state.content).toBe('hello world');
  });

  it('new command after undo clears redo stack', () => {
    const history = new CommandHistory();
    const state = createEditorState('hello');
    const cmd1 = new InsertTextCommand(state, ' world', 5);
    const cmd2 = new InsertTextCommand(state, '!', 11);
    cmd1.execute();
    history.push(cmd1);
    history.undo();
    expect(history.getRedoStackSize()).toBe(1);
    cmd2.execute();
    history.push(cmd2);
    expect(history.getRedoStackSize()).toBe(0);
    expect(history.canRedo()).toBe(false);
  });

  it('clear removes all history', () => {
    const history = new CommandHistory();
    const state = createEditorState('hello');
    const cmd = new InsertTextCommand(state, ' world', 5);
    cmd.execute();
    history.push(cmd);
    history.undo();
    history.clear();
    expect(history.canUndo()).toBe(false);
    expect(history.canRedo()).toBe(false);
    expect(history.getUndoStackSize()).toBe(0);
    expect(history.getRedoStackSize()).toBe(0);
  });

  it('undo on empty returns null', () => {
    const history = new CommandHistory();
    expect(history.undo()).toBeNull();
  });

  it('redo on empty returns null', () => {
    const history = new CommandHistory();
    expect(history.redo()).toBeNull();
  });

  it('multiple undo/redo cycles', () => {
    const history = new CommandHistory();
    const state = createEditorState('');
    
    const cmd1 = new InsertTextCommand(state, 'hello', 0);
    const cmd2 = new InsertTextCommand(state, ' world', 5);
    const cmd3 = new InsertTextCommand(state, '!', 11);
    
    cmd1.execute();
    history.push(cmd1);
    cmd2.execute();
    history.push(cmd2);
    cmd3.execute();
    history.push(cmd3);
    
    expect(state.content).toBe('hello world!');
    
    history.undo();
    expect(state.content).toBe('hello world');
    history.undo();
    expect(state.content).toBe('hello');
    history.undo();
    expect(state.content).toBe('');
    
    history.redo();
    expect(state.content).toBe('hello');
    history.redo();
    expect(state.content).toBe('hello world');
    history.redo();
    expect(state.content).toBe('hello world!');
  });
});

describe('InsertTextCommand', () => {
  it('inserts text at position', () => {
    const state = createEditorState('hello', 5);
    const cmd = new InsertTextCommand(state, ' world', 5);
    cmd.execute();
    expect(state.content).toBe('hello world');
    expect(state.cursorPosition).toBe(11);
  });

  it('inserts at beginning', () => {
    const state = createEditorState('world', 5);
    const cmd = new InsertTextCommand(state, 'hello ', 0);
    cmd.execute();
    expect(state.content).toBe('hello world');
  });

  it('undo removes inserted text', () => {
    const state = createEditorState('hello', 5);
    const cmd = new InsertTextCommand(state, ' world', 5);
    cmd.execute();
    expect(state.content).toBe('hello world');
    cmd.undo();
    expect(state.content).toBe('hello');
    expect(state.cursorPosition).toBe(5);
  });

  it('getDescription returns description', () => {
    const state = createEditorState('hello', 5);
    const cmd = new InsertTextCommand(state, ' world', 5);
    expect(cmd.getDescription()).toContain('Insert');
  });
});

describe('DeleteTextCommand', () => {
  it('deletes text at position', () => {
    const state = createEditorState('hello world', 5);
    const cmd = new DeleteTextCommand(state, 5, 6);
    cmd.execute();
    expect(state.content).toBe('hello');
  });

  it('deletes at beginning', () => {
    const state = createEditorState('hello world', 5);
    const cmd = new DeleteTextCommand(state, 0, 6);
    cmd.execute();
    expect(state.content).toBe('world');
  });

  it('undo restores deleted text', () => {
    const state = createEditorState('hello world', 5);
    const cmd = new DeleteTextCommand(state, 5, 6);
    cmd.execute();
    expect(state.content).toBe('hello');
    cmd.undo();
    expect(state.content).toBe('hello world');
    expect(state.cursorPosition).toBe(5);
  });

  it('getDescription returns description', () => {
    const state = createEditorState('hello world', 5);
    const cmd = new DeleteTextCommand(state, 5, 6);
    expect(cmd.getDescription()).toContain('Delete');
  });

  it('handles delete at end', () => {
    const state = createEditorState('hello', 5);
    const cmd = new DeleteTextCommand(state, 5, 1);
    cmd.execute();
    expect(state.content).toBe('hello');
  });

  it('handles delete beyond length', () => {
    const state = createEditorState('hello', 5);
    const cmd = new DeleteTextCommand(state, 3, 10);
    cmd.execute();
    expect(state.content).toBe('hel');
  });
});

describe('MacroCommand', () => {
  it('executes all sub-commands', () => {
    const state = createEditorState('', 0);
    const macro = new MacroCommand();
    
    const cmd1 = new InsertTextCommand(state, 'hello', 0);
    const cmd2 = new InsertTextCommand(state, ' world', 5);
    
    macro.add(cmd1);
    macro.add(cmd2);
    macro.execute();
    
    expect(state.content).toBe('hello world');
  });

  it('undoes all sub-commands in reverse', () => {
    const state = createEditorState('', 0);
    const macro = new MacroCommand();
    
    const cmd1 = new InsertTextCommand(state, 'hello', 0);
    const cmd2 = new InsertTextCommand(state, ' world', 5);
    
    macro.add(cmd1);
    macro.add(cmd2);
    macro.execute();
    expect(state.content).toBe('hello world');
    
    macro.undo();
    expect(state.content).toBe('');
  });

  it('getDescription describes macro', () => {
    const state = createEditorState('', 0);
    const macro = new MacroCommand();
    macro.add(new InsertTextCommand(state, 'hello', 0));
    macro.add(new DeleteTextCommand(state, 0, 2));
    expect(macro.getDescription()).toContain('Macro');
  });

  it('nested macros work correctly', () => {
    const state = createEditorState('', 0);
    const outerMacro = new MacroCommand();
    const innerMacro = new MacroCommand();
    
    innerMacro.add(new InsertTextCommand(state, 'inner', 0));
    outerMacro.add(innerMacro);
    outerMacro.add(new InsertTextCommand(state, ' outer', 5));
    
    outerMacro.execute();
    expect(state.content).toBe('inner outer');
    
    outerMacro.undo();
    expect(state.content).toBe('');
  });

  it('empty macro does nothing', () => {
    const state = createEditorState('hello', 5);
    const macro = new MacroCommand();
    const original = state.content;
    macro.execute();
    macro.undo();
    expect(state.content).toBe(original);
  });
});

describe('integration', () => {
  it('full editor workflow with history', () => {
    const history = new CommandHistory();
    const state = createEditorState('', 0);
    
    // Type "hello"
    const cmd1 = new InsertTextCommand(state, 'hello', 0);
    cmd1.execute();
    history.push(cmd1);
    
    // Type " world"
    const cmd2 = new InsertTextCommand(state, ' world', 5);
    cmd2.execute();
    history.push(cmd2);
    
    // Delete " world"
    const cmd3 = new DeleteTextCommand(state, 5, 6);
    cmd3.execute();
    history.push(cmd3);
    
    expect(state.content).toBe('hello');
    expect(history.getUndoStackSize()).toBe(3);
    
    // Undo delete
    history.undo();
    expect(state.content).toBe('hello world');
    
    // Undo " world"
    history.undo();
    expect(state.content).toBe('hello');
    
    // Undo "hello"
    history.undo();
    expect(state.content).toBe('');
    
    // Redo all
    history.redo();
    history.redo();
    history.redo();
    expect(state.content).toBe('hello world');
  });

  it('macro in history', () => {
    const history = new CommandHistory();
    const state = createEditorState('', 0);
    
    const macro = new MacroCommand();
    macro.add(new InsertTextCommand(state, 'hello', 0));
    macro.add(new InsertTextCommand(state, ' world', 5));
    
    macro.execute();
    history.push(macro);
    
    expect(state.content).toBe('hello world');
    expect(history.getUndoStackSize()).toBe(1);
    
    history.undo();
    expect(state.content).toBe('');
    
    history.redo();
    expect(state.content).toBe('hello world');
  });
});
]=],
  },

  {
    name = "Async Semaphore",
    difficulty = "medium",
    stub = [==[
/**
 * Async Semaphore
 *
 * Build a semaphore that limits how many asynchronous jobs may run at once.
 *
 * Implement the AsyncSemaphore class:
 * - constructor(maxConcurrent: number) initializes the semaphore with a positive limit.
 * - acquire(): Promise<() => void> waits for a permit and resolves to a release function.
 * - runExclusive<T>(task: () => Promise<T> | T): Promise<T> runs a task while holding a permit.
 *
 * Permits must be granted in FIFO order, release must be idempotent, and permits must be
 * released even when runExclusive throws or rejects.
 */

export class AsyncSemaphore {
  constructor(maxConcurrent: number) {
    // YOUR CODE HERE
  }

  acquire(): Promise<() => void> {
    // YOUR CODE HERE
    return Promise.resolve(() => {});
  }

  async runExclusive<T>(task: () => Promise<T> | T): Promise<T> {
    // YOUR CODE HERE
    return task();
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { AsyncSemaphore } from './challenge';

const tick = () => new Promise(resolve => setTimeout(resolve, 0));
const sleep = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

describe('Async Semaphore', () => {
  it('allows immediate acquire while capacity is available', async () => {
    const semaphore = new AsyncSemaphore(2);
    const releaseA = await semaphore.acquire();
    const releaseB = await semaphore.acquire();

    expect(typeof releaseA).toBe('function');
    expect(typeof releaseB).toBe('function');

    releaseA();
    releaseB();
  });

  it('queues acquire calls when capacity is exhausted', async () => {
    const semaphore = new AsyncSemaphore(1);
    const release = await semaphore.acquire();
    let acquired = false;

    const waiter = semaphore.acquire().then(nextRelease => {
      acquired = true;
      nextRelease();
    });

    await tick();
    expect(acquired).toBe(false);

    release();
    await waiter;
    expect(acquired).toBe(true);
  });

  it('grants queued permits in FIFO order', async () => {
    const semaphore = new AsyncSemaphore(1);
    const release = await semaphore.acquire();
    const order: number[] = [];

    const first = semaphore.acquire().then(nextRelease => {
      order.push(1);
      nextRelease();
    });
    const second = semaphore.acquire().then(nextRelease => {
      order.push(2);
      nextRelease();
    });

    release();
    await Promise.all([first, second]);

    expect(order).toEqual([1, 2]);
  });

  it('makes release idempotent', async () => {
    const semaphore = new AsyncSemaphore(1);
    const release = await semaphore.acquire();
    const order: string[] = [];

    const first = semaphore.acquire().then(nextRelease => {
      order.push('first');
      nextRelease();
    });
    const second = semaphore.acquire().then(nextRelease => {
      order.push('second');
      nextRelease();
    });

    release();
    release();
    await Promise.all([first, second]);

    expect(order).toEqual(['first', 'second']);
  });

  it('runs synchronous tasks through runExclusive', async () => {
    const semaphore = new AsyncSemaphore(1);

    await expect(semaphore.runExclusive(() => 42)).resolves.toBe(42);
  });

  it('runs asynchronous tasks through runExclusive', async () => {
    const semaphore = new AsyncSemaphore(1);

    await expect(semaphore.runExclusive(async () => {
      await tick();
      return 'done';
    })).resolves.toBe('done');
  });

  it('never exceeds the concurrency limit', async () => {
    const semaphore = new AsyncSemaphore(3);
    let active = 0;
    let maxActive = 0;

    await Promise.all(Array.from({ length: 12 }, (_, index) =>
      semaphore.runExclusive(async () => {
        active++;
        maxActive = Math.max(maxActive, active);
        await sleep(index % 3);
        active--;
      })
    ));

    expect(maxActive).toBeLessThanOrEqual(3);
  });

  it('releases permits after task rejection', async () => {
    const semaphore = new AsyncSemaphore(1);

    await expect(semaphore.runExclusive(async () => {
      throw new Error('boom');
    })).rejects.toThrow('boom');

    await expect(semaphore.runExclusive(() => 'recovered')).resolves.toBe('recovered');
  });

  it('releases permits after synchronous throws', async () => {
    const semaphore = new AsyncSemaphore(1);

    await expect(semaphore.runExclusive(() => {
      throw new Error('sync boom');
    })).rejects.toThrow('sync boom');

    const release = await semaphore.acquire();
    release();
  });

  it('rejects invalid concurrency limits', () => {
    expect(() => new AsyncSemaphore(0)).toThrow();
    expect(() => new AsyncSemaphore(-1)).toThrow();
    expect(() => new AsyncSemaphore(Number.NaN)).toThrow();
  });
});
]==],
  },

}

--- Deterministic challenge selection based on date.
--- Cycles sequentially through challenges using day-of-year.
function M.get_challenge_for_date(date_str)
  local y, m, d = date_str:match('(%d+)-(%d+)-(%d+)')
  if y and m and d then
    local t = os.time({ year = tonumber(y), month = tonumber(m), day = tonumber(d) })
    local jan1 = os.time({ year = tonumber(y), month = 1, day = 1 })
    local day_of_year = math.floor((t - jan1) / 86400)
    local idx = (day_of_year % #M.challenges) + 1
    return M.challenges[idx]
  end

  local seed = 0
  for i = 1, #date_str do
    seed = seed * 31 + string.byte(date_str, i)
  end
  local idx = (seed % #M.challenges) + 1
  return M.challenges[idx]
end

return M
