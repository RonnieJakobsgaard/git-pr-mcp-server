# Contributing to momos-mcp

## Setup

```bash
cd momos-mcp
python3 -m venv .venv
.venv/bin/pip install -e ".[dev]"
```

## Running tests

```bash
cd momos-mcp
.venv/bin/python -m pytest tests/ -q
```

UI tests require Playwright browsers:

```bash
.venv/bin/playwright install chromium
.venv/bin/python -m pytest tests/ -q
```

Skip UI tests:

```bash
.venv/bin/python -m pytest tests/ -q --ignore=tests/test_ui_expand.py --ignore=tests/test_ui_comments.py --ignore=tests/test_ui_diff.py --ignore=tests/test_ui_smoke.py --ignore=tests/test_ui_status.py
```

## Making changes

1. Fork the repo and create a branch: `git checkout -b feat/your-feature`
2. Make changes and add tests
3. Run the test suite — all non-UI tests must pass
4. Open a pull request

## PR process

- Keep PRs focused — one feature or fix per PR
- Include a short description of what changed and why
- Tests required for new behaviour; bug fixes should include a regression test

## License

By contributing, you agree your changes are licensed under GPL-3.0.
