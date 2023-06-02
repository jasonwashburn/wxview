FROM continuumio/miniconda3

EXPOSE 5006

RUN conda install -c conda-forge bokeh hvplot matplotlib numpy panel xarray netcdf4

COPY app.py .

CMD ["panel", "serve", "app.py", "--allow-websocket-origin=*"]
