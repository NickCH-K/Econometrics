# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.

check_equality_of_vector = function(vec) {
  e = get('e', parent.frame())
  if (length(vec) != length(e$val)) {
    return(FALSE)
  }
  return(all(vec == e$val))
}

check_equality_of_data = function(dat) {
  e = get('e', parent.frame())
  return(identical(dat, e$val))
}
