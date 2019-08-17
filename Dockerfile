FROM continuumio/anaconda3

RUN apt-get update && \
    apt-get install -y vim \
                       python3-pip && \
    /opt/conda/bin/conda install jupyter -y --quiet && \
    mkdir /opt/notebooks

# set working directory
WORKDIR /opt/notebooks

# add app
COPY notebooks/ .

EXPOSE 8888

CMD /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --allow-root --NotebookApp.token='demo'
