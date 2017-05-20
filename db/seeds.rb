Admin.create!([
  {name: "Abayo", email: "luc.bayo@gmail.com", password_digest: "$2a$10$dDXx8HLn44cx0dXn8qKDqeHECl.G8qGH95DLpqPwPpSPSUtj6SdKS", identity: "1199580072604146"}
])
Comment.create!([
  {name: "luc", email: "luc@example.com", body: "Hello world", web: "www.exammple.com", post_id: nil},
  {name: "Joseph", email: "joseph@example.com", body: "Hello Rwanda", web: "www.nexpals.info", post_id: 2},
  {name: "Josh", email: "josh@example.com", body: "Cool", web: "www.nexpals.info", post_id: 1},
  {name: "Nara", email: "nara@example.com", body: "I see", web: "www.nexpals.info", post_id: 1},
  {name: "Jean Luc", email: "luc.bayo@nexpals.com", body: "I seee", web: "www.nexpals.info", post_id: 1}
])
Post.create!([
  {title: "Hello World", body: "Come on", intro: "This is it"}
])
