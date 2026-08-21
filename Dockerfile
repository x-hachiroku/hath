FROM docker.io/library/eclipse-temurin:25-jdk-jammy AS build

WORKDIR /build

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget "https://repo.e-hentai.org/hath/HentaiAtHome_1.6.5_src.zip"

RUN mkdir source \
    && unzip HentaiAtHome_1.6.5_src.zip -d source \
    && cd source \
    && mkdir -p build \
    && find src -type f -name '*.java' -print > build/srcfiles.txt \
    && javac -d build @build/srcfiles.txt \
    && jar cfm build/HentaiAtHome.jar src/hath/base/HentaiAtHome.manifest -C build hath/base


FROM docker.io/library/eclipse-temurin:25-jre-jammy

WORKDIR /hath

COPY --from=build /build/source/build/HentaiAtHome.jar /hath
COPY init.sh /hath

CMD ["/hath/init.sh"]
