FROM nginx:1.13

RUN apt-get update
RUN apt-get install automake autotools-dev fuse g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config -y

RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git
RUN cd s3fs-fuse
WORKDIR s3fs-fuse
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

ADD nginx.conf /etc/nginx/nginx.conf
ADD run.sh /root/run.sh

CMD echo "/etc/nginx/nginx.conf" "/root/run.sh" | xargs sed -i -e "s/S3_BUCKET/$S3_BUCKET/g" \
  && mkdir -p /media/$S3_BUCKET \
  && bash /root/run.sh
