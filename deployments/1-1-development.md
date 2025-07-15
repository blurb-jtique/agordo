# Development Workflow Scenario

In the **legacy `blurby` application**, we are working with a **master branch that requires several local modifications** to run the project and execute tests in our development environment. These modifications include changes to six specific files that are **not intended for production**, and should **never be committed or pushed** to the central repository.

These changes are **temporary** and **environment-specific**—they serve to:

* Bypass or adapt old or broken behavior
* Allow local testing with mock services or modified configurations
* Bridge compatibility issues with outdated dependencies

The project, however, is still under active development. When we're ready to begin implementing **new features**, our goal is to:

1. Create a **new branch from the original, clean `origin/master`**.
2. Develop the feature based on the production-grade codebase.
3. Avoid carrying over the local-only changes into feature branches or commits.
4. Preserve the local changes so that we can still **run the app and test it locally** at any time.

---

## 💡 The Solution

To support this scenario, we are adopting a **`.patch` file strategy** combined with automation hooks and scripts. This approach allows we to:

* Maintain a `.patch` file (e.g., `~/.git-local-env.patch`) that stores the local diffs.
* Automatically **remove** the patch:

  * Before committing
  * Before switching or creating a new feature branch
* Automatically **reapply** the patch:

  * After switching branches
  * After a clean checkout

By scripting and hooking into Git's workflow (e.g., `pre-commit`, `post-checkout`, or custom Git aliases), we ensure that:

* **our local environment stays functional**
* **our Git history stays clean**
* **No production-breaking code is ever pushed accidentally**

--

## The usage

--

## The Implementation Appendix

Creating the local-env patch

```bash
git diff > local-env.patch
```

## ✅ Step 1: Applying a pre-commit strategy

File: .git/hooks/pre-commit

```bash
#!/bin/bash

PATCH="$HOME/.git-local-env.patch"

if [ ! -f "$PATCH" ]; then
  echo "✅ No patch file found. Proceeding with commit."
  exit 0
fi

echo "🔍 Checking if any patch-modified files are staged..."

STAGED_FILES=$(git diff --cached --name-only)
PATCH_FILES=$(grep '^+++ b/' "$PATCH" | cut -c7-)
MATCHING_FILES=()

for file in $PATCH_FILES; do
  if echo "$STAGED_FILES" | grep -Fxq "$file"; then
    MATCHING_FILES+=("$file")
  fi
done

if [ "${#MATCHING_FILES[@]}" -gt 0 ]; then
  echo "❌ Warning: The following files from your local-only patch are staged:"
  for f in "${MATCHING_FILES[@]}"; do
    echo "   • $f"
  done
  echo

  # Force prompt using /dev/tty
  if [ -t 0 ] || [ -e /dev/tty ]; then
    echo "❓ Do you want to continue with this commit anyway? [y/N]" > /dev/tty
    read -r answer < /dev/tty
    case "$answer" in
      [Yy]* )
        echo "✅ Commit confirmed by user." > /dev/tty
        exit 0
        ;;
      * )
        echo "🛑 Commit aborted to avoid accidental push of local-only files." > /dev/tty
        exit 1
        ;;
    esac
  else
    echo "🛑 No interactive terminal available. Commit aborted as a precaution."
    exit 1
  fi
fi

echo "✅ No patch files staged. Proceeding with commit."
exit 0
```

Make it executable:

```bash
chmod +x .git/hooks/pre-commit
```

## ✅ Step 2: Auto-reapply after commit

in the `post-commit` hook we will decide whether to reapply the patch after the commit. However, **there are a few caveats**:

1. **Interactive prompts will only work in terminal Git usage** (e.g., `git commit` in a terminal).
2. If we're using a **GUI client** (like GitHub Desktop, SourceTree, VS Code’s Git integration), prompts may not display, or may break the process.
3. For full safety, fall back gracefully if input is not possible.

File: .git/hooks/post-commit

```bash
#!/bin/bash

PATCH="$HOME/.git-local-env.patch"

# Ensure the patch exists
if [ -f "$PATCH" ]; then
  # Force prompt through /dev/tty to handle non-interactive shells (like git commit -m)
  if [ -t 1 ] || [ -e /dev/tty ]; then
    echo "" > /dev/tty
    echo "➡️  Do you want to reapply your local environment patch? [y/N]" > /dev/tty
    read -r answer < /dev/tty
    case "$answer" in
      [Yy]* )
        echo "✅ Reapplying patch..." > /dev/tty
        if git apply "$PATCH"; then
          echo "✔️ Patch applied." > /dev/tty
        else
          echo "❌ Patch failed to apply. Please check your working tree." > /dev/tty
        fi
        ;;
      * )
        echo "❌ Patch not applied." > /dev/tty
        ;;
    esac
  else
    echo "⚠️  Skipping patch reapplication: no interactive terminal detected."
  fi
fi
```

Make it executable:

```bash
chmod +x .git/hooks/post-commit
```

### 🧪 How to Test It

1. Save it as `.git/hooks/post-commit`
2. Make it executable:

   ```bash
   chmod +x .git/hooks/post-commit
   ```

3. Commit something from a terminal:

   ```bash
   git commit -m "Test"
   ```

we should get a prompt like:

```sh
➡️  Do we want to reapply our local environment patch? [y/N]
```

---

## ✅ Step 3: Automate Feature Branch Creation

we can create a custom Git alias or script to:

1. Checkout from origin/master
2. Create the new branch

### Script: `git-new-feature`

Save this as `~/bin/git-new-feature` and add `~/bin` to our `PATH`.

```bash
#!/bin/bash

PATCH="$HOME/.git-local-env.patch"

# Step 1: Ask for feature branch name
read -rp "📛 Enter name of new feature branch: " FEATURE_BRANCH
if [ -z "$FEATURE_BRANCH" ]; then
  echo "❌ Feature branch name is required."
  exit 1
fi

# Step 3: Ask for base branch (default: origin/master)
read -rp "🌿 Base branch to branch off from? [origin/master]: " BASE_BRANCH
BASE_BRANCH=${BASE_BRANCH:-origin/master}

# Step 2: Create feature branch
echo "📦 Creating branch '$FEATURE_BRANCH' from '$BASE_BRANCH'..."
git fetch origin
git checkout -b "$FEATURE_BRANCH" "$BASE_BRANCH"

# Step 3: Ask to reapply the patch
if [ -f "$PATCH" ]; then
  if [ -t 1 ]; then
    echo
    echo "❓ Reapply local environment patch now? [y/N]"
    read -r answer
    case "$answer" in
      [Yy]* )
        echo "✅ Reapplying patch..."
        if git apply "$PATCH"; then
          echo "✔️ Patch applied successfully."
        else
          echo "❌ Failed to apply patch. Please check your working tree."
        fi
        ;;
      * )
        echo "⏭️ Skipped patch reapplication."
        ;;
    esac
  else
    echo "⚠️ Non-interactive shell detected. Skipping patch reapplication."
  fi
fi
```

Make it executable:

```bash
chmod +x ~/bin/git-new-feature
```

Now run:

```bash
git-new-feature feature/add-payment-validation
```

---

## ✅ Step 4: `apply-local-env-patch` Script

### 📝 Script (save as `~/bin/apply-local-env-patch` or in our repo under `scripts/`)

```bash
#!/bin/bash

PATCH="${HOME}/.git-local-env.patch"

echo "🔍 Checking for local environment patch..."

# Check patch file exists
if [ ! -f "$PATCH" ]; then
  echo "❌ No patch file found at: $PATCH"
  exit 1
fi

# Check if patch can be applied cleanly
if git apply --check "$PATCH"; then
  echo "✅ Applying local environment patch..."
  git apply "$PATCH" && echo "✔️ Patch applied successfully."
else
  echo "⚠️ Patch cannot be applied cleanly. our working tree may already have conflicting changes."
  echo "💡 Tip: we can try resetting or reversing it first:"
  echo "     git apply -R $PATCH"
  exit 2
fi
```

### 📦 How to Use It

1. Save it as `apply-local-env-patch` in a folder in our `$PATH` (e.g. `~/bin/`), or in our project under `scripts/`.
2. Make it executable:

   ```bash
   chmod +x ~/bin/apply-local-env-patch
   ```

3. Run it anytime with:

   ```bash
   apply-local-env-patch
   ```

Or from inside our project:

```bash
./scripts/apply-local-env-patch
```

Absolutely! Here's a **safe and user-friendly script** to unapply (reverse) your local environment patch only when it can be cleanly reversed.

---

## ✅ Step 5: `unapply-local-env-patch` Script

### 📝 Script (save as `~/bin/unapply-local-env-patch` or under `scripts/`)

```bash
#!/bin/bash

PATCH="${HOME}/.git-local-env.patch"

echo "🔍 Checking if local environment patch can be removed..."

# Check if patch file exists
if [ ! -f "$PATCH" ]; then
  echo "❌ No patch file found at: $PATCH"
  exit 1
fi

# Check if patch can be safely reversed
if git apply --reverse --check "$PATCH"; then
  echo "⏪ Reversing local environment patch..."
  git apply -R "$PATCH" && echo "✔️ Patch reversed successfully."
else
  echo "⚠️ Cannot safely reverse patch. Working tree may not match the patch state."
  echo "🔎 Tip: Run 'git diff' or 'git status' to inspect your changes."
  exit 2
fi
```

#### 🧪 How to Use

1. Save it as `unapply-local-env-patch`
2. Make it executable:

   ```bash
   chmod +x ~/bin/unapply-local-env-patch
   ```

3. Run it anytime with:

   ```bash
   unapply-local-env-patch
   ```

Or, if in a `scripts/` directory:

```bash
./scripts/unapply-local-env-patch
```

---

## 🧰 Another Alternative: Using `--assume-unchanged`

When we run:

```bash
git update-index --assume-unchanged <file>
```

Git will stop checking that file for changes — *i.e.*, it **won’t appear in `git status`**, and **won’t be staged or committed** accidentally.

This is useful for **ignoring local-only edits to tracked files**, which is exactly our case.

---

### ✅ Pros

* Simple and fast — no need for patches, stashes, or new branches.
* Works with files that *must exist* and be modified locally, like:

  * `config/database.yml`
  * local service client overrides
  * developer-specific `Gemfile` lines
* Changes persist across branches.

---

### ⚠️ Caveats and Warnings

| Limitation                    | Description                                                                                                      |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| ❗ Not respected by Git itself | If we *edit the file*, it will stay modified locally, but Git won’t remind we. we might forget it’s modified. |
| ❗ Not respected by all tools  | Tools like linters, CI scripts, or pre-commit hooks *might still see the changes*.                               |
| ❌ Not portable                | It’s a local-only setting — no team-wide consistency. That might be fine in our case.                           |
| 🧨 Reset if index is rebuilt  | Some Git commands (like `git reset --hard`) or certain rebase workflows can wipe the assume-unchanged flag.      |
