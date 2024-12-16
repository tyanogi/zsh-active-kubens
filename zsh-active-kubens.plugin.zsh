typeset -g -A kubens_mapping

function kubens_prompt_info() {
  (( $+commands[kubens] )) || return

  local current_ns=$(kubens -c 2> /dev/null)

  [[ -n "$current_ns" ]] || return

  # Use value in associative array if it exists, otherwise fall back to the context name
  #
  # Note: we need to escape the % character in the prompt string when coming directly from
  # the context name, as it could contain a % character.
  echo "${kubens_mapping[$current_ns]:-${current_ns:gs/%/%%}}"
}
