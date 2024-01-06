# PewPew definitions generator
# Copyright (c) 2024 PPMS Team.
# This project is licensed under MIT license.

$raw_docs = (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/pewpewlive/ppl-utils/master/docs/raw_documentation.js").Content

# Strip `var documentation = ` to make it compatible with JSON
$raw_docs = $raw_docs.Replace("var documentation = ", "")

$docs_obj = ConvertFrom-Json $raw_docs -AsHashtable

function ConvertTo-LuaTypes {
  param (
    $type_name
  )
  switch ($type_name) {
    "FixedPoint" { return "fixedpoint" }
    "Int32" { return "integer" }
    "String" { return "string" }
    "EntityId" { return "entity_id" }
    "Boolean" { return "boolean" }
    "Callback" { return "function" }
    "Map" { return "table" }
    Default { return "any" }
  }
}

$pewpew = $docs_obj[0]
$fmath = $docs_obj[1]

$code = ""

foreach ($enum in $pewpew.enums) {
  $code += ("---@enum`npewpew.{0} = {1}" -f $enum.name, "{`n")
  for ($i = 0; $i -lt $enum.values.Count; $i++) {
    $code += ("  {0} = {1},`n" -f $enum.values[$i], $i)
  }
  $code += "}`n`n"
}

foreach ($function in $pewpew.functions) {
  $code += ("--- {0}`n" -f $function.comment)
  foreach ($parameter in $function.parameters) {
    $code += ("---@param {0} {1}`n" -f $parameter.name, (ConvertTo-LuaTypes $parameter.type))
  }
  foreach ($return_type in $function.return_types) {
    $code += ("---@return {0}`n" -f (ConvertTo-LuaTypes $return_type.type))
  }
  $params = ""
  for ($i = 0; $i -lt $function.parameters.Count; $i++) {
    if ($i -eq $function.parameters.Count - 1) {
      $params += $function.parameters[$i].name
    } else {
      $params += ("{0}, " -f $function.parameters[$i].name)
    }
  }
  $code += ("function pewpew.{0}({1}) end`n`n" -f $function.func_name, $params)
}

$code += "fmath = {}`n`n"

foreach ($function in $fmath.functions) {
  $code += ("--- {0}`n" -f $function.comment)
  foreach ($parameter in $function.parameters) {
    $code += ("---@param {0} {1}`n" -f $parameter.name, (ConvertTo-LuaTypes $parameter.type))
  }
  foreach ($return_type in $function.return_types) {
    $code += ("---@return {0}`n" -f (ConvertTo-LuaTypes $return_type.type))
  }
  $params = ""
  for ($i = 0; $i -lt $function.parameters.Count; $i++) {
    if ($i -eq $function.parameters.Count - 1) {
      $params += $function.parameters[$i].name
    } else {
      $params += ("{0}, " -f $function.parameters[$i].name)
    }
  }
  $code += ("function fmath.{0}({1}) end`n`n" -f $function.func_name, $params)
}

@"
-- Auto-generated type definitions from ppl-utils (https://github.com/pewpewlive/ppl-utils)
---@meta
---@alias fixedpoint number
---@alias entity_id integer

pewpew = {}

$code
"@ | Out-File -Encoding utf8 -FilePath "./definitions/pewpew.d.lua"