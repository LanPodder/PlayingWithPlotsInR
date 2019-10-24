library(plotly)
library(htmltools)
library(htmlwidgets)

plot_to_html <- function(plot, htmlname) {
    htmlwidgets::saveWidget(as_widget(plot), htmlname)
}

p <- plot_ly(z=~volcano) %>% add_surface(
    contours = list(
        z = list(
            show=TRUE,
            usecolormap=TRUE,
            highlightcolor="#ff0000",
            project=list(z=TRUE)
        )
    )
)%>%
layout(
    scene = list(
        camera=list(
            eye = list(x=1.87, y=0.88, z=-0.64)
        )
    )
)


#plot_to_html(p, "volcano.html")


ec <- plot_ly(economics, x = ~date, y = ~unemploy / pop)

#plot_to_html(ec, "economics.html")

carpetp <- plot_ly(
    type = 'carpet',
    a = c(4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6, 6, 6),
    b = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3),
    y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10),
    aaxis = list(
        tickprexix = 'a = ',
        ticksuffix = 'm',
        smoothing = 1,
        minorgridcount = 9,
        minorgridwidth = 0.6,
        minorgridcolor = 'white',
        gridcolor = 'white',
        color = 'white'
    ),
    baxis = list(
        tickprefix = 'b = ',
        ticksuffix = 'Pa',
        smoothing = 1,
        minorgridcount = 9,
        minorgridwidth = 0.6,
        minorgridcolor = 'white',
        gridcolor = 'white',
        color = 'white'
    )
) %>%
layout(
    plot_bgcolor = 'black', 
    paper_bgcolor = 'black',
    xaxis = list(showgrid = F, showticklabels = F),
    yaxis = list(showgrid = F, showticklabels = F)
)
    

#plot_to_html(carpetp, "carpet.html")

dfiris <- read.csv("https://raw.githubusercontent.com/bcdunbar/datasets/master/iris.csv")

irisp <- dfiris %>%
plot_ly(type = 'parcoords',
    line = list(color = ~species_id,
    colorscale = list(c(0,'red'),c(0.5,'green'),c(1,'blue'))),
    dimensions = list(
        list(range = c(2,4.5),
            label = 'Sepal Width', values = ~sepal_width),
        list(range = c(4,8),
            constraintrange = c(5,6),
            label = 'Sepal Length', values = ~sepal_length),
        list(range = c(0,2.5),
            label = 'Petal Width', values = ~petal_width),
        list(range = c(1,7),
            label = 'Petal Length', values = ~petal_length)
    )
)

plot_to_html(irisp, "iris.html")