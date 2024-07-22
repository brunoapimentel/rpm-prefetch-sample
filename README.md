# RPMs prefetch sample repo

## Explanation on the existing files

- rpms.lock.yaml: the only file necessary for the Cachi2 prefetch.
- rpms.in: lists the RPMs that will be installed in the Dockerfile.
- ubi.repo: used only to generate the rpms.lock.yaml file. Copied from the UBI8 image.
- Dockefile: sample file used for the image build.

## How the ubi.repo file was copied

```
podman run --rm registry.access.redhat.com/ubi8/go-toolset:1.21 cat /etc/yum.repos.d/ubi.repo > ubi.repo
```

## How the rpms.lock.yaml file was generated

```
rpm-lockfile-prototype -f Dockerfile rpms.in --outfile rpms.lock.yaml
```

*The [rpm-lockfile-prototype](https://github.com/konflux-ci/rpm-lockfile-prototype) project needs to be installed locally.*

## How the Konflux build was set up

The following pipeline params need to be added:

```yaml
spec:
  params:
  - name: hermetic
    value: "true"
  - name: prefetch-input
    value: "rpm"
```

The following param needs to be added to the prefetch-dependencies task:

```yaml
spec:
  pipelineSpec:
      task:
      - name: prefetch-dependencies
        params:
          - name: dev-package-managers
            value: "true"
```

*Check the .tekton folder for the full pipeline definitions.*
