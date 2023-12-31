FROM python:3.11-slim-bullseye

WORKDIR /app

ENV YT_DLP_VERSION=2023.11.16
ENV PATH=/venv/bin:$PATH

RUN :\
    && python -m venv /venv \
    && pip install --no-cache-dir pip -U wheel setuptools yt-dlp==${YT_DLP_VERSION} \
    && :

COPY setup.cfg setup.py top_plays.py ./

RUN :\
    && pip install --no-cache-dir /app/ \
    && :

CMD ["top-plays"]
