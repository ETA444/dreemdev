# VS Code Snippets

This folder contains VS Code snippet files managed as part of the `dreemdev` repo and symlinked into the VS Code global user directory:

```
~/Library/Application Support/Code/User/snippets/
```

Editing any file here updates VS Code immediately — no restart required. The `snippets/` folder itself is symlinked via `setup-vscode-symlinks.sh`, so every file added here is automatically picked up on the current machine and reproduced on any new machine after running that script.

***

## Snippet Naming Logic

Snippets follow a strict **`namespace-descriptor`** naming pattern. Know the namespace, guess the snippet.

| Namespace | Domain | Example prefixes |
|-----------|--------|-----------------|
| `py-` | General Python | `py-header`, `py-func`, `py-logging`, `py-timer`, `py-cli`, `py-dataclass` |
| `nb-` | Jupyter Notebooks | `nb-header` |
| `da-` | Data Analysis | `da-start`, `da-eda-overview`, `da-eda-num`, `da-eda-cat`, `da-eda-corr`, `da-missing`, `da-plot`, `da-sns`, `da-pairplot` |
| `pd-` | Pandas Utilities | `pd-mem`, `pd-optimize`, `pd-group`, `pd-pivot` |
| `ml-` | Machine Learning | `ml-pipeline`, `ml-reg-pipeline`, `ml-cv`, `ml-grid`, `ml-clf-metrics`, `ml-roc` |
| `ds-` | DataSafari | `ds-explore`, `ds-predict` |
| `api-` | FastAPI / APIs | `api-route` |

**In practice:** open a `.py` file, type the namespace prefix (`da-`, `ml-`, etc.) and let IntelliSense show you the options. You rarely need to remember the full prefix — just the namespace.

> **Tip:** set `"editor.snippetSuggestions": "top"` in `settings.json` so snippets always surface above IntelliSense variable/import suggestions.

***

## File Naming Convention

| Extension | Format | Comments |
|-----------|--------|----------|
| `.code-snippets` | JSONC | ✅ `//` and `/* */` allowed |
| `.json` | Strict JSON | ❌ Comments cause parse errors |

**Always use `.code-snippets`.** Never `.json` for snippet files.

***

## Files

### `python.code-snippets`

Definitive Python snippet set covering data analysis, data science, ML pipelines, and general Python development.

#### Headers

| Prefix | Description |
|--------|-------------|
| `py-header` | Full script header — logging, pathlib constants (`ROOT_DIR`, `DATA_DIR`, `OUTPUT_DIR`), `main()` entrypoint |
| `nb-header` | Jupyter notebook header — pandas/numpy/matplotlib/seaborn imports, display config, plot style picker |

#### Data Analysis

| Prefix | Description |
|--------|-------------|
| `da-start` | Data loading starter with pathlib and `describe(include='all')` |
| `da-eda-overview` | Shape, dtypes, missing values, unique value counts |
| `da-eda-num` | Numeric column summary with `describe().T` and histogram grid |
| `da-eda-cat` | Categorical value counts per column |
| `da-eda-corr` | Correlation heatmap for numeric columns |
| `da-missing` | Missingness heatmap via seaborn |

#### Pandas Utilities

| Prefix | Description |
|--------|-------------|
| `pd-mem` | DataFrame memory usage in MB, sorted by column |
| `pd-optimize` | Dtype optimization — downcasts floats/ints, converts low-cardinality strings to `category` |
| `pd-group` | Groupby aggregation — count, mean, median, min, max |
| `pd-pivot` | Pivot table template |

#### Plotting

| Prefix | Description |
|--------|-------------|
| `da-plot` | Matplotlib `fig, ax` template with axis method picker |
| `da-sns` | Seaborn plot with `x`, `y`, `hue`, and plot type picker |
| `da-pairplot` | Seaborn pairplot with `corner=True` and hue |

#### Machine Learning

| Prefix | Description |
|--------|-------------|
| `ml-pipeline` | Supervised classification pipeline — `StandardScaler` + model + `classification_report` |
| `ml-reg-pipeline` | Regression pipeline — `StandardScaler` + model + MAE, RMSE, R² |
| `ml-cv` | Cross-validation with scoring picker |
| `ml-grid` | `GridSearchCV` with `n_jobs=-1` and best params output |
| `ml-clf-metrics` | Classification report + `ConfusionMatrixDisplay` plot |
| `ml-roc` | ROC curve with AUC label |

#### DataSafari

| Prefix | Description |
|--------|-------------|
| `ds-explore` | `explore_df()` one-liner EDA |
| `ds-predict` | `predict_ml()` full pipeline with all key params |

#### Utilities

| Prefix | Description |
|--------|-------------|
| `py-timer` | Execution timer with `time.time()` |
| `py-logging` | Standard `logging.basicConfig` setup with level picker |
| `py-dataclass` | Dataclass template with `field()` and `__post_init__` |
| `py-func` | Type-hinted function skeleton with docstring |
| `py-cli` | Argparse CLI entrypoint with `--verbose` flag and logging |
| `api-route` | FastAPI route handler — method picker, typed params, docstring |

***

## Adding a New Language

1. Create `<language>.code-snippets` in this folder
2. Follow the `namespace-descriptor` prefix convention — define your namespaces at the top of the file as a comment block
3. Add a section to this README under **Files** using the same table format
4. The symlink covers the whole folder — no script changes needed

***

## Symlink Setup

All three items are symlinked via `setup-vscode-symlinks.sh`:

```
~/dev/dreemdev/tools/configs/vscode/settings.json      → .../Code/User/settings.json
~/dev/dreemdev/tools/configs/vscode/keybindings.json   → .../Code/User/keybindings.json
~/dev/dreemdev/tools/configs/vscode/snippets/          → .../Code/User/snippets/
```

***

## New Machine Checklist

- [ ] Clone `dreemdev` repo
- [ ] Run `setup-vscode-symlinks.sh`
- [ ] Open VS Code — all config and snippets are live immediately
