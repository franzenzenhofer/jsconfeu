h = require("http")
o = 
  host: "search.twitter.com"
  path: "/search.json?q=jsconf+OR+jsconfeu&since_id="

z = (l) ->
  o.path=o.path+l
  h.get o, (a) ->
    d = ""
    a.on "data", (b) ->
      d += b
  
    
    
    a.on "end", ->
      e = JSON.parse(d).results
      f = []
      c = 0
      a = e.length
      l=''
      while c < a
        b = e[c]
        f.push(console.log(b.from_user + ": \"" + b.text + "\"\n"))
        l=b.id_str
        c++
      f
      
      setTimeout(z, 3500, [l])
      
    

z('')

