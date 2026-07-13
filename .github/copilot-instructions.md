# PR Release Changelog

## 从 PR 提交记录生成 Release Changelog 并写入 PR Body

### 何时使用
- PR 合入 main 前需要生成发布说明
- 需要按分类整理 changelog（Core、Debug Tools、Doc/Palette、CI Pipeline）
- 需要中英双语版本的 changelog
- 需要将 changelog 设置为 PR 的描述内容

### 工作流程

#### 1. 获取提交记录

```bash
git log --oneline --first-parent origin/main..origin/HEAD
```

#### 2. 按分类整理 changelog

参考格式 — 参见 [v2026.Q1 Release](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/releases/tag/v2026.Q1)：

```
## <V_YEAR.QUARTER> Release: <Title>

### Core
[update] [#NNN](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/issues/NNN) description
[fix] [#NNN](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/issues/NNN) description

### Debug Tools
[fix] description
[update] description

### Doc/Palette
[doc] [#NNN](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/pull/NNN) description

### CI Pipeline
[refactor] description
[update] description
```

**分类规则：**
- **Core**：框架功能新增/修复，用户可直接感知的变更，排最前
- **Debug Tools**：调试工具改进
- **Doc/Palette**：文档和面板更新
- **CI Pipeline**：CI 工作流变更、testcase 重构（非用户必要），排最后
- **Other Updates**：不属于上述分类但有意义的变更（如工具链改进、非核心模块调整等）
- 如果某个分类没有对应的提交，则完全省略该分类标题，不要在 changelog 中保留空的分类标题

**版本号规则：**
- 从当前分支名（如 `Dev_2026Q3`）或目标发布计划推断版本号，填入 `<V_YEAR.QUARTER>` 占位符
- 如果无法推断，询问用户确认目标版本

**链接格式：**
- 从 commit message 中提取以 `#` 开头的 issue 编号，格式化为 `[#NNN](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/issues/NNN)`
- PR 链接格式化为 `[#NNN](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/pull/NNN)`

**精简合并原则：**
- 合并类似提交（如多个 CI fix 合并为一条）
- 移除纯运维条目（版本号 bump、无法归类的 CI fix 提交）
- testcase 变更合并到 CI Pipeline 中，不单独成节

#### 3. 写入 PR body

如果当前上下文中无法获知 PR 编号，先询问用户提供 PR 编号；或者输出命令时保留 `<PR_NUMBER>` 占位符，并提示用户自行替换。

```bash
gh pr edit <PR_NUMBER> --body @'
## <V_YEAR.QUARTER> Release: <Title>

<英文版 changelog>

---

## <V_YEAR.QUARTER> Release：<中文标题>

<中文版 changelog>
'@
```

> 使用 PowerShell 时用 `@'...'@` here-string 避免引号转义问题。
