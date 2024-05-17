## 发布版本
这是一个发版新版本的 Merge Request，请确认已经完成以下操作：
- [ ] 通过 `git cliff --bumped-version` 命令生成新版本号 `$BUMPED_VERSION`:
    ```sh
    BUMPED_VERSION=$(git cliff --bumped-version)
    ```
- [ ] 最后一个提交已更新 `typst.toml` 的版本为 `$BUMPED_VERSION`, 并添加到最后的提交中:
    ```sh
    # Powershell
    # sd 'version = ".*"' "version = `"$BUMPED_VERSION`"" typst.toml
    # sd 'version = "v(.*)"' 'version = "$1"' typst.toml
    sd 'version = ".*"' "version = \"$BUMPED_VERSION\"" typst.toml
    sd 'version = "v(.*)"' "version = \"$1\"" typst.toml
    git add typst.toml
    ```
- [ ] 最后一个提交已更新 `CHANGELOG.md`:
    ```sh
    git cliff --unreleased --tag $BUMPED_VERSION --prepend CHANGELOG.md -- --newest
    ```
- [ ] 最后一个提交的提交信息符合 `chore(release): $BUMPED_VERSION`
    ```sh
    git commit -m "chore(release): $BUMPED_VERSION"
    ```
- [ ] 最后一个提交带有标签，标签头 `$BUMPED_VERSION`，并且标签描述通过 `git cliff` 生成：
    ```sh
    git cliff --bump --unreleased -- --newest > release_$BUMPED_VERSION.md
    git tag '$BUMPED_VERSION' --file release_$BUMPED_VERSION.md
    ```
- [ ] （可选）标签是否经过 GPG 签名
