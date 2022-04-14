ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

ARG NODE_VERSION
ARG YARN_VERSION
ENV NPM_CONFIG_LOGLEVEL=info ARCH=x64

RUN addgroup -g 1000 node \
  && adduser -u 1000 -G node -s /bin/sh -D node \
  && apk add --no-cache \
  curl \
  libstdc++ \
  tar \
  xz \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${ARCH}.tar.xz" \
  && tar -xJf "node-v${NODE_VERSION}-linux-${ARCH}.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v${NODE_VERSION}-linux-${ARCH}.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && curl -fsSLO --compressed "https://yarnpkg.com/downloads/${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz" \
  && mkdir -p /opt \
  && tar -xzf "yarn-v${YARN_VERSION}.tar.gz" -C /opt/ \
  && ln -s "/opt/yarn-v${YARN_VERSION}/bin/yarn" /usr/local/bin/yarn \
  && ln -s "/opt/yarn-v${YARN_VERSION}/bin/yarnpkg" /usr/local/bin/yarnpkg \
  && rm "yarn-v${YARN_VERSION}.tar.gz"
