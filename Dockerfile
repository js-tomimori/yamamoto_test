FROM public.ecr.aws/amazoncorretto/amazoncorretto:17
WORKDIR /app

ARG PORT=80

ENV HEALTH_CHECK_PATH=/
ENV CONTEXT_PATH=/
ENV PROJECT_DEFAULT_TOKEN=saec-apl-root
# ENV SEED_DATA_PATH=seed.json

ENV DB_USERNAME=sasystem

ENV URL=http://localhost:${PORT}
ENV FSS_EXTERNAL_BASE_URL=${URL}
ENV FSS_SVC_URL=${URL}

COPY ./app.jar .
COPY ./application-prod.yml .
# COPY ./${SEED_DATA_PATH} .

EXPOSE ${PORT}

ENTRYPOINT ["java", "-Xmx1g", "-Xms1g", "-Dfile.encoding=UTF-8", "-jar", "app.jar"]