exec java -jar /HentaiAtHome.jar \
     --disable-ip-origin-check \
     --data-dir=/data \
     --temp-dir=/temp \
     --cache-dir=/cache \
     --download-dir=/download \
     --disable_logging \
     --port=${PORT:-60066}
