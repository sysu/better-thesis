// the circle_numbers function was onced dependency from numblex:0.1.1, but it's
// deprecated by numblex:0.2.0.
// see: https://github.com/ParaN3xus/numblex/commit/a4cffd34382f9bf1ee03c390db6fac7557bd82e0#diff-c27da4fb5421b55d6e49dd2e97447f93760ea39fd3efc7307a09a6f11485977b

#let circle_numbers(n) = {
  return "⓪①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳㉑㉒㉓㉔㉕㉖㉗㉘㉙㉚㉛㉜㉝㉞㉟㊱㊲㊳㊴㊵㊶㊷㊸㊹㊺㊻㊼㊽㊾㊿".clusters().at(n)
}
