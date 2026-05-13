---
title: Datadog CLI (datadog-ci)
category: cli
docs_url: https://docs.datadoghq.com/developers/integrations/github_actions/
created: "2026-05-10"
tags: [datadog, observability, monitoring, devops, ci-cd]
---

# Datadog CLI Cheatsheet

> Official Datadog command-line tools including `datadog-ci` for CI visibility, SAST, SBOM, and source code integration.

**Official Docs:** https://docs.datadoghq.com/continuous_integration/pipelines/  
**GitHub:** https://github.com/DataDog/datadog-ci  
**Platform(s):** macOS, Linux, Windows

---

## Installation

### macOS
```bash
brew install datadog-ci
```

### Linux
```bash
npm install -g @datadog/datadog-ci
# or
yarn global add @datadog/datadog-ci
```

### Docker
```bash
docker pull datadog/ci
```

### Verify
```bash
datadog-ci version
```

---

## Setup

### Authentication
```bash
# Set API and app keys
export DATADOG_API_KEY="xxxxxxxxxxxxxxxx"
export DATADOG_APP_KEY="xxxxxxxxxxxxxxxx"
export DATADOG_SITE="datadoghq.com"  # or datadoghq.eu, us3, us5, ap1, gov
```

### Config file
**File:** `~/.datadog-ci/config.json` (optional)
```json
{
  "apiKey": "xxxxxxxxxxxxxxxx",
  "appKey": "xxxxxxxxxxxxxxxx",
  "site": "datadoghq.com"
}
```

---

## Command Reference

### General
| Command | Description |
|---------|-------------|
| `datadog-ci version` | Show version |
| `datadog-ci config` | Show current config |
| `datadog-ci --help` | Help |

### CI Visibility
| Command | Description |
|---------|-------------|
| `datadog-ci junit upload --service my-service report.xml` | Upload JUnit XML |
| `datadog-ci trace --name "Build" --start-time 1234567890` | Submit custom trace |
| `datadog-ci sarif upload --service my-service results.sarif` | Upload SARIF results |

### Source Code Integration
| Command | Description |
|---------|-------------|
| `datadog-ci git-metadata upload` | Upload git metadata |
| `datadog-ci sourcemaps upload --service my-service --release-version 1.0.0 ./dist` | Upload sourcemaps |

### SAST / SBOM
| Command | Description |
|---------|-------------|
| `datadog-ci sast scan` | Run SAST scan |
| `datadog-ci sbom upload --service my-service sbom.json` | Upload SBOM |

### Lambda
| Command | Description |
|---------|-------------|
| `datadog-ci lambda instrument -f function-name` | Instrument Lambda |
| `datadog-ci lambda uninstrument -f function-name` | Uninstrument Lambda |
| `datadog-ci lambda instrument --functions-regex "prod-.*"` | Regex match |

### DORA Metrics
| Command | Description |
|---------|-------------|
| `datadog-ci dora deployment --service my-service --env prod --ref v1.0.0 --started-at 1234567890` | Send deployment event |
| `datadog-ci dora incident --service my-service --env prod --started-at 1234567890 --severity SEV-1` | Send incident event |

### Gate Evaluation
| Command | Description |
|---------|-------------|
| `datadog-ci gate evaluate` | Evaluate quality gates |
| `datadog-ci gate evaluate --scope team:backend` | With scope |

### Flaky Test
| Command | Description |
|---------|-------------|
| `datadog-ci tag --level test --tags "test.name:foo"` | Tag tests |

### React Native
| Command | Description |
|---------|-------------|
| `datadog-ci react-native xcode --service my-service` | iOS sourcemaps |
| `datadog-ci react-native gradle --service my-service` | Android sourcemaps |

---

## Examples

### GitHub Actions integration
```yaml
- name: Upload JUnit to Datadog
  env:
    DD_API_KEY: ${{ secrets.DD_API_KEY }}
  run: |
    npx @datadog/datadog-ci junit upload \
      --service my-service \
      --env ci \
      ./test-results/
```

### Lambda instrumentation
```bash
datadog-ci lambda instrument \
  --functions-regex "prod-api-.*" \
  --service prod-api \
  --env production \
  --version 1.2.3
```

### Git metadata upload
```bash
datadog-ci git-metadata upload
# Required for source code integration with errors/security findings
```

### SAST scan in CI
```bash
datadog-ci sast scan --directory ./src --output ./sast-results.sarif
datadog-ci sarif upload --service my-service ./sast-results.sarif
```

---

## Tips

- **Site selection:** `datadoghq.com` (US1), `datadoghq.eu` (EU), `us3.datadoghq.com`, `us5.datadoghq.com`, `ap1.datadoghq.com`, `ddog-gov.com`.
- **Git metadata:** Upload once per repo. Enables file path mapping in error tracking and security findings.
- **Lambda layers:** Instrumentation adds Datadog Lambda extension + tracer as layers.
- **Quality gates:** Use `datadog-ci gate evaluate` in deployment pipelines to block based on SLOs/error rates.
- **DORA metrics:** Send deployment and incident events to compute DORA metrics in Datadog.

---
*Generated via cheatsheet skill on 2026-05-10*
