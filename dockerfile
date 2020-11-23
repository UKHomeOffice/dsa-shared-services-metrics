FROM quay.io/ukhomeofficedigital/python-alpine:3.7.6-alpine3.11

RUN mkdir -p /APP/scripts/
ENV USERMAP_UID 1000
WORKDIR /APP/scripts/
EXPOSE 8000
RUN pip install requests
RUN pip install schedule
COPY scripts/ /APP/scripts/
RUN adduser -D -H 1000 && chown -R 1000 /APP
RUN chmod -R +x /APP/scripts
RUN chmod +x run.sh
USER ${USERMAP_UID}
CMD ["./run.sh"]
