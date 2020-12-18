import json
import net
import strformat
import posix

type Coordinate = tuple[x: float, y: float, z: float]

proc calc(text: string): Coordinate =
  let jobj = parseJson(text)

  let coordinates = jobj["coordinates"].elems
  let len = float(coordinates.len)
  var x = 0.0
  var y = 0.0
  var z = 0.0

  for coord in coordinates:
    x += coord["x"].fnum
    y += coord["y"].fnum
    z += coord["z"].fnum

  result = (x: x / len, y: y / len, z: z / len)

# when isMainModule:
#   let right = (x: 2.0, y: 0.5, z: 0.25)
#   for v in ["""{"coordinates":[{"x":2.0,"y":0.5,"z":0.25}]}""",
#             """{"coordinates":[{"y":0.5,"x":2.0,"z":0.25}]}"""]:
#     let left = calc(v)
#     if left != right:
#       stderr.writeLine(&"{left} != {right}")
#       quit(1)

#   let text = "/tmp/1.json".readFile()

#   var compiler = "Nim/clang"
#   when defined(gcc):
#     compiler = "Nim/gcc"

#   notify(&"{compiler}\t{getpid()}")
var ppp : string = "/home/alexg/projects/lesson1.nim"
for line in  ppp.readLines(n = 5):
  echo line

for line in  ppp.lines():
  echo line

# let results = calc(text)
#   notify("stop")

# echo text