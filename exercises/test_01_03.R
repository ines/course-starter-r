test <- function() {
    # Here we can either check objects created in the solution code.
    # TODO: Update the testTemplate to also include the solution code as a
    # string, so we can work with that. Not sure how to represent that in R?
    # Basically, we want something like Python's x = """string""" so quotes
    # don't mess up the string. Alternative, we could escape/unescape?
    if (some_var != length(data)) {
        stop("Are you getting the correct length?")
    }
}
