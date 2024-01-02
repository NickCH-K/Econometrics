check_equality_of_vector = function(vec) {
  e = get('e', parent.frame())
  if (length(vec) != length(e$val)) {
    return(FALSE)
  }
  return(all(vec == e$val))
}

