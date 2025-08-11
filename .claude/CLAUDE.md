# Communication Rules
- Respond to the user in Japanese  
  <!-- ユーザーには日本語で応答すること -->

# Coding Rules
- Introduce explanatory/summary variables to break down complex expressions for clarity  
  <!-- 説明変数／要約変数を導入し、複雑な式をわかりやすく分割すること -->
- Avoid control flow variables (e.g., `done` flags); use `break` or similar to branch clearly  
  <!-- 制御フロー変数（例：doneフラグ）を避け、breakなどで明確に分岐すること -->
- Keep variable scope as narrow as possible; prefer local variables over member variables  
  <!-- 変数のスコープはできるだけ狭くし、メンバ変数よりローカル変数を優先すること -->
- Use early returns (guard clauses) to keep nesting shallow  
  <!-- 早期リターン（ガード節）を用いてネストを浅く保つこと -->
- For code that is difficult to understand, be able to explain the underlying logic of the generated code  
  <!-- 理解困難なコードには、生成したコードの動作原理を説明できること -->
- Add usage examples and comments for any complex type definitions  
  <!-- 複雑な型定義には必ず使用例とコメントを追加すること -->

# Prohibited Actions
- Outputting secrets or personal information  
  <!-- Secrets や個人情報の出力 -->
- Guessing external API code without official specifications  
  <!-- 公式仕様不明の外部APIコード推測 -->

