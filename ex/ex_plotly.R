y <- c('The course was effectively<br>organized',
       'The course developed my<br>abilities and skills for<br>the subject',
       'The course developed my<br>ability to think critically about<br>the subject',
       'I would recommend this<br>course to a friend')
x1 <- c(21, 24, 27, 29)
x2 <-c(30, 31, 26, 24)
x3 <- c(21, 19, 23, 15)
x4 <- c(16, 15, 11, 18)
x5 <- c(12, 11, 13, 14)

data <- data.frame(y, x1, x2, x3, x4, x5)

top_labels <- c('Strongly<br>agree', 'Agree', 'Neutral', 'Disagree', 'Strongly<br>disagree')

p <- plot_ly(data, x = ~x1, y = ~y, type = 'bar',
             marker = list(color = 'rgba(38, 24, 74, 0.8)',
                           line = list(color = 'rgb(248, 248, 249)', width = 1))) %>%
  add_trace(x = ~x2, marker = list(color = 'rgba(71, 58, 131, 0.8)')) %>%
  add_trace(x = ~x3, marker = list(color = 'rgba(122, 120, 168, 0.8)')) %>%
  add_trace(x = ~x4, marker = list(color = 'rgba(164, 163, 204, 0.85)')) %>%
  add_trace(x = ~x5, marker = list(color = 'rgba(190, 192, 213, 1)')) %>%
  layout(xaxis = list(title = "",
                      showgrid = FALSE,
                      showline = FALSE,
                      showticklabels = FALSE,
                      zeroline = FALSE,
                      domain = c(0.15, 1)),
         yaxis = list(title = "",
                      showgrid = FALSE,
                      showline = FALSE,
                      showticklabels = FALSE,
                      zeroline = FALSE),
         barmode = 'stack',
         paper_bgcolor = 'rgb(248, 248, 255)', plot_bgcolor = 'rgb(248, 248, 255)',
         margin = list(l = 120, r = 10, t = 140, b = 80),
         showlegend = FALSE) %>%
  add_annotations(xref = 'x', yref = 'y',
                  x = x1 / 2, y = y,
                  text = paste(data[,"x1"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE)
p