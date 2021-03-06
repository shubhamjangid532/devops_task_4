FROM centos
COPY myconf /root
COPY ca.crt /root
COPY client.key /root
COPY client.crt /root
RUN mkdir /root/.kube
RUN cp /root/myconf /root/.kube/config
RUN mkdir /home/jenkins
RUN yum install sudo -y
RUN yum install java -y
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/bin
RUN yum install openssh-server -y
RUN ssh-keygen -A
CMD ["/usr/sbin/sshd","-D"]
