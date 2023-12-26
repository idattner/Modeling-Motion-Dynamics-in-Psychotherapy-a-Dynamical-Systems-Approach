# Load required libraries
library(deSolve)
library(shiny)
library(ggplot2)
library(reshape2)

# Define ODE system
ode_model <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    dX <- alpha*X + beta*Y
    dY <- gamma*X + delta*Y
    list(c(dX, dY))
  })
}

# Define UI
ui <- fluidPage(
  titlePanel("ODE System Exploration"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("alpha", "Alpha:", min = -.5, max = .5, value = 0, step = 0.01),
      sliderInput("beta", "Beta:", min = -1, max = 1, value = 0, step = 0.01),
      sliderInput("gamma", "Gamma:", min = -1, max = 1, value = 0, step = 0.01),
      sliderInput("delta", "Delta:", min = -.5, max = .5, value = 0, step = 0.01),
      sliderInput("init_X", "Initial Therapist Energy:", min = -.5, max = .5, value = 0.5, step = 0.01),
      sliderInput("init_Y", "Initial Patient Energy:", min = -.5, max = .5, value = -0.5, step = 0.01)
    ),
    
    mainPanel(plotOutput("odePlot", width = "800px", height = "600px"))
    
  )
)

# Define server logic
server <- function(input, output) {
  output$odePlot <- renderPlot({
    # Initial conditions from user input
    init <- c(X = input$init_X, Y = input$init_Y)
    
    # Time points
    times <- seq(0, 10, by = 0.01)
    
    # Parameters from user input
    parameters <- c(alpha = input$alpha, beta = input$beta, gamma = input$gamma, delta = input$delta)
    
    # Solve ODE
    out <- ode(y = init, times = times, func = ode_model, parms = parameters)
    
    # Convert output to data frame for plotting
    out_df <- as.data.frame(out)
    names(out_df) <- c("Time", "Therapist", "Patient")
    
    # Melt the data frame for ggplot2
    out_melt <- reshape2::melt(out_df, id.vars = "Time", variable.name = "Role", value.name = "MotionEnergy")
    
    # Compute ratios
    total_abs_params <- sum(abs(parameters))
    thself <- abs(parameters["alpha"]) / total_abs_params
    thint <- abs(parameters["beta"]) / total_abs_params
    paint <- abs(parameters["gamma"]) / total_abs_params
    paself <- abs(parameters["delta"]) / total_abs_params
    
    # Generate plot
    
    ggplot(out_melt, aes(x = Time, y = MotionEnergy, color = Role)) +
      geom_line() +
      labs(
        title = "Therapist-Patient Dynamics",
        subtitle = paste("Therapist self-damping/reinforcing ratio (Thself) =", 100*round(thself, 2),"%",
                         "\nTherapist interaction ratio (Thint) =", 100*round(thint, 2),"%",
                         "\nPatient interaction ratio (Paint) =", 100*round(paint, 2),"%",
                         "\nPatient self-damping/reinforcing ratio (Paself) =", 100*round(paself, 2),"%"),
        x = "Time", 
        y = "Motion Energy", 
        color = "Role"
      ) +
      theme_minimal() +
      scale_color_manual(values = c("Therapist" = "blue", "Patient" = "red")) +
      ylim(-3, 3) +
      theme(
        plot.title = element_text(size = 35),
        plot.subtitle = element_text(size = 25),
        axis.title = element_text(size = 25),
        legend.text = element_text(size = 20)
      )
   
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
