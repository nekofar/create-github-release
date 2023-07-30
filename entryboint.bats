#!/usr/bin/env bats

@test "Check required INPUT_TAG" {
  run bash entrypoint.sh
  [ "$status" -eq 1 ]
  [ "$output" = "Error: 'tag' input is required but not provided." ]
}

@test "Check valid token" {
  export INPUT_TAG='tag'
  export INPUT_TOKEN='token'
  run bash entrypoint.sh
  [ "$status" -eq 1 ]
  [ "$output" = "Error: 'token' input does not appear to be a valid GitHub token." ]
}
