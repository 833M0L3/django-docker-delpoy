FROM python:3.9-alpine3.18
LABEL maintainer="Indreniv2"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./Indreniv2 /Indreniv2
COPY ./scripts /scripts

WORKDIR /Indreniv2
EXPOSE 6060

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home indreni && \
    mkdir -p /database && \
    mkdir -p /vol/web/media && \
    mkdir -p /vol/web/static && \
    chown -R indreni:indreni /vol && \
    chmod -R 777 /vol && \
    chmod -R +x /scripts


ENV PATH="/scripts:/py/bin:$PATH"

USER indreni

CMD ["run.sh"]