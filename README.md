# Homebrew Tap for Mycel

Homebrew formulae for [Mycel](https://github.com/matutetandil/mycel) — a declarative
microservice runtime. You describe what connects to what, and it runs the service.

## Install

```bash
brew install matutetandil/tap/mycel
```

Or tap first, then install by name:

```bash
brew tap matutetandil/tap
brew install mycel
```

## Verify

```bash
mycel version
mycel init my-service && cd my-service && mycel start
curl localhost:3000/status
```

## Formulae

| Formula | Description |
|---------|-------------|
| `mycel` | The runtime and its CLI — `init`, `add`, `validate`, `check`, `start` |

## Notes

The formula builds from source, so Homebrew installs Go as a build dependency and
compiles on your machine. Expect the first install to take around a minute.

`mycel version` reports `commit: dev` for a Homebrew build: the source tarball
carries no git metadata, so the binary falls back to the release constant. The
version number itself is correct.

## Other ways to install

Mycel is a server runtime, and Homebrew is only one way in:

```bash
docker run -v $(pwd):/etc/mycel -p 3000:3000 mdenda/mycel
go install github.com/matutetandil/mycel/v2/cmd/mycel@latest
helm install my-api oci://ghcr.io/matutetandil/charts/mycel
```

See the [installation guide](https://matutetandil.github.io/mycel/getting-started/installation/).

## Updating

Formulae here are updated automatically by the Mycel release workflow when a
version is tagged. Manual edits will be overwritten.
