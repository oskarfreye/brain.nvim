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
    
    // Extract all and verify at each step
    while (!heap.isEmpty()) {
      heap.extractMin();
    }
  });

  it('interleaved insert and extract', () => {
    const heap = new MinHeap();
    heap.insert(10);
    heap.insert(5);
    expect(heap.extractMin()).toBe(5);
    heap.insert(3);
    expect(heap.extractMin()).toBe(3);
    heap.insert(8);
    expect(heap.extractMin()).toBe(8);
    expect(heap.extractMin()).toBe(10);
    expect(heap.isEmpty()).toBe(true);
  });
});

// Edge cases
describe('MinHeap edge cases', () => {
  it('heapify empty array', () => {
    const heap = new MinHeap([]);
    heap.heapify();
    expect(heap.isEmpty()).toBe(true);
  });

  it('heapify single element', () => {
    const heap = new MinHeap([42]);
    heap.heapify();
    expect(heap.peek()).toBe(42);
  });

  it('large heap operations', () => {
    const heap = new MinHeap();
    for (let i = 0; i < 10000; i++) {
      heap.insert(Math.random());
    }
    expect(heap.size()).toBe(10000);
    
    let last = -Infinity;
    while (!heap.isEmpty()) {
      const val = heap.extractMin()!;
      expect(val).toBeGreaterThanOrEqual(last);
      last = val;
    }
  });
});
]=],
  },
  {
    name = "Coin Change",
    difficulty = "medium",
    stub = [=[
/**
 * Coin Change
 *
 * Implement classic dynamic programming coin change problems.
 *
 * The coin change family of problems asks you to find optimal ways
 * to make change using a set of coin denominations. These problems
 * are fundamental examples of dynamic programming and appear in:
 * - Currency systems
 * - Resource allocation
 * - Knapsack variants
 * - Combinatorial optimization
 *
 * Implement:
 * - coinChange(coins: number[], amount: number): number
 *   Return the minimum number of coins needed to make the amount.
 *   Return -1 if it's impossible to make the amount.
 *
 * - coinChangeWays(coins: number[], amount: number): number
 *   Return the number of distinct ways to make the amount.
 *   Order doesn't matter (combinations, not permutations).
 *
 * - coinChangePermutations(coins: number[], amount: number): number
 *   Return the number of distinct permutations to make the amount.
 *   Order matters (different sequences count separately).
 *
 * - coinChangeWithLimit(coins: number[], amount: number, limits: number[]): number
 *   Each coin has a maximum usage limit. Return minimum coins needed,
 *   or -1 if impossible.
 *
 * Constraints:
 * - 1 <= coins.length <= 12
 * - 1 <= coins[i] <= 2^31 - 1
 * - 0 <= amount <= 10^4
 * - For coinChangeWithLimit: limits.length === coins.length
 *
 * Examples:
 * - coins = [1, 2, 5], amount = 11 → coinChange returns 3 (5+5+1)
 * - coins = [2], amount = 3 → coinChange returns -1 (impossible)
 * - coins = [1, 2, 5], amount = 5 → coinChangeWays returns 4:
 *   (5), (2+2+1), (2+1+1+1), (1+1+1+1+1)
 * - coins = [1, 2], amount = 3 → coinChangePermutations returns 3:
 *   (1+1+1), (1+2), (2+1)
 */

export function coinChange(coins: number[], amount: number): number {
  // YOUR CODE HERE
  return -1;
}

export function coinChangeWays(coins: number[], amount: number): number {
  // YOUR CODE HERE
  return 0;
}

export function coinChangePermutations(coins: number[], amount: number): number {
  // YOUR CODE HERE
  return 0;
}

export function coinChangeWithLimit(
  coins: number[],
  amount: number,
  limits: number[]
): number {
  // YOUR CODE HERE
  return -1;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { coinChange, coinChangeWays, coinChangePermutations, coinChangeWithLimit } from './challenge';

describe('coinChange', () => {
  it('basic example', () => {
    expect(coinChange([1, 2, 5], 11)).toBe(3); // 5+5+1
  });

  it('impossible case', () => {
    expect(coinChange([2], 3)).toBe(-1);
  });

  it('amount of 0', () => {
    expect(coinChange([1, 2, 5], 0)).toBe(0);
  });

  it('single coin matches amount', () => {
    expect(coinChange([5], 5)).toBe(1);
  });

  it('single coin cannot make amount', () => {
    expect(coinChange([5], 7)).toBe(-1);
  });

  it('multiple coins same value', () => {
    expect(coinChange([1, 1, 1], 3)).toBe(3);
  });

  it('large coins', () => {
    expect(coinChange([100, 50, 25], 75)).toBe(2); // 50+25
  });

  it('greedy would fail', () => {
    // Coins [1, 3, 4], amount 6
    // Greedy: 4+1+1 = 3 coins
    // Optimal: 3+3 = 2 coins
    expect(coinChange([1, 3, 4], 6)).toBe(2);
  });

  it('all coins larger than amount', () => {
    expect(coinChange([5, 10, 25], 3)).toBe(-1);
  });

  it('complex case', () => {
    expect(coinChange([1, 5, 10, 25], 63)).toBe(6); // 25+25+10+1+1+1
  });

  it('stress test', () => {
    expect(coinChange([1, 2, 5, 10, 20, 50, 100], 999)).toBe(12);
  });
});

describe('coinChangeWays', () => {
  it('basic example', () => {
    expect(coinChangeWays([1, 2, 5], 5)).toBe(4);
    // Ways: (5), (2+2+1), (2+1+1+1), (1+1+1+1+1)
  });

  it('amount of 0', () => {
    expect(coinChangeWays([1, 2, 5], 0)).toBe(1); // One way: use nothing
  });

  it('single coin', () => {
    expect(coinChangeWays([3], 6)).toBe(1); // Only 3+3
    expect(coinChangeWays([3], 5)).toBe(0); // Impossible
  });

  it('no ways to make amount', () => {
    expect(coinChangeWays([2, 4, 6], 5)).toBe(0);
  });

  it('coins include 1', () => {
    expect(coinChangeWays([1, 2], 3)).toBe(2);
    // Ways: (1+1+1), (2+1)
  });

  it('larger example', () => {
    expect(coinChangeWays([1, 2, 5], 10)).toBe(10);
  });

  it('order does not matter', () => {
    // (1+2) and (2+1) count as the same way
    expect(coinChangeWays([1, 2], 4)).toBe(3);
    // Ways: (1+1+1+1), (2+1+1), (2+2)
  });
});

describe('coinChangePermutations', () => {
  it('basic example', () => {
    expect(coinChangePermutations([1, 2], 3)).toBe(3);
    // Permutations: (1+1+1), (1+2), (2+1)
  });

  it('amount of 0', () => {
    expect(coinChangePermutations([1, 2, 5], 0)).toBe(1); // One way: use nothing
  });

  it('single coin', () => {
    expect(coinChangePermutations([3], 6)).toBe(1); // Only 3+3
    expect(coinChangePermutations([3], 5)).toBe(0); // Impossible
  });

  it('order matters', () => {
    // (1+2) and (2+1) count as different permutations
    expect(coinChangePermutations([1, 2], 4)).toBe(5);
    // Permutations: (1+1+1+1), (1+1+2), (1+2+1), (2+1+1), (2+2)
  });

  it('larger example', () => {
    expect(coinChangePermutations([1, 2, 5], 5)).toBe(13);
  });

  it('no permutations possible', () => {
    expect(coinChangePermutations([2, 4, 6], 5)).toBe(0);
  });
});

describe('coinChangeWithLimit', () => {
  it('basic example with limits', () => {
    // coins [1, 2, 5], limits [3, 2, 1], amount 11
    // Can use at most: three 1s, two 2s, one 5
    // Best: 5+2+2+1+1 = 5 coins (uses all limits)
    expect(coinChangeWithLimit([1, 2, 5], 11, [3, 2, 1])).toBe(5);
  });

  it('limits make it impossible', () => {
    // coins [1, 2, 5], limits [1, 1, 1], amount 10
    // Max possible: 1+2+5 = 8, cannot reach 10
    expect(coinChangeWithLimit([1, 2, 5], 10, [1, 1, 1])).toBe(-1);
  });

  it('amount of 0', () => {
    expect(coinChangeWithLimit([1, 2, 5], 0, [3, 2, 1])).toBe(0);
  });

  it('limits not binding', () => {
    // Limits are high enough not to matter
    expect(coinChangeWithLimit([1, 2, 5], 11, [100, 100, 100])).toBe(3);
  });

  it('single coin with limit', () => {
    expect(coinChangeWithLimit([5], 15, [3])).toBe(3); // 5+5+5
    expect(coinChangeWithLimit([5], 20, [3])).toBe(-1); // Can only use 3 coins = 15
  });

  it('complex limits', () => {
    // coins [2, 3, 5], limits [2, 3, 2], amount 17
    // Best: 5+5+3+2+2 = 5 coins
    expect(coinChangeWithLimit([2, 3, 5], 17, [2, 3, 2])).toBe(5);
  });

  it('zero limit for a coin', () => {
    // Cannot use coin at index 1 (value 3)
    expect(coinChangeWithLimit([1, 3, 5], 6, [6, 0, 6])).toBe(2); // 1+5
  });
});

describe('edge cases', () => {
  it('empty coins array', () => {
    expect(coinChange([], 5)).toBe(-1);
    expect(coinChangeWays([], 5)).toBe(0);
    expect(coinChangePermutations([], 5)).toBe(0);
    expect(coinChangeWithLimit([], 5, [])).toBe(-1);
  });

  it('coin with value 1', () => {
    expect(coinChange([1], 100)).toBe(100);
    expect(coinChangeWays([1], 100)).toBe(1);
    expect(coinChangePermutations([1], 100)).toBe(1);
  });

  it('large amount with efficient coins', () => {
    expect(coinChange([1, 10, 100], 999)).toBe(18); // 9*100 + 9*10 + 9*1
  });

  it('coins not sorted', () => {
    expect(coinChange([5, 1, 2], 11)).toBe(3);
    expect(coinChangeWays([5, 1, 2], 5)).toBe(4);
  });

  it('duplicate coin values', () => {
    expect(coinChange([1, 1, 2], 3)).toBe(2); // 1+2 or 1+2
    expect(coinChangeWays([1, 1, 2], 3)).toBe(2); // (1+1+1), (1+2)
  });
});
]=],
  },
  {
    name = "Task Scheduler with Priority and Delay",
    difficulty = "hard",
    stub = [=[
/**
 * Task Scheduler with Priority and Delay
 *
 * Implement a task scheduler that supports priority-based execution
 * with optional delayed scheduling.
 *
 * This combines concepts from:
 * - Priority queues (heap-based scheduling)
 * - Delayed execution (setTimeout-like behavior)
 * - Task cancellation
 * - Concurrent execution limits
 *
 * Implement the TaskScheduler class with:
 * - constructor(maxConcurrency?: number) — Initialize with max parallel tasks
 * - schedule(task: () => Promise<void>, options?: { priority?: number, delay?: number, id?: string }): string
 *   Schedule a task for execution. Returns a task ID.
 *   - priority: higher number = higher priority (default: 0)
 *   - delay: milliseconds to wait before task becomes eligible (default: 0)
 *   - id: optional custom ID; if omitted, generate unique ID
 * - cancel(taskId: string): boolean — Cancel a pending task. Returns true if cancelled.
 * - cancelAll(): number — Cancel all pending tasks. Returns count cancelled.
 * - getPendingCount(): number — Return number of tasks waiting to execute
 * - getRunningCount(): number — Return number of currently executing tasks
 * - setMaxConcurrency(max: number): void — Change max concurrency at runtime
 * - getMaxConcurrency(): number — Return current max concurrency setting
 * - waitForAll(): Promise<void> — Wait until all tasks complete (pending + running)
 * - pause(): void — Pause execution of new tasks (running tasks continue)
 * - resume(): void — Resume execution after pause
 * - isPaused(): boolean — Check if scheduler is paused
 *
 * The scheduler should:
 * - Execute tasks in priority order (highest first)
 * - Respect delay: tasks only become eligible after delay ms
 * - Never exceed maxConcurrency running tasks
 * - When a slot opens, pick the highest-priority eligible task
 * - Handle task errors gracefully (don't crash the scheduler)
 *
 * Bonus: Implement drain(timeoutMs?: number): Promise<number> that cancels all
 * pending tasks and waits for running tasks to complete, optionally timing out.
 */

export interface ScheduleOptions {
  priority?: number;
  delay?: number;
  id?: string;
}

export class TaskScheduler {
  constructor(maxConcurrency?: number) {
    // YOUR CODE HERE
  }

  schedule(task: () => Promise<void>, options?: ScheduleOptions): string {
    // YOUR CODE HERE
    return '';
  }

  cancel(taskId: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  cancelAll(): number {
    // YOUR CODE HERE
    return 0;
  }

  getPendingCount(): number {
    // YOUR CODE HERE
    return 0;
  }

  getRunningCount(): number {
    // YOUR CODE HERE
    return 0;
  }

  setMaxConcurrency(max: number): void {
    // YOUR CODE HERE
  }

  getMaxConcurrency(): number {
    // YOUR CODE HERE
    return 0;
  }

  waitForAll(): Promise<void> {
    // YOUR CODE HERE
    return Promise.resolve();
  }

  pause(): void {
    // YOUR CODE HERE
  }

  resume(): void {
    // YOUR CODE HERE
  }

  isPaused(): boolean {
    // YOUR CODE HERE
    return true;
  }

  drain(timeoutMs?: number): Promise<number> {
    // YOUR CODE HERE
    return Promise.resolve(0);
  }
}
]=],
    tests = [=[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { TaskScheduler } from './challenge';

describe('TaskScheduler', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('executes single task immediately', async () => {
    const scheduler = new TaskScheduler(1);
    const task = vi.fn(async () => {});
    scheduler.schedule(task);
    
    vi.advanceTimersByTime(0);
    await scheduler.waitForAll();
    
    expect(task).toHaveBeenCalledTimes(1);
  });

  it('respects maxConcurrency', async () => {
    const scheduler = new TaskScheduler(2);
    const starts: number[] = [];
    const ends: number[] = [];
    
    scheduler.schedule(async () => {
      starts.push(1);
      await new Promise(resolve => setTimeout(resolve, 100));
      ends.push(1);
    });
    scheduler.schedule(async () => {
      starts.push(2);
      await new Promise(resolve => setTimeout(resolve, 100));
      ends.push(2);
    });
    scheduler.schedule(async () => {
      starts.push(3);
      await new Promise(resolve => setTimeout(resolve, 100));
      ends.push(3);
    });
    
    vi.advanceTimersByTime(0);
    expect(starts).toEqual([1, 2]); // Only 2 start
    expect(scheduler.getRunningCount()).toBe(2);
    expect(scheduler.getPendingCount()).toBe(1);
    
    vi.advanceTimersByTime(100);
    await scheduler.waitForAll();
    expect(starts).toEqual([1, 2, 3]);
  });

  it('executes by priority', async () => {
    const scheduler = new TaskScheduler(1);
    const order: number[] = [];
    
    scheduler.schedule(async () => { order.push(1); }, { priority: 1 });
    scheduler.schedule(async () => { order.push(2); }, { priority: 3 });
    scheduler.schedule(async () => { order.push(3); }, { priority: 2 });
    
    vi.advanceTimersByTime(0);
    await scheduler.waitForAll();
    
    expect(order).toEqual([2, 3, 1]); // Highest priority first
  });

  it('respects delay', async () => {
    const scheduler = new TaskScheduler(1);
    const order: string[] = [];
    
    scheduler.schedule(async () => { order.push('immediate'); });
    scheduler.schedule(async () => { order.push('delayed'); }, { delay: 50 });
    
    vi.advanceTimersByTime(0);
    expect(order).toEqual(['immediate']);
    
    vi.advanceTimersByTime(50);
    await scheduler.waitForAll();
    expect(order).toEqual(['immediate', 'delayed']);
  });

  it('priority overrides delay when both eligible', async () => {
    const scheduler = new TaskScheduler(1);
    const order: string[] = [];
    
    scheduler.schedule(async () => { order.push('low-priority'); }, { priority: 1, delay: 0 });
    scheduler.schedule(async () => { order.push('high-priority'); }, { priority: 10, delay: 0 });
    
    vi.advanceTimersByTime(0);
    await scheduler.waitForAll();
    
    expect(order).toEqual(['high-priority', 'low-priority']);
  });

  it('cancel removes pending task', async () => {
    const scheduler = new TaskScheduler(1);
    const task = vi.fn(async () => {});
    const taskId = scheduler.schedule(task, { delay: 100 });
    
    expect(scheduler.cancel(taskId)).toBe(true);
    
    vi.advanceTimersByTime(100);
    await scheduler.waitForAll();
    
    expect(task).not.toHaveBeenCalled();
    expect(scheduler.getPendingCount()).toBe(0);
  });

  it('cancel returns false for already running task', async () => {
    const scheduler = new TaskScheduler(1);
    let resolveTask: (() => void) | null = null;
    const task = vi.fn(async () => {
      await new Promise(resolve => { resolveTask = resolve; });
    });
    const taskId = scheduler.schedule(task);
    
    vi.advanceTimersByTime(0);
    expect(scheduler.getRunningCount()).toBe(1);
    expect(scheduler.cancel(taskId)).toBe(false);
    
    resolveTask!();
    await scheduler.waitForAll();
    expect(task).toHaveBeenCalledTimes(1);
  });

  it('cancelAll removes all pending', async () => {
    const scheduler = new TaskScheduler(2);
    const task1 = vi.fn(async () => {});
    const task2 = vi.fn(async () => {});
    const task3 = vi.fn(async () => {});
    
    scheduler.schedule(task1);
    scheduler.schedule(task2);
    scheduler.schedule(task3, { delay: 100 });
    
    expect(scheduler.cancelAll()).toBe(1); // Only task3 is pending
    
    vi.advanceTimersByTime(0);
    await scheduler.waitForAll();
    expect(task1).toHaveBeenCalled();
    expect(task2).toHaveBeenCalled();
    expect(task3).not.toHaveBeenCalled();
  });

  it('getPendingCount and getRunningCount are accurate', async () => {
    const scheduler = new TaskScheduler(2);
    
    scheduler.schedule(async () => { await new Promise(resolve => setTimeout(resolve, 100)); });
    scheduler.schedule(async () => { await new Promise(resolve => setTimeout(resolve, 100)); });
    scheduler.schedule(async () => { await new Promise(resolve => setTimeout(resolve, 100)); });
    scheduler.schedule(async () => {}, { delay: 200 });
    
    expect(scheduler.getPendingCount()).toBe(2); // 1 waiting, 1 delayed
    expect(scheduler.getRunningCount()).toBe(0);
    
    vi.advanceTimersByTime(0);
    expect(scheduler.getRunningCount()).toBe(2);
    expect(scheduler.getPendingCount()).toBe(1); // 1 delayed not yet eligible
    
    vi.advanceTimersByTime(100);
    expect(scheduler.getRunningCount()).toBe(1); // 3rd task now running
    expect(scheduler.getPendingCount()).toBe(0);
  });

  it('setMaxConcurrency changes limit at runtime', async () => {
    const scheduler = new TaskScheduler(1);
    const starts: number[] = [];
    
    scheduler.schedule(async () => { starts.push(1); await new Promise(resolve => setTimeout(resolve, 50)); });
    scheduler.schedule(async () => { starts.push(2); await new Promise(resolve => setTimeout(resolve, 50)); });
    scheduler.schedule(async () => { starts.push(3); await new Promise(resolve => setTimeout(resolve, 50)); });
    
    vi.advanceTimersByTime(0);
    expect(starts).toEqual([1]);
    
    scheduler.setMaxConcurrency(3);
    vi.advanceTimersByTime(0);
    expect(starts).toEqual([1, 2, 3]);
    
    await scheduler.waitForAll();
  });

  it('pause prevents new task execution', async () => {
    const scheduler = new TaskScheduler(2);
    const order: string[] = [];
    
    scheduler.schedule(async () => { order.push('1'); await new Promise(resolve => setTimeout(resolve, 50)); });
    scheduler.pause();
    scheduler.schedule(async () => { order.push('2'); });
    
    vi.advanceTimersByTime(0);
    expect(order).toEqual(['1']);
    expect(scheduler.getPendingCount()).toBe(1);
    
    scheduler.resume();
    vi.advanceTimersByTime(0);
    await scheduler.waitForAll();
    expect(order).toEqual(['1', '2']);
  });

  it('isPaused returns correct state', () => {
    const scheduler = new TaskScheduler(1);
    expect(scheduler.isPaused()).toBe(false);
    
    scheduler.pause();
    expect(scheduler.isPaused()).toBe(true);
    
    scheduler.resume();
    expect(scheduler.isPaused()).toBe(false);
  });

  it('waitForAll waits for all tasks', async () => {
    const scheduler = new TaskScheduler(1);
    let completed = false;
    
    scheduler.schedule(async () => {
      await new Promise(resolve => setTimeout(resolve, 100));
      completed = true;
    });
    
    vi.advanceTimersByTime(0);
    expect(completed).toBe(false);
    
    const waitPromise = scheduler.waitForAll();
    vi.advanceTimersByTime(100);
    await waitPromise;
    expect(completed).toBe(true);
  });

  it('task errors do not crash scheduler', async () => {
    const scheduler = new TaskScheduler(1);
    const goodTask = vi.fn(async () => {});
    const badTask = vi.fn(async () => { throw new Error('task failed'); });
    
    scheduler.schedule(badTask);
    scheduler.schedule(goodTask);
    
    vi.advanceTimersByTime(0);
    await scheduler.waitForAll();
    
    expect(badTask).toHaveBeenCalledTimes(1);
    expect(goodTask).toHaveBeenCalledTimes(1);
  });

  it('custom task IDs', async () => {
    const scheduler = new TaskScheduler(1);
    const taskId = scheduler.schedule(async () => {}, { id: 'my-task' });
    
    expect(taskId).toBe('my-task');
    expect(scheduler.cancel('my-task')).toBe(true);
  });

  it('duplicate task IDs not allowed', () => {
    const scheduler = new TaskScheduler(1);
    scheduler.schedule(async () => {}, { id: 'duplicate' });
    
    expect(() => scheduler.schedule(async () => {}, { id: 'duplicate' })).toThrow();
  });

  it('delayed task becomes eligible after delay', async () => {
    const scheduler = new TaskScheduler(1);
    const order: string[] = [];
    
    scheduler.schedule(async () => { order.push('first'); }, { delay: 100 });
    scheduler.schedule(async () => { order.push('second'); }, { delay: 50 });
    
    vi.advanceTimersByTime(0);
    expect(order).toEqual([]);
    
    vi.advanceTimersByTime(50);
    expect(order).toEqual(['second']);
    
    vi.advanceTimersByTime(50);
    await scheduler.waitForAll();
    expect(order).toEqual(['second', 'first']);
  });

  it('stress test with many tasks', async () => {
    const scheduler = new TaskScheduler(5);
    const completed: number[] = [];
    
    for (let i = 0; i < 100; i++) {
      scheduler.schedule(async () => {
        await new Promise(resolve => setTimeout(resolve, 10));
        completed.push(i);
      }, { priority: Math.random() * 100 });
    }
    
    vi.advanceTimersByTime(0);
    expect(scheduler.getRunningCount()).toBe(5);
    expect(scheduler.getPendingCount()).toBe(95);
    
    vi.advanceTimersByTime(100);
    await scheduler.waitForAll();
    expect(completed).toHaveLength(100);
  });

  it('drain cancels pending and waits for running', async () => {
    const scheduler = new TaskScheduler(2);
    const runningResolve: Array<() => void> = [];
    
    scheduler.schedule(async () => {
      await new Promise(resolve => runningResolve.push(resolve));
    });
    scheduler.schedule(async () => {
      await new Promise(resolve => runningResolve.push(resolve));
    });
    scheduler.schedule(async () => {}); // pending
    scheduler.schedule(async () => {}); // pending
    
    vi.advanceTimersByTime(0);
    expect(scheduler.getRunningCount()).toBe(2);
    expect(scheduler.getPendingCount()).toBe(2);
    
    const drainPromise = scheduler.drain();
    expect(scheduler.getPendingCount()).toBe(0);
    
    runningResolve.forEach(resolve => resolve());
    const cancelled = await drainPromise;
    expect(cancelled).toBe(2);
  });

  it('drain with timeout', async () => {
    const scheduler = new TaskScheduler(1);
    
    scheduler.schedule(async () => {
      await new Promise(resolve => setTimeout(resolve, 200));
    });
    
    vi.advanceTimersByTime(0);
    
    const drainPromise = scheduler.drain(100);
    vi.advanceTimersByTime(100);
    
    await expect(drainPromise).resolves.toBe(0); // Running task not cancelled
  });
});
]=],
  },
  {
    name = "Linked List Reversal",
    difficulty = "easy",
    stub = [=[
/**
 * Linked List Reversal
 *
 * Implement functions to reverse a singly linked list.
 *
 * Linked lists are fundamental data structures that test understanding
 * of pointers/references and traversal. Reversing a linked list is a
 * classic interview problem that can be solved iteratively or recursively.
 *
 * Implement:
 * - ListNode class — represents a node in the linked list
 * - reverseList(head: ListNode | null): ListNode | null
 *   Reverse the linked list iteratively and return the new head.
 * - reverseListRecursive(head: ListNode | null): ListNode | null
 *   Reverse the linked list recursively and return the new head.
 * - reverseBetween(head: ListNode | null, left: number, right: number): ListNode | null
 *   Reverse the nodes of the linked list from position left to right (1-indexed).
 * - isPalindrome(head: ListNode | null): boolean
 *   Check if the linked list is a palindrome (reads the same forwards and backwards).
 *
 * Constraints:
 * - The number of nodes in the list is in the range [0, 5000]
 * - -5000 <= Node.val <= 5000
 * - 1 <= left <= right <= length of list
 *
 * Examples:
 * - Input: 1 -> 2 -> 3 -> 4 -> 5 -> null
 *   reverseList output: 5 -> 4 -> 3 -> 2 -> 1 -> null
 *
 * - Input: 1 -> 2 -> 3 -> 4 -> 5 -> null, left = 2, right = 4
 *   reverseBetween output: 1 -> 4 -> 3 -> 2 -> 5 -> null
 *
 * - Input: 1 -> 2 -> 3 -> 2 -> 1 -> null
 *   isPalindrome output: true
 */

export class ListNode {
  val: number;
  next: ListNode | null;

  constructor(val?: number, next?: ListNode | null) {
    // YOUR CODE HERE
    this.val = val === undefined ? 0 : val;
    this.next = next === undefined ? null : next;
  }
}

export function reverseList(head: ListNode | null): ListNode | null {
  // YOUR CODE HERE
  return null;
}

export function reverseListRecursive(head: ListNode | null): ListNode | null {
  // YOUR CODE HERE
  return null;
}

export function reverseBetween(
  head: ListNode | null,
  left: number,
  right: number
): ListNode | null {
  // YOUR CODE HERE
  return null;
}

export function isPalindrome(head: ListNode | null): boolean {
  // YOUR CODE HERE
  return true;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { ListNode, reverseList, reverseListRecursive, reverseBetween, isPalindrome } from './challenge';

function createList(values: number[]): ListNode | null {
  if (values.length === 0) return null;
  const head = new ListNode(values[0]);
  let current = head;
  for (let i = 1; i < values.length; i++) {
    current.next = new ListNode(values[i]);
    current = current.next;
  }
  return head;
}

function listToArray(head: ListNode | null): number[] {
  const result: number[] = [];
  while (head !== null) {
    result.push(head.val);
    head = head.next;
  }
  return result;
}

describe('reverseList', () => {
  it('reverses a list with multiple nodes', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseList(head);
    expect(listToArray(reversed)).toEqual([5, 4, 3, 2, 1]);
  });

  it('reverses a single node list', () => {
    const head = new ListNode(1);
    const reversed = reverseList(head);
    expect(listToArray(reversed)).toEqual([1]);
  });

  it('reverses an empty list', () => {
    expect(reverseList(null)).toBeNull();
  });

  it('reverses a two node list', () => {
    const head = createList([1, 2]);
    const reversed = reverseList(head);
    expect(listToArray(reversed)).toEqual([2, 1]);
  });

  it('handles negative values', () => {
    const head = createList([-1, -2, -3]);
    const reversed = reverseList(head);
    expect(listToArray(reversed)).toEqual([-3, -2, -1]);
  });

  it('preserves all values', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseList(head);
    const values = listToArray(reversed);
    expect(values).toHaveLength(5);
    expect(values.sort()).toEqual([1, 2, 3, 4, 5]);
  });
});

describe('reverseListRecursive', () => {
  it('reverses a list with multiple nodes', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseListRecursive(head);
    expect(listToArray(reversed)).toEqual([5, 4, 3, 2, 1]);
  });

  it('reverses a single node list', () => {
    const head = new ListNode(1);
    const reversed = reverseListRecursive(head);
    expect(listToArray(reversed)).toEqual([1]);
  });

  it('reverses an empty list', () => {
    expect(reverseListRecursive(null)).toBeNull();
  });

  it('reverses a two node list', () => {
    const head = createList([1, 2]);
    const reversed = reverseListRecursive(head);
    expect(listToArray(reversed)).toEqual([2, 1]);
  });

  it('handles negative values', () => {
    const head = createList([-1, -2, -3]);
    const reversed = reverseListRecursive(head);
    expect(listToArray(reversed)).toEqual([-3, -2, -1]);
  });

  it('produces same result as iterative', () => {
    const values = [1, 2, 3, 4, 5];
    const head1 = createList(values);
    const head2 = createList(values);
    
    const reversed1 = reverseList(head1);
    const reversed2 = reverseListRecursive(head2);
    
    expect(listToArray(reversed1)).toEqual(listToArray(reversed2));
  });
});

describe('reverseBetween', () => {
  it('reverses middle section', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseBetween(head, 2, 4);
    expect(listToArray(reversed)).toEqual([1, 4, 3, 2, 5]);
  });

  it('reverses entire list', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseBetween(head, 1, 5);
    expect(listToArray(reversed)).toEqual([5, 4, 3, 2, 1]);
  });

  it('reverses from start', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseBetween(head, 1, 3);
    expect(listToArray(reversed)).toEqual([3, 2, 1, 4, 5]);
  });

  it('reverses to end', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseBetween(head, 3, 5);
    expect(listToArray(reversed)).toEqual([1, 2, 5, 4, 3]);
  });

  it('single node range does nothing', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseBetween(head, 3, 3);
    expect(listToArray(reversed)).toEqual([1, 2, 3, 4, 5]);
  });

  it('two node range', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseBetween(head, 2, 3);
    expect(listToArray(reversed)).toEqual([1, 3, 2, 4, 5]);
  });

  it('empty list', () => {
    expect(reverseBetween(null, 1, 1)).toBeNull();
  });

  it('single node list', () => {
    const head = new ListNode(1);
    const reversed = reverseBetween(head, 1, 1);
    expect(listToArray(reversed)).toEqual([1]);
  });
});

describe('isPalindrome', () => {
  it('single node is palindrome', () => {
    expect(isPalindrome(new ListNode(1))).toBe(true);
  });

  it('empty list is palindrome', () => {
    expect(isPalindrome(null)).toBe(true);
  });

  it('two same nodes is palindrome', () => {
    const head = createList([1, 1]);
    expect(isPalindrome(head)).toBe(true);
  });

  it('two different nodes is not palindrome', () => {
    const head = createList([1, 2]);
    expect(isPalindrome(head)).toBe(false);
  });

  it('odd length palindrome', () => {
    const head = createList([1, 2, 3, 2, 1]);
    expect(isPalindrome(head)).toBe(true);
  });

  it('even length palindrome', () => {
    const head = createList([1, 2, 2, 1]);
    expect(isPalindrome(head)).toBe(true);
  });

  it('not a palindrome', () => {
    const head = createList([1, 2, 3]);
    expect(isPalindrome(head)).toBe(false);
  });

  it('all same values is palindrome', () => {
    const head = createList([5, 5, 5, 5]);
    expect(isPalindrome(head)).toBe(true);
  });

  it('negative values palindrome', () => {
    const head = createList([-1, -2, -1]);
    expect(isPalindrome(head)).toBe(true);
  });

  it('negative values not palindrome', () => {
    const head = createList([-1, -2, -3]);
    expect(isPalindrome(head)).toBe(false);
  });
});

describe('edge cases', () => {
  it('large list reversal', () => {
    const values = Array.from({ length: 100 }, (_, i) => i + 1);
    const head = createList(values);
    const reversed = reverseList(head);
    const result = listToArray(reversed);
    expect(result).toEqual(values.reverse());
  });

  it('reverseBetween with left equals right', () => {
    const head = createList([1, 2, 3, 4, 5]);
    const reversed = reverseBetween(head, 3, 3);
    expect(listToArray(reversed)).toEqual([1, 2, 3, 4, 5]);
  });

  it('reverseBetween bounds validation', () => {
    const head = createList([1, 2, 3]);
    // left = 1, right = 3 should reverse entire list
    const reversed = reverseBetween(head, 1, 3);
    expect(listToArray(reversed)).toEqual([3, 2, 1]);
  });

  it('isPalindrome with many nodes', () => {
    const head = createList([1, 2, 3, 4, 5, 4, 3, 2, 1]);
    expect(isPalindrome(head)).toBe(true);
  });

  it('isPalindrome almost palindrome', () => {
    const head = createList([1, 2, 3, 4, 5, 4, 3, 2, 2]);
    expect(isPalindrome(head)).toBe(false);
  });
});
]=],
  },
  {
    name = "Dijkstra's Shortest Path",
    difficulty = "medium",
    stub = [=[
/**
 * Dijkstra's Shortest Path
 *
 * Implement Dijkstra's algorithm for finding the shortest path in a weighted graph.
 *
 * Dijkstra's algorithm finds the shortest path from a source node to all other
 * nodes in a graph with non-negative edge weights. It's widely used in:
 * - GPS navigation systems
 * - Network routing protocols
 * - Social network analysis
 * - Game AI pathfinding
 *
 * The graph is represented as an adjacency list:
 * type Graph = Map<number, Array<{ to: number, weight: number }>>
 *
 * Implement:
 * - dijkstra(graph: Map<number, Array<{to: number, weight: number}>>, source: number): Map<number, number>
 *   Return a map of node -> shortest distance from source. Use Infinity for unreachable nodes.
 *
 * - shortestPath(graph: Map<number, Array<{to: number, weight: number}>>, source: number, target: number): number[]
 *   Return the actual path (array of node IDs) from source to target.
 *   Return empty array if no path exists.
 *
 * - dijkstraWithPredecessors(graph: Map<number, Array<{to: number, weight: number}>>, source: number): { distances: Map<number, number>, predecessors: Map<number, number | null> }
 *   Return both distances and the predecessor map for path reconstruction.
 *
 * Requirements:
 * - Time complexity: O((V + E) log V) using a min-heap priority queue
 * - Handle disconnected graphs (return Infinity for unreachable nodes)
 * - Handle graphs with isolated nodes
 * - Source node distance should be 0
 *
 * Bonus: Implement dijkstraWithLimit that stops early once all nodes within
 * a certain distance threshold have been processed.
 */

export function dijkstra(
  graph: Map<number, Array<{ to: number; weight: number }>>,
  source: number
): Map<number, number> {
  // YOUR CODE HERE
  return new Map();
}

export function shortestPath(
  graph: Map<number, Array<{ to: number; weight: number }>>,
  source: number,
  target: number
): number[] {
  // YOUR CODE HERE
  return [];
}

export function dijkstraWithPredecessors(
  graph: Map<number, Array<{ to: number; weight: number }>>,
  source: number
): { distances: Map<number, number>; predecessors: Map<number, number | null> } {
  // YOUR CODE HERE
  return { distances: new Map(), predecessors: new Map() };
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { dijkstra, shortestPath, dijkstraWithPredecessors } from './challenge';

function createGraph(edges: Array<[number, number, number]>): Map<number, Array<{ to: number; weight: number }>> {
  const graph = new Map<number, Array<{ to: number; weight: number }>>();
  for (const [from, to, weight] of edges) {
    if (!graph.has(from)) graph.set(from, []);
    graph.get(from)!.push({ to, weight });
  }
  return graph;
}

describe('dijkstra', () => {
  it('single node returns distance 0', () => {
    const graph = new Map();
    graph.set(1, []);
    const distances = dijkstra(graph, 1);
    expect(distances.get(1)).toBe(0);
  });

  it('simple two-node graph', () => {
    const graph = createGraph([[1, 2, 5]]);
    const distances = dijkstra(graph, 1);
    expect(distances.get(1)).toBe(0);
    expect(distances.get(2)).toBe(5);
  });

  it('linear path', () => {
    const graph = createGraph([[1, 2, 2], [2, 3, 3], [3, 4, 1]]);
    const distances = dijkstra(graph, 1);
    expect(distances.get(1)).toBe(0);
    expect(distances.get(2)).toBe(2);
    expect(distances.get(3)).toBe(5);
    expect(distances.get(4)).toBe(6);
  });

  it('chooses shortest path over longer alternative', () => {
    const graph = createGraph([
      [1, 2, 10],
      [1, 3, 1],
      [3, 2, 2],
    ]);
    const distances = dijkstra(graph, 1);
    expect(distances.get(2)).toBe(3); // 1->3->2 = 3, not 1->2 = 10
    expect(distances.get(3)).toBe(1);
  });

  it('handles disconnected nodes', () => {
    const graph = createGraph([[1, 2, 5]]);
    graph.set(3, []); // isolated node
    const distances = dijkstra(graph, 1);
    expect(distances.get(1)).toBe(0);
    expect(distances.get(2)).toBe(5);
    expect(distances.get(3)).toBe(Infinity);
  });

  it('complex graph with multiple paths', () => {
    const graph = createGraph([
      [1, 2, 1],
      [1, 3, 4],
      [2, 3, 2],
      [2, 4, 6],
      [3, 4, 3],
      [4, 5, 1],
    ]);
    const distances = dijkstra(graph, 1);
    expect(distances.get(1)).toBe(0);
    expect(distances.get(2)).toBe(1);
    expect(distances.get(3)).toBe(3); // 1->2->3
    expect(distances.get(4)).toBe(6); // 1->2->3->4
    expect(distances.get(5)).toBe(7); // 1->2->3->4->5
  });

  it('graph with cycles', () => {
    const graph = createGraph([
      [1, 2, 1],
      [2, 3, 1],
      [3, 1, 1],
      [2, 4, 2],
    ]);
    const distances = dijkstra(graph, 1);
    expect(distances.get(1)).toBe(0);
    expect(distances.get(2)).toBe(1);
    expect(distances.get(3)).toBe(2);
    expect(distances.get(4)).toBe(3);
  });

  it('all nodes reachable from source', () => {
    const graph = createGraph([
      [0, 1, 4],
      [0, 2, 1],
      [2, 1, 2],
      [1, 3, 1],
      [2, 3, 5],
    ]);
    const distances = dijkstra(graph, 0);
    expect(distances.get(0)).toBe(0);
    expect(distances.get(1)).toBe(3);
    expect(distances.get(2)).toBe(1);
    expect(distances.get(3)).toBe(4);
  });

  it('source node not in graph returns empty', () => {
    const graph = createGraph([[1, 2, 5]]);
    const distances = dijkstra(graph, 99);
    expect(distances.size).toBe(0);
  });

  it('empty graph', () => {
    const graph = new Map();
    const distances = dijkstra(graph, 1);
    expect(distances.size).toBe(0);
  });
});

describe('shortestPath', () => {
  it('returns path for simple graph', () => {
    const graph = createGraph([[1, 2, 5], [2, 3, 3]]);
    const path = shortestPath(graph, 1, 3);
    expect(path).toEqual([1, 2, 3]);
  });

  it('returns empty array for unreachable target', () => {
    const graph = createGraph([[1, 2, 5]]);
    const path = shortestPath(graph, 1, 99);
    expect(path).toEqual([]);
  });

  it('returns single element for source equals target', () => {
    const graph = createGraph([[1, 2, 5]]);
    const path = shortestPath(graph, 1, 1);
    expect(path).toEqual([1]);
  });

  it('finds optimal path not just any path', () => {
    const graph = createGraph([
      [1, 2, 10],
      [1, 3, 1],
      [3, 2, 2],
      [2, 4, 1],
    ]);
    const path = shortestPath(graph, 1, 4);
    expect(path).toEqual([1, 3, 2, 4]); // not [1, 2, 4]
  });

  it('handles linear path', () => {
    const graph = createGraph([[1, 2, 1], [2, 3, 1], [3, 4, 1]]);
    const path = shortestPath(graph, 1, 4);
    expect(path).toEqual([1, 2, 3, 4]);
  });

  it('no path exists', () => {
    const graph = createGraph([[1, 2, 5], [3, 4, 5]]);
    const path = shortestPath(graph, 1, 4);
    expect(path).toEqual([]);
  });
});

describe('dijkstraWithPredecessors', () => {
  it('returns correct predecessors', () => {
    const graph = createGraph([[1, 2, 5], [2, 3, 3]]);
    const result = dijkstraWithPredecessors(graph, 1);
    expect(result.distances.get(1)).toBe(0);
    expect(result.distances.get(2)).toBe(5);
    expect(result.distances.get(3)).toBe(8);
    expect(result.predecessors.get(1)).toBeNull();
    expect(result.predecessors.get(2)).toBe(1);
    expect(result.predecessors.get(3)).toBe(2);
  });

  it('predecessors allow path reconstruction', () => {
    const graph = createGraph([
      [1, 2, 1],
      [2, 3, 1],
      [3, 4, 1],
    ]);
    const result = dijkstraWithPredecessors(graph, 1);
    
    // Reconstruct path to 4
    const path: number[] = [];
    let current: number | null = 4;
    while (current !== null) {
      path.unshift(current);
      current = result.predecessors.get(current) ?? null;
    }
    expect(path).toEqual([1, 2, 3, 4]);
  });
});

describe('edge cases', () => {
  it('zero-weight edges', () => {
    const graph = createGraph([[1, 2, 0], [2, 3, 0]]);
    const distances = dijkstra(graph, 1);
    expect(distances.get(1)).toBe(0);
    expect(distances.get(2)).toBe(0);
    expect(distances.get(3)).toBe(0);
  });

  it('large weights', () => {
    const graph = createGraph([[1, 2, 1000000], [2, 3, 1000000]]);
    const distances = dijkstra(graph, 1);
    expect(distances.get(3)).toBe(2000000);
  });

  it('many nodes', () => {
    const graph = new Map<number, Array<{ to: number; weight: number }>>();
    for (let i = 1; i <= 100; i++) {
      graph.set(i, [{ to: i + 1, weight: 1 }]);
    }
    graph.set(101, []);
    const distances = dijkstra(graph, 1);
    expect(distances.get(1)).toBe(0);
    expect(distances.get(101)).toBe(100);
  });

  it('star graph', () => {
    const graph = new Map<number, Array<{ to: number; weight: number }>>();
    for (let i = 2; i <= 10; i++) {
      graph.set(1, [...(graph.get(1) || []), { to: i, weight: i }]);
      graph.set(i, []);
    }
    const distances = dijkstra(graph, 1);
    for (let i = 2; i <= 10; i++) {
      expect(distances.get(i)).toBe(i);
    }
  });
});
]=],
  },
  {
    name = "Singly Linked List",
    difficulty = "easy",
    stub = [=[
/**
 * Singly Linked List
 *
 * Implement a singly linked list with basic operations.
 *
 * A linked list is a linear data structure where elements are stored in nodes,
 * and each node points to the next node in the sequence. Unlike arrays,
 * linked lists provide efficient insertions and deletions at any position.
 *
 * Implement the LinkedList class with:
 * - constructor() — Initialize an empty list
 * - prepend(value: number): void — Add a value to the front (O(1))
 * - append(value: number): void — Add a value to the end (O(n) without tail, O(1) with tail)
 * - insertAt(index: number, value: number): boolean — Insert at index. Return false if index invalid.
 * - removeAt(index: number): number | null — Remove and return value at index. Return null if invalid.
 * - get(index: number): number | null — Get value at index. Return null if invalid.
 * - set(index: number, value: number): boolean — Set value at index. Return false if invalid.
 * - indexOf(value: number): number — Return first index of value, or -1 if not found.
 * - contains(value: number): boolean — Check if value exists in list.
 * - size(): number — Return the number of elements.
 * - isEmpty(): boolean — Check if list is empty.
 * - clear(): void — Remove all elements.
 * - toArray(): number[] — Return array representation.
 * - reverse(): void — Reverse the list in place.
 * - headValue(): number | null — Return head value without removing.
 * - tailValue(): number | null — Return tail value without removing.
 *
 * Bonus: Implement findMiddle(): number | null to find the middle element
 * using the slow/fast pointer technique (one pass, O(1) extra space).
 */

export class LinkedList {
  constructor() {
    // YOUR CODE HERE
  }

  prepend(value: number): void {
    // YOUR CODE HERE
  }

  append(value: number): void {
    // YOUR CODE HERE
  }

  insertAt(index: number, value: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  removeAt(index: number): number | null {
    // YOUR CODE HERE
    return null;
  }

  get(index: number): number | null {
    // YOUR CODE HERE
    return null;
  }

  set(index: number, value: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  indexOf(value: number): number {
    // YOUR CODE HERE
    return -1;
  }

  contains(value: number): boolean {
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

  toArray(): number[] {
    // YOUR CODE HERE
    return [];
  }

  reverse(): void {
    // YOUR CODE HERE
  }

  headValue(): number | null {
    // YOUR CODE HERE
    return null;
  }

  tailValue(): number | null {
    // YOUR CODE HERE
    return null;
  }

  findMiddle(): number | null {
    // YOUR CODE HERE
    return null;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { LinkedList } from './challenge';

describe('LinkedList', () => {
  it('creates empty list', () => {
    const list = new LinkedList();
    expect(list.isEmpty()).toBe(true);
    expect(list.size()).toBe(0);
    expect(list.headValue()).toBeNull();
    expect(list.tailValue()).toBeNull();
  });

  it('prepend adds to front', () => {
    const list = new LinkedList();
    list.prepend(1);
    expect(list.headValue()).toBe(1);
    expect(list.tailValue()).toBe(1);
    list.prepend(2);
    expect(list.headValue()).toBe(2);
    expect(list.tailValue()).toBe(1);
    expect(list.toArray()).toEqual([2, 1]);
  });

  it('append adds to end', () => {
    const list = new LinkedList();
    list.append(1);
    expect(list.headValue()).toBe(1);
    expect(list.tailValue()).toBe(1);
    list.append(2);
    list.append(3);
    expect(list.headValue()).toBe(1);
    expect(list.tailValue()).toBe(3);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insertAt inserts at valid index', () => {
    const list = new LinkedList();
    list.append(1);
    list.append(3);
    expect(list.insertAt(1, 2)).toBe(true);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insertAt at beginning', () => {
    const list = new LinkedList();
    list.append(2);
    list.append(3);
    expect(list.insertAt(0, 1)).toBe(true);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insertAt at end', () => {
    const list = new LinkedList();
    list.append(1);
    list.append(2);
    expect(list.insertAt(2, 3)).toBe(true);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insertAt returns false for invalid index', () => {
    const list = new LinkedList();
    list.append(1);
    expect(list.insertAt(-1, 2)).toBe(false);
    expect(list.insertAt(2, 2)).toBe(false);
    expect(list.insertAt(10, 2)).toBe(false);
  });

  it('get returns value at index', () => {
    const list = new LinkedList();
    [10, 20, 30, 40, 50].forEach(v => list.append(v));
    expect(list.get(0)).toBe(10);
    expect(list.get(2)).toBe(30);
    expect(list.get(4)).toBe(50);
  });

  it('get returns null for invalid index', () => {
    const list = new LinkedList();
    list.append(1);
    expect(list.get(-1)).toBeNull();
    expect(list.get(1)).toBeNull();
    expect(list.get(100)).toBeNull();
  });

  it('set updates value at index', () => {
    const list = new LinkedList();
    [1, 2, 3].forEach(v => list.append(v));
    expect(list.set(1, 20)).toBe(true);
    expect(list.toArray()).toEqual([1, 20, 3]);
  });

  it('set returns false for invalid index', () => {
    const list = new LinkedList();
    expect(list.set(0, 1)).toBe(false);
    list.append(1);
    expect(list.set(1, 2)).toBe(false);
  });

  it('removeAt removes and returns value', () => {
    const list = new LinkedList();
    [1, 2, 3, 4, 5].forEach(v => list.append(v));
    expect(list.removeAt(2)).toBe(3);
    expect(list.toArray()).toEqual([1, 2, 4, 5]);
  });

  it('removeAt at beginning', () => {
    const list = new LinkedList();
    [1, 2, 3].forEach(v => list.append(v));
    expect(list.removeAt(0)).toBe(1);
    expect(list.toArray()).toEqual([2, 3]);
    expect(list.headValue()).toBe(2);
  });

  it('removeAt at end', () => {
    const list = new LinkedList();
    [1, 2, 3].forEach(v => list.append(v));
    expect(list.removeAt(2)).toBe(3);
    expect(list.toArray()).toEqual([1, 2]);
    expect(list.tailValue()).toBe(2);
  });

  it('removeAt returns null for invalid index', () => {
    const list = new LinkedList();
    expect(list.removeAt(0)).toBeNull();
    list.append(1);
    expect(list.removeAt(1)).toBeNull();
  });

  it('indexOf returns first occurrence', () => {
    const list = new LinkedList();
    [1, 2, 3, 2, 4].forEach(v => list.append(v));
    expect(list.indexOf(2)).toBe(1);
    expect(list.indexOf(4)).toBe(4);
  });

  it('indexOf returns -1 for missing value', () => {
    const list = new LinkedList();
    [1, 2, 3].forEach(v => list.append(v));
    expect(list.indexOf(99)).toBe(-1);
  });

  it('contains returns boolean', () => {
    const list = new LinkedList();
    [1, 2, 3].forEach(v => list.append(v));
    expect(list.contains(2)).toBe(true);
    expect(list.contains(99)).toBe(false);
  });

  it('size tracks correctly', () => {
    const list = new LinkedList();
    expect(list.size()).toBe(0);
    list.append(1);
    expect(list.size()).toBe(1);
    list.prepend(2);
    expect(list.size()).toBe(2);
    list.removeAt(0);
    expect(list.size()).toBe(1);
  });

  it('clear empties list', () => {
    const list = new LinkedList();
    [1, 2, 3, 4, 5].forEach(v => list.append(v));
    list.clear();
    expect(list.isEmpty()).toBe(true);
    expect(list.size()).toBe(0);
    expect(list.headValue()).toBeNull();
    expect(list.tailValue()).toBeNull();
  });

  it('toArray returns correct array', () => {
    const list = new LinkedList();
    [5, 3, 8, 1].forEach(v => list.append(v));
    expect(list.toArray()).toEqual([5, 3, 8, 1]);
  });

  it('reverse reverses in place', () => {
    const list = new LinkedList();
    [1, 2, 3, 4, 5].forEach(v => list.append(v));
    list.reverse();
    expect(list.toArray()).toEqual([5, 4, 3, 2, 1]);
    expect(list.headValue()).toBe(5);
    expect(list.tailValue()).toBe(1);
  });

  it('reverse empty list', () => {
    const list = new LinkedList();
    list.reverse();
    expect(list.toArray()).toEqual([]);
  });

  it('reverse single element', () => {
    const list = new LinkedList();
    list.append(42);
    list.reverse();
    expect(list.toArray()).toEqual([42]);
  });

  it('findMiddle on odd length', () => {
    const list = new LinkedList();
    [1, 2, 3, 4, 5].forEach(v => list.append(v));
    expect(list.findMiddle()).toBe(3);
  });

  it('findMiddle on even length', () => {
    const list = new LinkedList();
    [1, 2, 3, 4, 5, 6].forEach(v => list.append(v));
    expect(list.findMiddle()).toBe(4); // Second middle
  });

  it('findMiddle on single element', () => {
    const list = new LinkedList();
    list.append(42);
    expect(list.findMiddle()).toBe(42);
  });

  it('findMiddle on empty list', () => {
    const list = new LinkedList();
    expect(list.findMiddle()).toBeNull();
  });

  it('stress test with many operations', () => {
    const list = new LinkedList();
    for (let i = 0; i < 100; i++) {
      list.append(i);
    }
    expect(list.size()).toBe(100);
    expect(list.headValue()).toBe(0);
    expect(list.tailValue()).toBe(99);
    
    for (let i = 0; i < 100; i++) {
      expect(list.get(i)).toBe(i);
    }
    
    list.reverse();
    expect(list.headValue()).toBe(99);
    expect(list.tailValue()).toBe(0);
  });

  it('handles negative values', () => {
    const list = new LinkedList();
    [-5, -10, 0, 10, -1].forEach(v => list.append(v));
    expect(list.toArray()).toEqual([-5, -10, 0, 10, -1]);
    expect(list.contains(-10)).toBe(true);
    expect(list.indexOf(-1)).toBe(4);
  });

  it('insertAt and removeAt at same index', () => {
    const list = new LinkedList();
    [1, 2, 3].forEach(v => list.append(v));
    list.insertAt(1, 99);
    expect(list.toArray()).toEqual([1, 99, 2, 3]);
    expect(list.removeAt(1)).toBe(99);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });
});
]=],
  },
  {
    name = "Queue",
    difficulty = "easy",
    stub = [=[
/**
 * Queue
 *
 * Implement a First-In-First-Out (FIFO) queue data structure.
 *
 * A queue is a linear data structure where elements are added at the rear
 * (enqueue) and removed from the front (dequeue). Queues are commonly used for:
 * - BFS graph traversal
 * - Task scheduling
 * - Buffer management
 * - Print job queues
 * - Message queues
 *
 * Implement the Queue class with:
 * - constructor(initialValues?: number[]) — Optionally initialize with an array
 * - enqueue(value: number): void — Add a value to the rear of the queue (O(1))
 * - dequeue(): number | null — Remove and return the front value (O(1))
 * - peek(): number | null — Return the front value without removing (O(1))
 * - size(): number — Return the number of elements in the queue
 * - isEmpty(): boolean — Check if the queue is empty
 * - clear(): void — Remove all elements from the queue
 * - toArray(): number[] — Return a copy of the queue as an array (front to rear)
 *
 * Bonus: Implement a generic Queue<T> that works with any type.
 * Bonus: Implement CircularQueue with fixed capacity that wraps around.
 */

export class Queue {
  constructor(initialValues?: number[]) {
    // YOUR CODE HERE
  }

  enqueue(value: number): void {
    // YOUR CODE HERE
  }

  dequeue(): number | null {
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

  clear(): void {
    // YOUR CODE HERE
  }

  toArray(): number[] {
    // YOUR CODE HERE
    return [];
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { Queue } from './challenge';

describe('Queue', () => {
  it('creates empty queue', () => {
    const queue = new Queue();
    expect(queue.isEmpty()).toBe(true);
    expect(queue.size()).toBe(0);
    expect(queue.peek()).toBeNull();
  });

  it('enqueues single value', () => {
    const queue = new Queue();
    queue.enqueue(5);
    expect(queue.size()).toBe(1);
    expect(queue.peek()).toBe(5);
    expect(queue.isEmpty()).toBe(false);
  });

  it('enqueues multiple values', () => {
    const queue = new Queue();
    queue.enqueue(1);
    queue.enqueue(2);
    queue.enqueue(3);
    expect(queue.size()).toBe(3);
    expect(queue.peek()).toBe(1);
  });

  it('dequeues in FIFO order', () => {
    const queue = new Queue();
    queue.enqueue(1);
    queue.enqueue(2);
    queue.enqueue(3);
    
    expect(queue.dequeue()).toBe(1);
    expect(queue.dequeue()).toBe(2);
    expect(queue.dequeue()).toBe(3);
    expect(queue.dequeue()).toBeNull();
  });

  it('dequeue from empty queue returns null', () => {
    const queue = new Queue();
    expect(queue.dequeue()).toBeNull();
  });

  it('peek does not remove element', () => {
    const queue = new Queue();
    queue.enqueue(42);
    expect(queue.peek()).toBe(42);
    expect(queue.peek()).toBe(42);
    expect(queue.size()).toBe(1);
  });

  it('initializes with array', () => {
    const queue = new Queue([1, 2, 3]);
    expect(queue.size()).toBe(3);
    expect(queue.peek()).toBe(1);
    expect(queue.dequeue()).toBe(1);
    expect(queue.dequeue()).toBe(2);
    expect(queue.dequeue()).toBe(3);
  });

  it('clear empties the queue', () => {
    const queue = new Queue([1, 2, 3]);
    expect(queue.size()).toBe(3);
    queue.clear();
    expect(queue.size()).toBe(0);
    expect(queue.isEmpty()).toBe(true);
    expect(queue.peek()).toBeNull();
  });

  it('toArray returns copy front to rear', () => {
    const queue = new Queue([3, 1, 4]);
    expect(queue.toArray()).toEqual([3, 1, 4]);
    
    // Modifying returned array should not affect queue
    const arr = queue.toArray();
    arr[0] = 999;
    expect(queue.peek()).toBe(3);
  });

  it('interleaved enqueue and dequeue', () => {
    const queue = new Queue();
    queue.enqueue(1);
    queue.enqueue(2);
    expect(queue.dequeue()).toBe(1);
    queue.enqueue(3);
    queue.enqueue(4);
    expect(queue.dequeue()).toBe(2);
    expect(queue.dequeue()).toBe(3);
    queue.enqueue(5);
    expect(queue.toArray()).toEqual([4, 5]);
  });

  it('stress test with many operations', () => {
    const queue = new Queue();
    
    for (let i = 0; i < 100; i++) {
      queue.enqueue(i);
    }
    expect(queue.size()).toBe(100);
    
    for (let i = 0; i < 50; i++) {
      expect(queue.dequeue()).toBe(i);
    }
    expect(queue.size()).toBe(50);
    
    for (let i = 100; i < 150; i++) {
      queue.enqueue(i);
    }
    expect(queue.size()).toBe(100);
    
    for (let i = 50; i < 150; i++) {
      expect(queue.dequeue()).toBe(i);
    }
    expect(queue.isEmpty()).toBe(true);
  });

  it('handles negative values', () => {
    const queue = new Queue();
    queue.enqueue(-5);
    queue.enqueue(-10);
    queue.enqueue(0);
    expect(queue.dequeue()).toBe(-5);
    expect(queue.dequeue()).toBe(-10);
    expect(queue.dequeue()).toBe(0);
  });

  it('toArray on empty queue', () => {
    const queue = new Queue();
    expect(queue.toArray()).toEqual([]);
  });

  it('clear on empty queue', () => {
    const queue = new Queue();
    expect(() => queue.clear()).not.toThrow();
  });
});
]=],
  },
  {
    name = "Valid Parentheses",
    difficulty = "easy",
    stub = [=[
/**
 * Valid Parentheses
 *
 * Implement a function that checks if a string of parentheses is valid.
 *
 * A string is valid if:
 * - Open brackets are closed by the same type of brackets
 * - Open brackets are closed in the correct order
 * - Every closing bracket has a corresponding opening bracket
 *
 * Supported bracket types: (), {}, []
 *
 * Implement:
 * - isValid(s: string): boolean — Return true if the string is valid
 *
 * Examples:
 * - "()" → true
 * - "()[]{}" → true
 * - "(]" → false
 * - "([)]" → false
 * - "{[]}" → true
 * - "" → true (empty string is valid)
 * - "(" → false
 * - ")" → false
 *
 * Bonus: Implement getMismatchIndex(s: string): number that returns the
 * index of the first character that makes the string invalid, or -1 if valid.
 */

export function isValid(s: string): boolean {
  // YOUR CODE HERE
  return false;
}

export function getMismatchIndex(s: string): number {
  // YOUR CODE HERE
  return -1;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { isValid, getMismatchIndex } from './challenge';

describe('isValid', () => {
  it('empty string is valid', () => {
    expect(isValid('')).toBe(true);
  });

  it('single pair of parentheses', () => {
    expect(isValid('()')).toBe(true);
  });

  it('single pair of braces', () => {
    expect(isValid('{}')).toBe(true);
  });

  it('single pair of brackets', () => {
    expect(isValid('[]')).toBe(true);
  });

  it('multiple pairs', () => {
    expect(isValid('()[]{}')).toBe(true);
  });

  it('nested parentheses', () => {
    expect(isValid('(())')).toBe(true);
  });

  it('nested mixed brackets', () => {
    expect(isValid('{[()]}')).toBe(true);
  });

  it('complex valid nesting', () => {
    expect(isValid('({[]})')).toBe(true);
    expect(isValid('[{()}]')).toBe(true);
    expect(isValid('{()}[{}]')).toBe(true);
  });

  it('mismatched types', () => {
    expect(isValid('(]')).toBe(false);
    expect(isValid('([)]')).toBe(false);
    expect(isValid('{)')).toBe(false);
  });

  it('unclosed opening bracket', () => {
    expect(isValid('(')).toBe(false);
    expect(isValid('[')).toBe(false);
    expect(isValid('{')).toBe(false);
    expect(isValid('(()')).toBe(false);
  });

  it('unmatched closing bracket', () => {
    expect(isValid(')')).toBe(false);
    expect(isValid(']')).toBe(false);
    expect(isValid('}')).toBe(false);
    expect(isValid('())')).toBe(false);
  });

  it('closing before opening', () => {
    expect(isValid(')(')).toBe(false);
    expect(isValid('][' )).toBe(false);
    expect(isValid('}{')).toBe(false);
  });

  it('long valid string', () => {
    expect(isValid('()()()()()')).toBe(true);
    expect(isValid('((((()))))')).toBe(true);
  });

  it('long invalid string', () => {
    expect(isValid('((((()))')).toBe(false);
  });

  it('string with other characters (treat as invalid)', () => {
    expect(isValid('a')).toBe(false);
    expect(isValid('(a)')).toBe(false);
  });
});

describe('getMismatchIndex', () => {
  it('returns -1 for valid strings', () => {
    expect(getMismatchIndex('')).toBe(-1);
    expect(getMismatchIndex('()')).toBe(-1);
    expect(getMismatchIndex('{[()]}')).toBe(-1);
  });

  it('returns index of wrong closing bracket', () => {
    expect(getMismatchIndex('(]')).toBe(1);
    expect(getMismatchIndex('([)]')).toBe(2);
  });

  it('returns index of unmatched closing bracket', () => {
    expect(getMismatchIndex(')')).toBe(0);
    expect(getMismatchIndex('())')).toBe(2);
  });

  it('returns index after last char for unclosed opening', () => {
    expect(getMismatchIndex('(')).toBe(1);
    expect(getMismatchIndex('(()')).toBe(3);
  });

  it('complex mismatch', () => {
    expect(getMismatchIndex('{[}')).toBe(2);
  });
});

// Edge cases
describe('edge cases', () => {
  it('very long valid string', () => {
    const valid = '()'.repeat(1000);
    expect(isValid(valid)).toBe(true);
  });

  it('very long invalid string', () => {
    const invalid = '('.repeat(1000) + ')'.repeat(999);
    expect(isValid(invalid)).toBe(false);
  });

  it('alternating valid', () => {
    expect(isValid('(){}[](){}[]')).toBe(true);
  });

  it('deeply nested', () => {
    expect(isValid('(((((((((())))))))))')).toBe(true);
  });
});
]=],
  },
}

return M
