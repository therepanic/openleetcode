FROM haskell:9.8-slim-bullseye AS build

WORKDIR /src

COPY cabal.project openleetcode.cabal ./
COPY cli ./cli
COPY core ./core

RUN cabal update \
    && cabal build exe:openleetcode \
    && exe="$(find dist-newstyle -type f -path '*/x/openleetcode/build/openleetcode/openleetcode' | head -n 1)" \
    && test -n "$exe" \
    && install -D "$exe" /out/openleetcode

FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates libgmp10 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY --from=build /out/openleetcode /usr/local/bin/openleetcode

ENTRYPOINT ["openleetcode"]
