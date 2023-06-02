import hvplot.pandas  # noqa
import panel as pn
from bokeh.sampledata.autompg import autompg

columns = list(autompg.columns[:-2])

x = pn.widgets.Select(value="mpg", options=columns, name="x")
y = pn.widgets.Select(value="hp", options=columns, name="y")
color = pn.widgets.ColorPicker(name="Color", value="#AA0505")

pn.Row(
    pn.Column("## MPG Explorer", x, y, color),
    pn.bind(autompg.hvplot.scatter, x, y, c=color),
).servable()
