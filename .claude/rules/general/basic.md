# 基本ルール

## コミュニケーション

### 言語設定
- ユーザーには日本語で応答すること
- コード内のコメントは日本語を使用
- エラーメッセージはユーザー向けは日本語、ログは英語

### 説明方針
- 技術用語は適切に使用し、必要に応じて補足説明を追加
- 実装の意図や設計判断の理由を明確に伝える
- 複雑な処理には動作原理の説明を含める

## コーディング原則

### 可読性優先
- **説明変数の活用**: 複雑な式は意味のある名前の変数に分割
```typescript
// Bad
if (user.age >= 18 && user.hasConsent && !user.isBlocked) { }

// Good
const isAdult: boolean = user.age >= 18;
const hasPermission: boolean = user.hasConsent && !user.isBlocked;
if (isAdult && hasPermission) { }
```

### シンプルな制御フロー
- **早期リターン**: ガード節でネストを浅く保つ
- **制御フラグ回避**: done/flagなどの変数より、明確なbreak/returnを使用
```typescript
interface User {
  id: string;
  isActive: boolean;
}

// Bad
function processUser(user: User | null): ProcessResult | null {
  let result: ProcessResult | null = null;
  if (user) {
    if (user.isActive) {
      result = doProcess(user);
    }
  }
  return result;
}

// Good
function processUser(user: User | null): ProcessResult | null {
  if (!user) return null;
  if (!user.isActive) return null;
  return doProcess(user);
}
```

### スコープ管理
- **最小スコープ原則**: 変数は使用する最も狭いスコープで定義
- **ローカル変数優先**: クラス変数より関数内変数を優先
- **const優先**: 再代入不要な変数は必ずconstを使用

### 型安全性
- **明示的な型定義**: TypeScriptでは型推論に頼りすぎない
- **null/undefined の扱い**: Optional Chainingやnullish coalescingを活用
```typescript
// 複雑な型には使用例とコメントを追加
/**
 * ユーザーの権限レベルを表す型
 * @example
 * const permission: Permission = { role: 'admin', scope: ['read', 'write'] }
 */
type Permission = {
  role: 'admin' | 'user' | 'guest';
  scope: ('read' | 'write' | 'delete')[];
};
```

## エラーハンドリング

### 基本方針
- **予期可能なエラー**: try-catchで適切に処理
- **ログ記録**: エラーは必ずログに記録（スタックトレース含む）
- **ユーザーフィードバック**: 技術的詳細を隠した分かりやすいメッセージ

### 実装例
```typescript
interface OperationContext {
  userId: string;
  operationId: string;
}

class UserError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'UserError';
  }
}

async function executeOperation(context: OperationContext): Promise<OperationResult> {
  try {
    const result = await riskyOperation();
    return result;
  } catch (error) {
    // ログには詳細情報
    logger.error('Operation failed', {
      error: error instanceof Error ? error.stack : String(error),
      context
    });

    // ユーザーには簡潔なメッセージ
    throw new UserError('処理に失敗しました。しばらく待ってから再度お試しください。');
  }
}
```

## 命名規則

### 基本ルール
- **意図が明確な名前**: 略語を避け、役割を表す名前を使用
- **一貫性**: プロジェクト内で統一された命名規則を維持
- **検索しやすさ**: grepで見つけやすい、ユニークな名前

### 具体例
```typescript
// Functions: 動詞で始める
function getUserById(id: string): Promise<User>
function calculateTotal(items: Item[]): number
function validateInput<T>(input: unknown): input is T

// Boolean: is/has/canで始める
const isLoading: boolean = false;
const hasPermission: boolean = true;
const canEdit: boolean = user.role === 'admin';

// Collections: 複数形
const users: User[] = [];
const items: Map<string, Item> = new Map();
const configurations: Set<Config> = new Set();

// Constants: UPPER_SNAKE_CASE
const MAX_RETRY_COUNT = 3 as const;
const DEFAULT_TIMEOUT = 30000 as const;
const API_BASE_URL = 'https://api.example.com' as const;

// Enums: PascalCase
enum UserRole {
  Admin = 'ADMIN',
  User = 'USER',
  Guest = 'GUEST'
}

// Types/Interfaces: PascalCase
type UserId = string;
interface UserProfile {
  id: UserId;
  name: string;
  role: UserRole;
}
```

## パフォーマンス考慮

### 基本指針
- **計測してから最適化**: 推測ではなく実測に基づく
- **メモ化**: 重い計算結果は適切にキャッシュ
- **非同期処理**: I/O処理は並列化を検討

### アンチパターン回避
```typescript
interface User {
  id: string;
  name: string;
  posts?: Post[];
}

interface Post {
  id: string;
  userId: string;
  title: string;
}

// N+1問題を避ける
// Bad
async function loadUsersWithPosts(): Promise<User[]> {
  const users = await getUsers();
  for (const user of users) {
    user.posts = await getPostsByUserId(user.id); // N回のクエリ
  }
  return users;
}

// Good
async function loadUsersWithPosts(): Promise<User[]> {
  const users = await getUsers();
  const userIds = users.map(u => u.id);
  const allPosts = await getPostsByUserIds(userIds); // 1回のクエリ

  const postsByUserId = new Map<string, Post[]>();
  allPosts.forEach(post => {
    const posts = postsByUserId.get(post.userId) || [];
    posts.push(post);
    postsByUserId.set(post.userId, posts);
  });

  users.forEach(user => {
    user.posts = postsByUserId.get(user.id) || [];
  });

  return users;
}
```

## セキュリティ

### 禁止事項
- **機密情報の露出**: APIキー、パスワード、個人情報をログやコードに含めない
- **推測実装**: 公式ドキュメントのないAPIの実装を推測で行わない
- **安全でない操作**: evalやinnerHTMLの不適切な使用

### 必須対応
- **入力検証**: すべてのユーザー入力を検証・サニタイズ
- **出力エスケープ**: XSS対策として適切にエスケープ
- **SQLインジェクション対策**: プリペアドステートメントを使用

## テスト

### テスト作成指針
- **テストファースト**: バグ修正時は再現テストを先に書く
- **境界値テスト**: エッジケースを必ずカバー
- **独立性**: テスト間の依存を排除

### テストの書き方
```typescript
function calculateDiscount(price: number, discountRate: number): number {
  if (price < 0) {
    throw new Error('価格は正の数である必要があります');
  }
  return price * (1 - discountRate);
}

describe('calculateDiscount', () => {
  it('通常の割引計算が正しく行われる', () => {
    expect(calculateDiscount(1000, 0.1)).toBe(900);
  });

  it('割引率が0の場合は元の価格を返す', () => {
    expect(calculateDiscount(1000, 0)).toBe(1000);
  });

  it('負の価格では例外を投げる', () => {
    expect(() => calculateDiscount(-100, 0.1)).toThrow('価格は正の数である必要があります');
  });

  // 型安全なモックの例
  it('外部サービスとの連携テスト', async () => {
    const mockPaymentService: PaymentService = {
      charge: jest.fn().mockResolvedValue({ success: true, transactionId: 'tx123' })
    };

    const result = await processPayment(mockPaymentService, 1000);
    expect(result.success).toBe(true);
  });
});
```

## ドキュメント

### コメントの原則
- **Why over What**: 「なぜ」を説明（「何を」はコードが語る）
- **複雑なロジック**: アルゴリズムや計算式には説明を追加
- **TODO/FIXME**: 担当者と期限を明記

### TSDocの活用
```typescript
type InsurancePlan = 'basic' | 'standard' | 'premium';

interface PremiumResult {
  monthlyAmount: number;
  yearlyAmount: number;
  currency: 'JPY';
}

/**
 * ユーザーの年齢から保険料を計算する
 * @param age - ユーザーの年齢
 * @param plan - 保険プラン
 * @returns 月額・年額保険料（円）
 * @throws {RangeError} 年齢が0-120の範囲外の場合
 * @example
 * ```typescript
 * const premium = calculateInsurancePremium(30, 'standard');
 * console.log(premium.monthlyAmount); // 5000
 * console.log(premium.yearlyAmount);  // 60000
 * ```
 */
function calculateInsurancePremium(age: number, plan: InsurancePlan): PremiumResult {
  if (age < 0 || age > 120) {
    throw new RangeError(`年齢は0-120の範囲である必要があります: ${age}`);
  }

  // 実装
  const monthlyAmount = calculateMonthlyPremium(age, plan);
  return {
    monthlyAmount,
    yearlyAmount: monthlyAmount * 12,
    currency: 'JPY'
  };
}
```