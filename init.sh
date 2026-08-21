exec java -jar /hath/HentaiAtHome.jar \
     --disable-ip-origin-check \
     --data-dir=/hath/data \
     --temp-dir=/hath/temp \
     --cache-dir=/cache \
     --download-dir=/download \
     --disable_logging \
     --port=${PORT:-60066}
