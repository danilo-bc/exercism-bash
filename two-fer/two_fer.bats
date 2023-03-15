#!/usr/bin/env bats
load bats-extra

# local version: 1.2.0.1

@test "no name given" {
  run bash two_fer.sh
  assert_success
  assert_output "One for you, one for me."  
}

@test "a name given" {
  run bash two_fer.sh Alice
  assert_success
  assert_output "One for Alice, one for me."
}

@test "another name given" {
  run bash two_fer.sh Bob
  assert_success
  assert_output "One for Bob, one for me."
}

# bash-specific test: Focus the student's attention on the effects of
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

@test "handle arg with spaces" {
  run bash two_fer.sh "John Smith" "Mary Ann"
  assert_success
  assert_output "One for John Smith, one for me."
}

@test "handle arg with glob char" {
  run bash two_fer.sh "* "
  assert_success
  assert_output "One for * , one for me."
}
