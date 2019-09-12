FROM python:3.6

# Add tini
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /notebooks

ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888
EXPOSE 5000

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]