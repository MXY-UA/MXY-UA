FROM python:3-slim

RUN groupadd -r swuser -g 433 && \
    useradd -u 431 -r -g swuser -s /sbin/nologin -c "Docker image user" swuser

WORKDIR /usr/src/app

USER swuser

COPY index.html ./

CMD ["python","-m","http.server"]

