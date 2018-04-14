# Apt Resource for Concourse

Check and fetch packages of [debian repositories](https://wiki.debian.org/DebianRepository/Format) from [Concourse](https://concourse.ci/).

## Installing

Add the resource type to your pipeline:

```yaml
resource_types:
- name: apt
  type: docker-image
  source:
    repository: timotto/concourse-apt-resource
```

## Source Configuration

* `key_url`: *Required.* URL to the PGP key used to sign the repository.
* `repository`: *Required.* APT source.list line of the desired repository.
* `package`: *Required.* Package name.

## Behavior

### `check`: Check for new releases

The latest version of the package available using the source.list line are returned.

### `in`: Download package

The package is downloaded.

### `out`: Not supported.

## Example

### Trigger on new version

Define the resource:

```yaml
resources:
- name: google-chrome-stable
  type: apt
  source:
    key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    repository: "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
    package: google-chrome-stable
```

Add to job:

```yaml
jobs:
  # ...
  plan:
  - get: google-chrome-stable
    trigger: true
```
