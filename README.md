# .emacs.d

An Emacs 31 configuration for a project-oriented IDE.  Helix remains the
small, terminal-first editor; this configuration is for longer project work.

## Design

- Prefer Emacs built-ins: `project.el`, `compile.el`, Eglot, Flymake, Xref,
  Tree-sitter, Dired, `recentf`, and `save-place`.
- Keep third-party packages only where they provide a distinct interface:
  Vertico/Consult/Embark, Corfu/Cape, Magit, Avy, Tempel, Eat, AUCTeX, and a
  few focused editing helpers.
- Global language servers are declared once in `lisp/init-eglot.el`.  A
  project-only server belongs in that project's Nix development shell and is
  started explicitly with `M-x eglot`.
- Tree-sitter never downloads or compiles grammars during startup.  On opening
  a supported file with a missing grammar, it asks before installing one.

## Project workflow

`project.el` is the project root and `compile.el` runs project-provided
Makefiles or scripts.  The main commands are:

| Key | Command |
| --- | --- |
| `C-c p p` | Switch project |
| `C-c p f` | Find file in project |
| `C-c p b` | Switch project buffer |
| `C-c p s` | Search project with ripgrep |
| `C-c p g` | Built-in project regexp search |
| `C-c p d` | Open project Dired |
| `C-c p c` | Compile project |
| `C-c p r` | Repeat the last compilation |

Eglot keeps the standard `M-.` / `M-,` definition navigation.  In an
Eglot-managed buffer, `C-c l a` runs code actions, `C-c l r` renames, `C-c l
f` formats manually, `C-c l d` shows diagnostics, and `C-c l n` / `C-c l p`
move between diagnostics.

## External tools

The globally declared LSP servers are `ty`, `clangd`,
`typescript-language-server`, `rust-analyzer`, `bash-language-server`,
`lua-language-server`, `taplo`, `marksman`, and `verible-verilog-ls`.
They are managed by Home Manager.  `git`, `rg`, a TeX distribution, and the
language-specific compiler/formatter remain external by design.

## Package maintenance

Packages are managed by Emacs's built-in Package.el, not by Nix.
`use-package-always-ensure` installs a declared third-party package when it is
missing, so adding a `use-package` declaration needs no separate package list
or synchronization command.

`custom.el` is ignored by Git and loaded after the static modules.  Use it for
machine-local GUI preferences; put shared, reviewable configuration in `lisp/`.
