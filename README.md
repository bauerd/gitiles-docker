# bauerd/gitiles

Configurable Docker image for [gitiles](https://github.com/google/gitiles)

## Running a container
```
% docker run -p 9090:8080 -v $LOCAL_REPOS:/var/repos:ro bauerd/gitiles
```

### Supported environment variables

| Key                   | gitiles configuration key | Default                |
| --------------------- |:-------------------------:| ----------------------:|
| `CANONICAL_HOST_NAME` | `canonicalHostName`       | `gitiles`              |
| `BASE_GIT_URL`        | `baseGitUrl`              | `ssh://gitiles:29418/` |
| `SITE_TITLE`          | `siteTitle`               | `gitiles`              |


## Building the image
```
% docker build -t bauerd/gitiles --build-arg GITILES_REV=v0.2-4 .
```

… where `GITILES_REV` is the branch/tag to checkout.
