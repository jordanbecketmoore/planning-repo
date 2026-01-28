# Planning Repo

A Makefile-based system for managing an arbitrary directory structure of cloned git repositories with the ability to restore them on the fly from this configuration.

## Purpose

This repository stores the configuration for cloning multiple git repositories into a specific directory structure. Rather than manually tracking each repository location, you define the cloning commands in the Makefile and can recreate the entire directory structure automatically.

## Structure

- **Makefile**: Contains make targets that define which repositories to clone and where
- **.gitignore**: Lists directories containing cloned repositories (ignored by git)
- **README.md**: This file

## Make Targets

### `repo`

Clone a single git repository and register it for future hydration.

**Usage:**
```bash
make repo url=<git-url> dir=<local-directory>
```

**Example:**
```bash
make repo url=https://github.com/user/myrepo.git dir=solo/myproject
```

**What it does:**
1. Clones the specified git repository into the given directory
2. Adds the directory to `.gitignore` to keep cloned repos out of version control
3. Appends the git clone command to the `hydrate` target in the Makefile

### `hydrate`

Restore all registered repositories by running all the clone commands defined in the Makefile's `hydrate` target.

**Usage:**
```bash
make hydrate
```

**What it does:**
- Executes all accumulated `git clone` commands, recreating the directory structure as it was configured

## Workflow

1. **Initial Setup**: Clone repositories into your desired directory structure using `make repo`
   ```bash
   make repo url=https://github.com/user/repo1.git dir=solo/project1
   make repo url=https://github.com/user/repo2.git dir=jm/tests/project2
   ```

2. **Commit Configuration**: The Makefile now contains all clone commands. Commit it to preserve your directory structure configuration.

3. **Restore Anytime**: Run `make hydrate` to recreate the entire directory structure on a fresh clone or different machine.

## Example Directory Structure

After running the setup commands above, you might have:
```
planning-repo/
├── Makefile
├── README.md
├── .gitignore
├── solo/
│   └── project1/          (cloned repo, not tracked)
└── jm/
    └── tests/
        └── project2/      (cloned repo, not tracked)
```
