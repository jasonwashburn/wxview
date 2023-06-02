FROM continuumio/miniconda3:23.3.1-0

EXPOSE 5006

WORKDIR /app

COPY environment.yml .

RUN conda env create -f environment.yml \
    && echo "conda activate wxview" >> ~/.bashrc

SHELL [ "/bin/bash", "--login", "-c" ]

COPY app.py .

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
