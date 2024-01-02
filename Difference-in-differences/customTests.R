check_equality_of_vector = function(correctVal = vec) {
  e = get('e', parent.frame())
  if (length(vec) != length(e$val)) {
    return(FALSE)
  }
  return(all(vec == e$val))
}

check_equality_of_data = function(correctVal = dat) {
  e = get('e', parent.frame())
  return(identical(dat, e$val))
}
