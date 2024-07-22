# RPMs prefetch sample repo

## Explanation on the existing files

- rpms.lock.yaml: the only file necessary for the Hermeto prefetch.
- rpms.in: lists the RPMs that will be installed in the Dockerfile.
- redhat.repo: used only to generate the rpms.lock.yaml file. Copied from a UBI9 image.
- Dockefile: sample file used for the image build.

## How the rpms.lock.yaml file was generated

```
rpm-lockfile-prototype -f Dockerfile rpms.in --outfile rpms.lock.yaml
```

*The [rpm-lockfile-prototype](https://github.com/konflux-ci/rpm-lockfile-prototype) project needs to be installed locally.*

