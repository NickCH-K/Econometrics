check_equality_of_vector = function(correctVal) {
  e = get('e', parent.frame())
  if (length(correctVal) != length(e$val)) {
    return(FALSE)
  }
  return(all(correctVal == e$val))
}

check_equality_of_data = function(correctVal) {
  e = get('e', parent.frame())
  return(identical(correctVal, e$val))
}
