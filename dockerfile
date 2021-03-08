
FROM amazonlinux
LABEL maintainer="max310750@gmail.com"
RUN yum update -y && yum install yum-utils -y
COPY SP1.sh .
RUN chmod ugo+x SP1.sh
CMD ./SP1.sh
